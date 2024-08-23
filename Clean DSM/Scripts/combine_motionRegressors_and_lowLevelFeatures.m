
function [] = combine_motionRegressors_and_lowLevelFeatures(runNo)

path = ['/Users/burgen/Studies/Action100_BILKENT/subjects/subject01/ses-1/run' num2str(runNo)];
cd(path);

load('confounds_matrix.mat');
load('regressor_array_gabor.mat');
load('regressor_array_lum.mat');
load('regressor_array_motion.mat');

regressor_array_gabor = regressor_array_gabor';
regressor_array_lum = regressor_array_lum';
regressor_array_motion = regressor_array_motion';


confounds_matrix_REGRESS = [confounds_matrix regressor_array_gabor regressor_array_lum regressor_array_motion];
dlmwrite('confounds_matrix_REGRESS.txt', confounds_matrix_REGRESS, 'delimiter', '\t', 'newline', 'pc');
/Users/burgen/Desktop/Icloud_Desktop/Research/Projects/ActionClustersfMRI/Scripts/combine_motionRegressors_and_lowLevelFeatures.m
end