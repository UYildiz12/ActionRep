%% Selecting voxels based on reliability

%% Reliability 1 - split half
beta_path1 = '/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_1/';
cd(beta_path1);

action_beta_indices1 = [1:4:197, 207:4:403, 413:4:609, 619:4:815, 825:4:1021, 1031:4:1227, 1237:4:1433, 1443:4:1639];

betas1 = [];
allvoxels1 = [];
for t = action_beta_indices1
    
    if t >= 1 && t <= 9
        filename = ['beta_000' num2str(t) '.nii'];
    elseif t >= 10 && t <= 99
        filename = ['beta_00' num2str(t) '.nii'];
    elseif t >= 100 && t <= 999
        filename = ['beta_0' num2str(t) '.nii'];
    elseif t >= 1000 && t < 1640
        filename = ['beta_' num2str(t) '.nii'];
    end
       
    Matrix = spm_read_vols(spm_vol(filename));
    allvoxels1 = Matrix(:)';
    betas1 = [betas1 ; allvoxels1]; % betas x voxels (400 x ~500000)
    
end

% BETAS
sess1_run12= betas1(1:100,:);
sess1_run56 = betas1(101:200,:);
sess2_run12 = betas1(201:300,:);
sess2_run56 = betas1(301:400,:);

% CONDITION NAMES
load('Reliability1_condition_names.mat');
names_sess1_run12 = Reliability1_condition_names(1:100);
names_sess1_run56 = Reliability1_condition_names(101:200);
names_sess2_run12 = Reliability1_condition_names(201:300);
names_sess2_run56 = Reliability1_condition_names(301:400);

% SORTED CONDITION NAMES
[Y1 I1] = sort(names_sess1_run12);
[Y2 I2] = sort(names_sess1_run56);
[Y3 I3] = sort(names_sess2_run12);
[Y4 I4] = sort(names_sess2_run56);


% SORTED BETAS
Rel1_sorted_action_betas_v1 = sess1_run12(I1,:);
Rel1_sorted_action_betas_v2 = sess1_run56(I2,:);
Rel1_sorted_action_betas_v3 = sess2_run12(I3,:);
Rel1_sorted_action_betas_v4 = sess2_run56(I4,:);

Rel1_sorted_action_betas(:,:,1) = Rel1_sorted_action_betas_v1;
Rel1_sorted_action_betas(:,:,2) = Rel1_sorted_action_betas_v2;
Rel1_sorted_action_betas(:,:,3) = Rel1_sorted_action_betas_v3;
Rel1_sorted_action_betas(:,:,4) = Rel1_sorted_action_betas_v4;

MEAN_Rel1_sorted_action_betas = mean(Rel1_sorted_action_betas,3)';
save MEAN_Rel1_sorted_action_betas MEAN_Rel1_sorted_action_betas

clear all
clc

%% Reliability 2 - split half

beta_path2 = '/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_2/';
cd(beta_path2);

action_beta_indices2 = [1:4:197, 207:4:403, 413:4:609, 619:4:815, 825:4:1021, 1031:4:1227, 1237:4:1433, 1443:4:1639];

betas2 = [];
allvoxels2 = [];
for t = action_beta_indices2
    
    if t >= 1 && t <= 9
        filename = ['beta_000' num2str(t) '.nii'];
    elseif t >= 10 && t <= 99
        filename = ['beta_00' num2str(t) '.nii'];
    elseif t >= 100 && t <= 999
        filename = ['beta_0' num2str(t) '.nii'];
    elseif t >= 1000 && t < 1640
        filename = ['beta_' num2str(t) '.nii'];
    end
       
    Matrix = spm_read_vols(spm_vol(filename));
    allvoxels2 = Matrix(:)';
    betas2 = [betas2 ; allvoxels2]; % betas x voxels (400 x ~500000)
    
end

% BETAS
sess1_run34= betas2(1:100,:);
sess1_run78 = betas2(101:200,:);
sess2_run34 = betas2(201:300,:);
sess2_run78 = betas2(301:400,:);

