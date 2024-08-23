
% extract betas for actions from all betas
function [] = extract_action_betas_BIDS_2session_PARAMOD(roi)

cd(['/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM/' roi]);
load('allBetas.mat')

%%
action_betas = [];
action_beta_indices = [1:4:197, 207:4:403, 413:4:609, 619:4:815, 825:4:1021, 1031:4:1227, 1237:4:1433, 1443:4:1639, ...
                       1649:4:1845, 1855:4:2051, 2061:4:2257, 2267:4:2463, 2473:4:2669, 2679:4:2875, 2885:4:3081, 3091:4:3287];

action_betas = allBetas(action_beta_indices,:);
save action_betas action_betas

%%
load('action_betas.mat');
action_betas_v1 = action_betas(1:100,:);
action_betas_v2 = action_betas(101:200,:);
action_betas_v3 = action_betas(201:300,:);
action_betas_v4 = action_betas(301:400,:);

action_betas_v5 = action_betas(401:500,:);
action_betas_v6 = action_betas(501:600,:);
action_betas_v7 = action_betas(601:700,:);
action_betas_v8 = action_betas(701:800,:);

%% Get the indices for sorting
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM/');
load('condition_names_session1.mat');
load('condition_names_session2.mat');

[Y1 I1] = sort(condition_names_session1(1:100));
[Y2 I2] = sort(condition_names_session1(101:200));
[Y3 I3] = sort(condition_names_session1(201:300));
[Y4 I4] = sort(condition_names_session1(301:400));

[Y5 I5] = sort(condition_names_session2(1:100));
[Y6 I6] = sort(condition_names_session2(101:200));
[Y7 I7] = sort(condition_names_session2(201:300));
[Y8 I8] = sort(condition_names_session2(301:400));


%% SORT THE ACTION BETAS ACCORDING TO ACTION NUMBER
sorted_action_betas_v1 = action_betas_v1(I1,:);
sorted_action_betas_v2 = action_betas_v2(I2,:);
sorted_action_betas_v3 = action_betas_v3(I3,:);
sorted_action_betas_v4 = action_betas_v4(I4,:);

sorted_action_betas_v5 = action_betas_v5(I5,:);
sorted_action_betas_v6 = action_betas_v6(I6,:);
sorted_action_betas_v7 = action_betas_v7(I7,:);
sorted_action_betas_v8 = action_betas_v8(I8,:);

%% ASSEMBLE ALL SORTED ACTION BETAS IN ONE MATRIX
sorted_action_betas(:,:,1) = sorted_action_betas_v1;
sorted_action_betas(:,:,2) = sorted_action_betas_v2;
sorted_action_betas(:,:,3) = sorted_action_betas_v3;
sorted_action_betas(:,:,4) = sorted_action_betas_v4;
sorted_action_betas(:,:,5) = sorted_action_betas_v5;
sorted_action_betas(:,:,6) = sorted_action_betas_v6;
sorted_action_betas(:,:,7) = sorted_action_betas_v7;
sorted_action_betas(:,:,8) = sorted_action_betas_v8;

cd(['/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM/' roi]);
save sorted_action_betas sorted_action_betas
sorted_action_betas_MEAN = mean(sorted_action_betas,3);
save sorted_action_betas_MEAN sorted_action_betas_MEAN

