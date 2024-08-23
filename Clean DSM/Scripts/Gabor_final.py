import cv2
import numpy as np
import os
import re
import pandas as pd
import math
from scipy.spatial.distance import pdist, squareform
import seaborn as sns
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches

def gaborfilt_OpenCV_likeMATLAB(image, wavelength, orientation, SpatialFrequencyBandwidth=1, SpatialAspectRatio=0.5):
   
    orientation = -orientation / 180 * math.pi 
    sigma = 0.5 * wavelength * SpatialFrequencyBandwidth
    gamma = SpatialAspectRatio
    shape = 1 + 2 * math.ceil(4 * sigma)  
    shape = (shape, shape)
    gabor_filter_real = cv2.getGaborKernel(shape, sigma, orientation, wavelength, gamma, psi=0)
    gabor_filter_imag = cv2.getGaborKernel(shape, sigma, orientation, wavelength, gamma, psi=math.pi / 2)
    filtered_image = cv2.filter2D(image, -1, gabor_filter_real) + 1j * cv2.filter2D(image, -1, gabor_filter_imag)
    mag = np.abs(filtered_image)
    phase = np.angle(filtered_image)
    return mag, phase

video_dir = r'C:\Users\UmurY\OneDrive\Masaüstü\Action_Clusters_Python\Raw_Files\VideosF\VideosFixed'
df = pd.DataFrame(columns=['ave_vid']) 
video_files = [f for f in os.listdir(video_dir) if f.endswith('.avi')]
video_groups = {}
for video_file in video_files:
    number = re.match(r'(\d+)', video_file).group(1)
    if number not in video_groups:
        video_groups[number] = []
    video_groups[number].append(os.path.join(video_dir, video_file))

group_gabor_descriptors = {}
orientations = [0, 45, 90, 135]
scales = [4, 8, 16]
frequencies = [0.5, 1.0]

for group, videos in video_groups.items():
    group_frames = [] 
    for video in videos:
        frames = []  
        video_capture = cv2.VideoCapture(video)
        assert video_capture.isOpened(), f"Failed to open video: {video}"  # Check if the video file was opened successfully
        frame_counter = 0 
        nth_frame = 10
        while True:
            ret, frame = video_capture.read()
            if not ret:
                break
            if frame_counter % nth_frame == 0: 
                frame = cv2.resize(frame, (0,0), fx=0.4, fy=0.4)  
                frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)  
                gabor_images = []
                for theta in orientations:
                    for scale in scales:
                        for freq in frequencies:
                            wavelength = scale / freq
                            mag, phase = gaborfilt_OpenCV_likeMATLAB(frame, wavelength, theta)
                            gabor_images.append(mag)
                frames.append(gabor_images)
                cv2.destroyAllWindows()
            frame_counter += 1  
        video_capture.release()
        assert frames, f"No frames were processed for video: {video}"  
        group_frames.append(frames)  
    avg_frames = np.mean(group_frames, axis=0)
    group_gabor_descriptors[group] = avg_frames
groups = [
    ('passive_inter', [4, 35, 58, 63, 89, 94]),
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
group_descriptors = {group: np.mean(descriptors, axis=0) for group, descriptors in group_gabor_descriptors.items()}
flattened_group_descriptors = [descriptor.flatten() for descriptor in group_descriptors.values()]
distances = pdist(flattened_group_descriptors, metric='euclidean')
dissimilarity_matrix = pd.DataFrame(squareform(distances))
keys = list(group_gabor_descriptors.keys())
dissimilarity_matrix = pd.DataFrame(dissimilarity_matrix.values, index=keys, columns=keys)
global_max = dissimilarity_matrix.max().max()
global_min = dissimilarity_matrix.min().min()
df_scaled = (dissimilarity_matrix - global_min) / (global_max - global_min)
df_scaled.columns = df_scaled.columns.astype(int)
df_scaled.index = df_scaled.index.astype(int)


order = [index for group in groups for index in group[1]]
df_scaled = df_scaled.reindex(index=order, columns=order)
df_scaled = df_scaled[order]
df_scaled.index = df_scaled.index.map(str).map('A{}'.format)
df_scaled.columns = df_scaled.columns.map(str).map('A{}'.format)  
plt.figure(figsize=(16, 14))

heatmap=sns.heatmap(df_scaled, cmap='coolwarm')
yticks = heatmap.get_yticklabels()
xticks=heatmap.get_xticklabels()
colors = ['red', 'blue', 'green', 'purple', 'orange', 'brown', 'pink', 'gray', 'olive', 'cyan', 'magenta']
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