% CONDITION NAMES
load('Reliability2_condition_names.mat');
names_sess1_run34 = Reliability2_condition_names(1:100);
names_sess1_run78 = Reliability2_condition_names(101:200);
names_sess2_run34 = Reliability2_condition_names(201:300);
names_sess2_run78 = Reliability2_condition_names(301:400);

% SORTED CONDITION NAMES
[Y1 I1] = sort(names_sess1_run34);
[Y2 I2] = sort(names_sess1_run78);
[Y3 I3] = sort(names_sess2_run34);
[Y4 I4] = sort(names_sess2_run78);


% SORTED BETAS
Rel2_sorted_action_betas_v1 = sess1_run34(I1,:);
Rel2_sorted_action_betas_v2 = sess1_run78(I2,:);
Rel2_sorted_action_betas_v3 = sess2_run34(I3,:);
Rel2_sorted_action_betas_v4 = sess2_run78(I4,:);

Rel2_sorted_action_betas(:,:,1) = Rel2_sorted_action_betas_v1;
Rel2_sorted_action_betas(:,:,2) = Rel2_sorted_action_betas_v2;
Rel2_sorted_action_betas(:,:,3) = Rel2_sorted_action_betas_v3;
Rel2_sorted_action_betas(:,:,4) = Rel2_sorted_action_betas_v4;

MEAN_Rel2_sorted_action_betas = mean(Rel2_sorted_action_betas,3)';
save MEAN_Rel2_sorted_action_betas MEAN_Rel2_sorted_action_betas

clear all
clc

%% CREATE RELIABILITY MATRIX
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_1/');
load('MEAN_Rel1_sorted_action_betas.mat');

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_2/');
load('MEAN_Rel2_sorted_action_betas.mat');

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/Reliability/');
reliability_matrix = [];
for i = 1:size(MEAN_Rel2_sorted_action_betas,1)
   r1 = MEAN_Rel1_sorted_action_betas(i,:);
   r2 = MEAN_Rel2_sorted_action_betas(i,:); 
   reliability_matrix(i) = 1 - pdist2(r1, r2,'correlation');
end
save reliability_matrix reliability_matrix

clear all
clc

%% CREATE RELIABILITY MAP AS A NIFTI FILE
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/Reliability/');
load('reliability_matrix.mat');


cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_1/');
Map = spm_read_vols(spm_vol('beta_0001.nii'));
Map_3D_reliability = reshape(reliability_matrix, size(Map,1),size(Map,2),size(Map,3));

C = spm_vol('beta_0001.nii');
C.name = 'Map_3d_reliability.nii';
C.fname = 'Map_3d_reliability.nii';
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/Reliability/');
spm_write_vol(C,Map_3D_reliability);




%% STEP 2.1 - CONDITION MULTIVOXEL PATTERN RELIABILITY
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_1/');
load('MEAN_Rel1_sorted_action_betas.mat');

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_2/');
load('MEAN_Rel2_sorted_action_betas.mat');

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/Reliability/');
load('reliability_matrix.mat');

r = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]; % possible reliability/correlation thresholds

NaN_voxels = isnan(reliability_matrix);
bad_voxel_indices = find(NaN_voxels == 1);
good_voxel_indices = find(NaN_voxels == 0);

reliability_matrix_good = reliability_matrix(good_voxel_indices); % non NaN voxel values

%%%%%%%%%%%%%%%%%%% Find voxels whose reliability/correlatio score is > 0
indices_r0 = find(reliability_matrix_good > 0);
reliability_matrix_good_r0 = reliability_matrix_good(indices_r0);
actual_indices_r0 = good_voxel_indices(indices_r0);

Rel1_r0_matrix = MEAN_Rel1_sorted_action_betas(actual_indices_r0,:);
Rel2_r0_matrix = MEAN_Rel2_sorted_action_betas(actual_indices_r0,:);

cond_corr_mat_r0 = []; % 1x100 matrix that includes the correlation between patterns of responses for r0
for i = 1:100
    cond_rel1 = Rel1_r0_matrix(:,i);
    cond_rel2 = Rel2_r0_matrix(:,i);
    cond_corr = 1 - pdist2(cond_rel1, cond_rel2,'correlation');
    cond_corr_mat_r0 = [cond_corr_mat_r0 cond_corr];
end



