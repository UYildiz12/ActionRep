
cd('/Users/burcuaysenurgen/Studies/ActionClustersBIDS_Subj04_Sess1/derivatives/fmriprep/sub-01/ses-1/func/');
confounds = spm_load('sub-01_ses-1_task-action_run-08_desc-confounds_regressors.tsv');
confounds_matrix = [confounds.trans_x, confounds.trans_y, confounds.trans_z, confounds.rot_x, confounds.rot_y, confounds.rot_z];

cd('/Users/burcuaysenurgen/Studies/SPM_ActionClustersBIDS_Subj04_Sess1/ses-1/run8/')
save confounds_matrix confounds_matrix

clear all
clc




