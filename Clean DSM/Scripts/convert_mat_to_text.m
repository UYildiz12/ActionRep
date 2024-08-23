
% STEP 3: in regressors

save rp rp;
load('regres_gabor_vect.mat')
load('regres_lum_vect.mat')
load('regres_motion_vect.mat')
all_regres = [rp regres_gabor_vect regres_motion_vect regres_lum_vect];
save all_regres all_regres



load('all_regres.mat');
dlmwrite('all_regres.txt', all_regres, 'delimiter', '\t', 'newline', 'pc');