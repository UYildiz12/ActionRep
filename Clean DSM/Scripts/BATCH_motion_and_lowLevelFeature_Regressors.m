
% BATCH function that creates the regressor matrix consisting of motion
% regressors and low_level_features (gabor, luminance, motion) and will be
% passes to the first level GLM.
% Subject 1, session 1, 8 runs
for i = 1:8
    select_low_level_feature_regressors(i);
    create_regressor_array_for_newDesign_gabor(i);
    create_regressor_array_for_newDesign_luminance(i);
    create_regressor_array_for_newDesign_motion(i);
    combine_motionRegressors_and_lowLevelFeatures(i);
end