%%%%%%%%%%%%%%%%%%%% Find voxels whose reliability/correlatio score is > 0.1
indices_r01 = find(reliability_matrix_good > 0.1);
reliability_matrix_good_r01 = reliability_matrix_good(indices_r01);
actual_indices_r01 = good_voxel_indices(indices_r01);

indices_r01_smaller = find(reliability_matrix_good <= 0.1);
actual_indices_r01_smaller = good_voxel_indices(indices_r01_smaller);

Rel1_r01_matrix = MEAN_Rel1_sorted_action_betas(actual_indices_r01,:);
Rel2_r01_matrix = MEAN_Rel2_sorted_action_betas(actual_indices_r01,:);

cond_corr_mat_r01 = []; % 1x100 matrix that includes the correlation between patterns of responses for r01
for i = 1:100
    cond_rel1 = Rel1_r01_matrix(:,i);
    cond_rel2 = Rel2_r01_matrix(:,i);
    cond_corr = 1 - pdist2(cond_rel1', cond_rel2','correlation');
    cond_corr_mat_r01 = [cond_corr_mat_r01 cond_corr];
end



%%%%%%%%%%%%%%%%%%%%% Find voxels whose reliability/correlatio score is > 0.2
indices_r02 = find(reliability_matrix_good > 0.2);
reliability_matrix_good_r02 = reliability_matrix_good(indices_r02);
actual_indices_r02 = good_voxel_indices(indices_r02);

indices_r02_smaller = find(reliability_matrix_good <= 0.2);
actual_indices_r02_smaller = good_voxel_indices(indices_r02_smaller);

Rel1_r02_matrix = MEAN_Rel1_sorted_action_betas(actual_indices_r02,:);
Rel2_r02_matrix = MEAN_Rel2_sorted_action_betas(actual_indices_r02,:);

cond_corr_mat_r02 = []; % 1x100 matrix that includes the correlation between patterns of responses for r02
for i = 1:100
    cond_rel1 = Rel1_r02_matrix(:,i);
    cond_rel2 = Rel2_r02_matrix(:,i);
    cond_corr = 1 - pdist2(cond_rel1', cond_rel2','correlation');
    cond_corr_mat_r02 = [cond_corr_mat_r02 cond_corr];
end




%%%%%%%%%%%%%%%%%%%%% Find voxels whose reliability/correlation score is > 0.3
indices_r03 = find(reliability_matrix_good > 0.3);
reliability_matrix_good_r03 = reliability_matrix_good(indices_r03);
actual_indices_r03 = good_voxel_indices(indices_r03);

indices_r03_smaller = find(reliability_matrix_good <= 0.3);
actual_indices_r03_smaller = good_voxel_indices(indices_r03_smaller);

Rel1_r03_matrix = MEAN_Rel1_sorted_action_betas(actual_indices_r03,:);
Rel2_r03_matrix = MEAN_Rel2_sorted_action_betas(actual_indices_r03,:);

cond_corr_mat_r03 = []; % 1x100 matrix that includes the correlation between patterns of responses for r03
for i = 1:100
    cond_rel1 = Rel1_r03_matrix(:,i);
    cond_rel2 = Rel2_r03_matrix(:,i);
    cond_corr = 1 - pdist2(cond_rel1', cond_rel2','correlation');
    cond_corr_mat_r03 = [cond_corr_mat_r03 cond_corr];
end




%%%%%%%%%%%%%%%%%%%%% Find voxels whose reliability/correlatio score is > 0.4
indices_r04 = find(reliability_matrix_good > 0.4);
reliability_matrix_good_r04 = reliability_matrix_good(indices_r04);
actual_indices_r04 = good_voxel_indices(indices_r04);

indices_r04_smaller = find(reliability_matrix_good <= 0.4);
actual_indices_r04_smaller = good_voxel_indices(indices_r04_smaller);

Rel1_r04_matrix = MEAN_Rel1_sorted_action_betas(actual_indices_r04,:);
Rel2_r04_matrix = MEAN_Rel2_sorted_action_betas(actual_indices_r04,:);

