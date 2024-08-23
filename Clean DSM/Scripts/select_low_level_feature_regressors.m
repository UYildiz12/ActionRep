

function [] = select_low_level_feature_regressors(runNo)

cd('/Users/burgen/Studies/Action100_BILKENT/Scripts/');
load('vector_gabor_actions.mat');
load('vector_motion_actions.mat');
load('vector_lum_actions.mat');

path = ['/Users/burgen/Studies/Action100_BILKENT/subjects/subject01/ses-1/run' num2str(runNo)];
cd(path);
load('conditions.mat');

indices = [];
for i = 1:length(names)
    indices(i) = str2num(names{i});
end

regres_gabor = vector_gabor_actions(indices);
regres_motion = vector_motion_actions(indices);
regres_lum = vector_lum_actions(indices);

save regres_gabor regres_gabor
save regres_motion regres_motion
save regres_lum regres_lum

end

