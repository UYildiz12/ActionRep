
import cv2
import numpy as np
import os
import re
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import matplotlib.patches as mpatches

video_dir = r'C:\Users\UmurY\OneDrive\Masaüstü\Action_Clusters_Python\Raw_Files\VideosF\VideosFixed'
df = pd.DataFrame(columns=['ave_vid']) 
video_files = [f for f in os.listdir(video_dir) if f.endswith('.avi')]
video_groups = {}
for video_file in video_files:
    number = re.match(r'(\d+)', video_file).group(1)
    if number not in video_groups:
        video_groups[number] = []
    video_groups[number].append(os.path.join(video_dir, video_file))

group_optical_flow_descriptors = {}

for group, videos in video_groups.items():
    frames_lists = [] 
    for video in videos:
        frames = []  
        video_capture = cv2.VideoCapture(video)
        frame_counter = 0 
        nth_frame = 10
        while True:
            ret, frame = video_capture.read()
            if not ret:
                break
            if frame_counter % nth_frame == 0: 
                frame = cv2.resize(frame, (0,0), fx=0.5, fy=0.5)  # Downsample frame by 50%
                frames.append(frame)  
            frame_counter += 1  
        video_capture.release()
        frames_lists.append(frames)  
    group_optical_flow_descriptors[group] = frames_lists  

motion_descriptors_v1 = []
motion_descriptors_v2 = []
optical_flow_vectors = []  
for group, frame_lists in group_optical_flow_descriptors.items():
    for frames in frame_lists:
        for i in range(len(frames)):
            if i==0:
                prev_frame = cv2.cvtColor(frames[0], cv2.COLOR_BGR2GRAY)
                i+=1
            current_frame = cv2.cvtColor(frames[i], cv2.COLOR_BGR2GRAY)
            flow = cv2.calcOpticalFlowFarneback(prev_frame, current_frame, None, 0.5, 3, 15, 3, 5, 1.2, 0)
            optical_flow_vectors.append(flow)
            prev_frame = current_frame
    
    vid1=optical_flow_vectors[0:15]
    vid2=optical_flow_vectors[15:30]
    vid1 = np.array(vid1)
    vid2 = np.array(vid2) 
    for i in range(len(vid1)):
        vid1_motion_x = np.round(vid1[i][:, :, 0], 4)
        vid1_motion_y = np.round(vid1[i][:, :, 1], 4)
        vid1_magnitude, angle = cv2.cartToPolar(vid1_motion_x, vid1_motion_y)
        vid2_motion_x = np.round(vid2[i][:, :, 0], 4)
        vid2_motion_y = np.round(vid2[i][:, :, 1], 4)
        vid2_magnitude, angle = cv2.cartToPolar(vid2_motion_x, vid2_motion_y)
        vid1_motion_descriptor = np.stack((vid1_motion_x, vid1_motion_y, vid1_magnitude), axis=-1)
        vid2_motion_descriptor = np.stack((vid2_motion_x, vid2_motion_y, vid2_magnitude), axis=-1)
        motion_descriptors_v1.append(vid1_motion_descriptor)
        motion_descriptors_v2.append(vid2_motion_descriptor)
        
      

    motion_descriptors_v1 = np.array(motion_descriptors_v1)
    motion_descriptors_v2 = np.array(motion_descriptors_v2)
    ave_vid = (motion_descriptors_v1 + motion_descriptors_v2) / 2
    df.loc[group] = [ave_vid]
    
    motion_descriptors_v2 = []
    motion_descriptors_v1 = []
    optical_flow_vectors = []  

from scipy.spatial.distance import pdist, squareform

df['flattened'] = df['ave_vid'].apply(lambda x: x.flatten())

distances = pdist(df['flattened'].tolist(), metric='euclidean')
dissimilarity_matrix = pd.DataFrame(squareform(distances), index=df.index, columns=df.index)

global_max = dissimilarity_matrix.max().max()
global_min = dissimilarity_matrix.min().min()

df_scaled = (dissimilarity_matrix - global_min) / (global_max - global_min)
df_scaled.columns = df_scaled.columns.astype(int)
df_scaled.index = df_scaled.index.astype(int)

groups = [
    ('passive_inter', [4,35, 58, 63, 89, 94]),
    ('active_inter', [36, 42, 47, 59, 75, 98]),
    ('comm_symbolic', [40, 51, 57]),
    ('comm_vocal', [2, 28, 85, 95]),
    ('manipulation', [7, 12, 13, 31, 50, 53, 96]),
    ('modify_substrate', [22, 44, 46, 64, 99]),
    ('digestion', [17, 21, 41, 72,88,92]),
    ('skin_displacement', [15, 16, 23, 70]),
    ('aim_in_space', [8, 20, 49, 71, 78, 87,100]),
    ('locomotion_b', [55, 62, 68]),
    ('locomotion_q', [5,24,27,48,74, 77, 82])
]
order = [index for group in groups for index in group[1]]
df_scaled = df_scaled.reindex(order)
df_scaled = df_scaled[order]
df_scaled.index = df_scaled.index.map(str).map('A{}'.format)
df_scaled.columns = df_scaled.columns.map(str).map('A{}'.format)  
plt.figure(figsize=(16, 14))

heatmap=sns.heatmap(df_scaled, cmap='coolwarm')
yticks = heatmap.get_yticklabels()
xticks=heatmap.get_xticklabels()
colors = ['red', 'blue', 'green', 'purple', 'orange', 'brown', 'pink', 'gray', 'olive', 'cyan', 'magenta']
groups = [
    ('passive_inter', [4,35, 58, 63, 89, 94]),
    ('active_inter', [36, 42, 47, 59, 75, 98]),
    ('comm_symbolic', [40, 51, 57]),
    ('comm_vocal', [2, 28, 85, 95]),
    ('manipulation', [7, 12, 13, 31, 50, 53, 96]),
    ('modify_substrate', [22, 44, 46, 64, 99]),
    ('digestion', [17, 21, 41, 72,88,92]),
    ('skin_displacement', [15, 16, 23, 70]),
    ('aim_in_space', [8, 20, 49, 71, 78, 87, 100]),
    ('locomotion_b', [55, 62, 68]),
    ('locomotion_q', [5,24,27,48,74, 77, 82])
]

start = 0
for j,(group_name,indexes) in enumerate(groups):
    end = start + len(indexes)
    for i in range(start,end):
        yticks[i].set_color(colors[j])
        xticks[i].set_color(colors[j])
    start = end


  
heatmap.set_yticklabels(yticks)
patches = [mpatches.Patch(color=colors[i], label=name) for i,(name,indexes) in enumerate(groups)]
legend = plt.legend(handles=patches,bbox_to_anchor=(1.20,1), loc=2)
plt.setp(legend.get_texts(), fontsize='x-large') 

plt.show()
