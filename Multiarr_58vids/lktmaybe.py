import numpy as np 
import cv2 
import os

# Directory containing the videos
video_dir = r'C:\Users\UmurY\OneDrive\Masaüstü\Multiarr_58vids\15videos'
# Directory to save the processed videos
output_dir = r'C:\Users\UmurY\OneDrive\Masaüstü\KLTprocesed'

feature_params = dict(maxCorners=100, qualityLevel=0.3, minDistance=7, blockSize=7)
lk_params = dict(winSize=(15, 15), maxLevel=2, criteria=(cv2.TERM_CRITERIA_EPS | cv2.TERM_CRITERIA_COUNT, 10, 0.03))
color = np.random.randint(0, 255, (100, 3))

# Process each video file in the directory
for filename in os.listdir(video_dir):
    if filename.endswith(".avi"): 
        video_path = os.path.join(video_dir, filename)
        cap = cv2.VideoCapture(video_path)

        ret, old_frame = cap.read() 
        old_gray = cv2.cvtColor(old_frame, cv2.COLOR_BGR2GRAY) 
        p0 = cv2.goodFeaturesToTrack(old_gray, mask=None, **feature_params) 

        mask = np.zeros_like(old_frame) 

        while(1): 
            ret, frame = cap.read() 
            if not ret:
                break
            frame_gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY) 

            p1, st, err = cv2.calcOpticalFlowPyrLK(old_gray, frame_gray, p0, None, **lk_params) 

            good_new = p1[st == 1] 
            good_old = p0[st == 1] 

            for i, (new, old) in enumerate(zip(good_new, good_old)):
                a, b = new.ravel().astype(int)
                c, d = old.ravel().astype(int)
                mask = cv2.line(mask, (a, b), (c, d), color[i].tolist(), 2)

            img = cv2.add(frame, mask) 

            cv2.imshow('frame', img) 

            k = cv2.waitKey(25) 
            if k == 27: 
                break

            old_gray = frame_gray.copy() 
            p0 = good_new.reshape(-1, 1, 2) 

        cv2.destroyAllWindows() 
        cap.release() 

        # Save the processed video with a new name in the output directory
        output_path = os.path.join(output_dir, 'LK_Flow_' + filename)
        cv2.imwrite(output_path, img)