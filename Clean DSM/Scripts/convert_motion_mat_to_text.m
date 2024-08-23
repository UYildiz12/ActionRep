
cd('/Users/burcuaysenurgen/Studies/SPM_ActionClustersBIDS_Subj04_Sess1/ses-1/run8/');
load('confounds_matrix.mat');
dlmwrite('confounds_matrix.txt', confounds_matrix, 'delimiter','\t');

clear all
clc