cond_corr_mat_r04 = []; % 1x100 matrix that includes the correlation between patterns of responses for r04
for i = 1:100
    cond_rel1 = Rel1_r04_matrix(:,i);
    cond_rel2 = Rel2_r04_matrix(:,i);
    cond_corr = 1 - pdist2(cond_rel1', cond_rel2','correlation');
    cond_corr_mat_r04 = [cond_corr_mat_r04 cond_corr];
end





%%%%%%%%%%%%%%%%%%%%% Find voxels whose reliability/correlatio score is > 0.5
indices_r05 = find(reliability_matrix_good > 0.5);
reliability_matrix_good_r05 = reliability_matrix_good(indices_r05);
actual_indices_r05 = good_voxel_indices(indices_r05);

indices_r05_smaller = find(reliability_matrix_good <= 0.5);
actual_indices_r05_smaller = good_voxel_indices(indices_r05_smaller);

Rel1_r05_matrix = MEAN_Rel1_sorted_action_betas(actual_indices_r05,:);
Rel2_r05_matrix = MEAN_Rel2_sorted_action_betas(actual_indices_r05,:);

cond_corr_mat_r05 = []; % 1x100 matrix that includes the correlation between patterns of responses for r05
for i = 1:100
    cond_rel1 = Rel1_r05_matrix(:,i);
    cond_rel2 = Rel2_r05_matrix(:,i);
    cond_corr = 1 - pdist2(cond_rel1', cond_rel2','correlation');
    cond_corr_mat_r05 = [cond_corr_mat_r05 cond_corr];
end



%%%%%%%%%%%%%%%%%%%%%% Find voxels whose reliability/correlatio score is > 0.6
indices_r06 = find(reliability_matrix_good > 0.6);
reliability_matrix_good_r06 = reliability_matrix_good(indices_r06);
actual_indices_r06 = good_voxel_indices(indices_r06);

indices_r06_smaller = find(reliability_matrix_good <= 0.6);
actual_indices_r06_smaller = good_voxel_indices(indices_r06_smaller);

Rel1_r06_matrix = MEAN_Rel1_sorted_action_betas(actual_indices_r06,:);
Rel2_r06_matrix = MEAN_Rel2_sorted_action_betas(actual_indices_r06,:);

cond_corr_mat_r06 = []; % 1x100 matrix that includes the correlation between patterns of responses for r06
for i = 1:100
    cond_rel1 = Rel1_r06_matrix(:,i);
    cond_rel2 = Rel2_r06_matrix(:,i);
    cond_corr = 1 - pdist2(cond_rel1', cond_rel2','correlation');
    cond_corr_mat_r06 = [cond_corr_mat_r06 cond_corr];
end



%% 
cond_corr_mat(1,:) = cond_corr_mat_r01;
cond_corr_mat(2,:) = cond_corr_mat_r02;
cond_corr_mat(3,:) = cond_corr_mat_r03;
cond_corr_mat(4,:) = cond_corr_mat_r04;
cond_corr_mat(5,:) = cond_corr_mat_r05;
cond_corr_mat(6,:) = cond_corr_mat_r06;

for i = 1:size(cond_corr_mat,2)
   
    action = cond_corr_mat(:,i);
    plot(action, 'Color', 'g', 'LineWidth', 0.75); hold on; 
    
end
average_videos = mean(cond_corr_mat,2);
plot(average_videos, 'Color', 'k', 'LineWidth', 4);
save average_videos average_videos



%% STEP 3: SELECT THE BEST R = 0.3 for our case and make a nifti file

reliability_map_r03 = reliability_matrix;
reliability_map_r03(actual_indices_r03_smaller) = 0;
reliability_map_r03(actual_indices_r03) = 1;

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_1/');
Map = spm_read_vols(spm_vol('beta_0001.nii'));
Map_3D_r03 = reshape(reliability_map_r03, size(Map,1),size(Map,2),size(Map,3));

C = spm_vol('beta_0001.nii');
C.name = 'Map_3d_r03.nii';
C.fname = 'Map_3d_r03.nii';
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/Reliability/');
spm_write_vol(C,Map_3D_r03);

%%
reliability_map_r01 = reliability_matrix;
reliability_map_r01(actual_indices_r01_smaller) = 0;
reliability_map_r01(actual_indices_r01) = 1;

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_1/');
Map = spm_read_vols(spm_vol('beta_0001.nii'));
Map_3D_r01 = reshape(reliability_map_r01, size(Map,1),size(Map,2),size(Map,3));

