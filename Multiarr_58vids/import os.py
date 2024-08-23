import os
import numpy as np
from nilearn import image
from nilearn.datasets import fetch_neurovault_ids
from nilearn.masking import apply_mask
from nilearn.image import load_img, save_img
from cosmo.datasets import cosmo_fmri_dataset
from cosmo.learn.embed import cosmo_map2fmri

# Define variables
subno = 2
combined_mask_path = r'C:\Users\UmurY\OneDrive\Masaüstü\Action_Clusters_Python\Raw_Files\ROI\combined.nii'
model_names = ['Action_Class_roi', 'HmaxC1_roi','Opticalflow_roi',"Noofpeople_roi","Background_roi"]
group_path = r'C:\Users\UmurY\OneDrive\Masaüstü\Action_Clusters_Python\Raw_Files\Grlev'

# Load and create binary mask
combnii = image.load_img(combined_mask_path)
combinedmask_data = combnii.get_fdata() > 0 

# Save combined mask
save_img(combined_mask_path, combinedmask_data.astype(np.uint8))

# Loop through subjects and models
for sub in range(1, subno + 1):
    analysis_path = os.path.join(r'C:\Users\UmurY\OneDrive\Masaüstü\Action_Clusters_Python\Raw_Files\Sub%d_WB_Rel\subject_level\active' % sub)
    for modelno in range(len(model_names)):
        # Load dataset and apply mask
        ds = cosmo_fmri_dataset(os.path.join(group_path, f'mr_rsa_roi_full_{model_names[modelno]}.nii'))
        ds = cosmo_slice(ds, sub)
        ds.samples[~combinedmask_data] = 0

        # Save masked data
        output_fn = os.path.join(analysis_path, f'output_sub{sub}_model{model_names[modelno]}_roi.nii')
        cosmo_map2fmri(ds, output_fn)