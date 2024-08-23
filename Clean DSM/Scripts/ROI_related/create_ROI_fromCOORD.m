clear all
%vals = 
load('MTGrh.mat');
%And then you need an affine matrix from an example MNI image:
vals=coords;
pth = spm('dir');
fname = fullfile(pth, 'templates', 'T1.nii');
affine = spm_get_space(fname);
%Then something like:
params = struct('XYZ', vals', 'mat', affine); % note vals' should be 3 by N
roi = maroi_pointlist(params, 'mm');
saveroi(roi, 'MTGrh_roi.mat');