C = spm_vol('beta_0001.nii');
C.name = 'Map_3d_r01.nii';
C.fname = 'Map_3d_r01.nii';
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/Reliability/');
spm_write_vol(C,Map_3D_r01);

%%

reliability_map_r02 = reliability_matrix;
reliability_map_r02(actual_indices_r02_smaller) = 0;
reliability_map_r02(actual_indices_r02) = 1;

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_1/');
Map = spm_read_vols(spm_vol('beta_0001.nii'));
Map_3D_r02 = reshape(reliability_map_r02, size(Map,1),size(Map,2),size(Map,3));

C = spm_vol('beta_0001.nii');
C.name = 'Map_3d_r02.nii';
C.fname = 'Map_3d_r02.nii';
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/Reliability/');
spm_write_vol(C,Map_3D_r02);

%%

reliability_map_r04 = reliability_matrix;
reliability_map_r04(actual_indices_r04_smaller) = 0;
reliability_map_r04(actual_indices_r04) = 1;

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_1/');
Map = spm_read_vols(spm_vol('beta_0001.nii'));
Map_3D_r04 = reshape(reliability_map_r04, size(Map,1),size(Map,2),size(Map,3));

C = spm_vol('beta_0001.nii');
C.name = 'Map_3d_r04.nii';
C.fname = 'Map_3d_r04.nii';
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/Reliability/');
spm_write_vol(C,Map_3D_r04);

%%

reliability_map_r05 = reliability_matrix;
reliability_map_r05(actual_indices_r05_smaller) = 0;
reliability_map_r05(actual_indices_r05) = 1;

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_1/');
Map = spm_read_vols(spm_vol('beta_0001.nii'));
Map_3D_r05 = reshape(reliability_map_r05, size(Map,1),size(Map,2),size(Map,3));

C = spm_vol('beta_0001.nii');
C.name = 'Map_3d_r05.nii';
C.fname = 'Map_3d_r05.nii';
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/Reliability/');
spm_write_vol(C,Map_3D_r05);

%%

reliability_map_r06 = reliability_matrix;
reliability_map_r06(actual_indices_r06_smaller) = 0;
reliability_map_r06(actual_indices_r06) = 1;

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_1/');
Map = spm_read_vols(spm_vol('beta_0001.nii'));
Map_3D_r06 = reshape(reliability_map_r06, size(Map,1),size(Map,2),size(Map,3));

C = spm_vol('beta_0001.nii');
C.name = 'Map_3d_r06.nii';
C.fname = 'Map_3d_r06.nii';
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/Reliability/');
spm_write_vol(C,Map_3D_r06);

%% PREPARE INPUT FOR CLUSTERING

%%%%%%%%%%%%% r>0.3 %%%%%%%%
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_1/');
load('MEAN_Rel1_sorted_action_betas.mat');

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_2/');
load('MEAN_Rel2_sorted_action_betas.mat');

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/Reliability/');
sorted_action_betas(:,:,1) = MEAN_Rel1_sorted_action_betas;
sorted_action_betas(:,:,2) = MEAN_Rel2_sorted_action_betas;
MEAN_sorted_action_betas_all = mean(sorted_action_betas,3)';
MEAN_sorted_action_betas = MEAN_sorted_action_betas_all(:,actual_indices_r03);
save MEAN_sorted_action_betas MEAN_sorted_action_betas


%%%%%%%%%%%%% r>0.2 %%%%%%%%
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_1/');
load('MEAN_Rel1_sorted_action_betas.mat');

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_2/');
load('MEAN_Rel2_sorted_action_betas.mat');

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/Reliability/');
sorted_action_betas(:,:,1) = MEAN_Rel1_sorted_action_betas;
sorted_action_betas(:,:,2) = MEAN_Rel2_sorted_action_betas;
MEAN_sorted_action_betas_all = mean(sorted_action_betas,3)';
MEAN_sorted_action_betas = MEAN_sorted_action_betas_all(:,actual_indices_r02);
save MEAN_sorted_action_betas MEAN_sorted_action_betas






