x c
% extract betas for actions from all betas
function [] = extract_action_betas_oneSession(roi)

cd(['/Users/burcuaysenurgen/Documents/Projects/ActionClusters/Data_fMRI/subjects/subject01/Session1/SPM_oneSession_2_2_2/' roi]);
load('allBetas.mat')

action_betas = [];
action_beta_indices = {};
act_indices = [1:56:448];   

for i = 1:length(act_indices)
   action_beta_indices{i} = [act_indices(i):(act_indices(i)+49)];
   action_betas = [action_betas; allBetas(action_beta_indices{i},:)];
end
save action_betas action_betas

%%
load('action_betas.mat');
action_betas_v1 = action_betas(1:100,:);
action_betas_v2 = action_betas(101:200,:);
action_betas_v3 = action_betas(201:300,:);
action_betas_v4 = action_betas(301:400,:);

% action_betas_v5 = action_betas(1:100,:);
% action_betas_v6 = action_betas(101:200,:);
% action_betas_v7 = action_betas(201:300,:);
% action_betas_v8 = action_betas(301:400,:);

% action_betas_v9 = action_betas(1:100,:);
% action_betas_v10 = action_betas(101:200,:);
% action_betas_v11 = action_betas(201:300,:);
% action_betas_v12 = action_betas(301:400,:);
% 
% action_betas_v13 = action_betas(1:100,:);
% action_betas_v14 = action_betas(101:200,:);
% action_betas_v15 = action_betas(201:300,:);
% action_betas_v16 = action_betas(301:400,:);
% 
% action_betas_v17 = action_betas(1:100,:);
% action_betas_v18 = action_betas(101:200,:);
% action_betas_v19 = action_betas(201:300,:);
% action_betas_v20 = action_betas(301:400,:);
% 
% action_betas_v21 = action_betas(1:100,:);
% action_betas_v22 = action_betas(101:200,:);
% action_betas_v23 = action_betas(201:300,:);
% action_betas_v24 = action_betas(301:400,:);

%% Get the indices for sorting
cd('/Users/burcuaysenurgen/Documents/Projects/ActionClusters/Data_fMRI/subjects/subject01/Behavior/subject1/');
load('condition_names_session1.mat');
%load('condition_names_session2.mat');
% load('condition_names_session3.mat');
% load('condition_names_session4.mat');
% load('condition_names_session5.mat');
% load('condition_names_session6.mat');

[Y1 I1] = sort(condition_names_session1(1:100));
[Y2 I2] = sort(condition_names_session1(101:200));
[Y3 I3] = sort(condition_names_session1(201:300));
[Y4 I4] = sort(condition_names_session1(301:400));

% [Y5 I5] = sort(condition_names_session2(1:100));
% [Y6 I6] = sort(condition_names_session2(101:200));
% [Y7 I7] = sort(condition_names_session2(201:300));
% [Y8 I8] = sort(condition_names_session2(301:400));
% 
% [Y9 I9] = sort(condition_names_session3(1:100));
% [Y10 I10] = sort(condition_names_session3(101:200));
% [Y11 I11] = sort(condition_names_session3(201:300));
% [Y12 I12] = sort(condition_names_session3(301:400));
% 
% [Y13 I13] = sort(condition_names_session4(1:100));
% [Y14 I14] = sort(condition_names_session4(101:200));
% [Y15 I15] = sort(condition_names_session4(201:300));
% [Y16 I16] = sort(condition_names_session4(301:400));
% 
% [Y17 I17] = sort(condition_names_session5(1:100));
% [Y18 I18] = sort(condition_names_session5(101:200));
% [Y19 I19] = sort(condition_names_session5(201:300));
% [Y20 I20] = sort(condition_names_session5(301:400));
% 
% [Y21 I21] = sort(condition_names_session6(1:100));
% [Y22 I22] = sort(condition_names_session6(101:200));
% [Y23 I23] = sort(condition_names_session6(201:300));
% [Y24 I24] = sort(condition_names_session6(301:400));


%% SORT THE ACTION BETAS ACCORDING TO ACTION NUMBER
sorted_action_betas_v1 = action_betas_v1(I1,:);
sorted_action_betas_v2 = action_betas_v2(I2,:);
sorted_action_betas_v3 = action_betas_v3(I3,:);
sorted_action_betas_v4 = action_betas_v4(I4,:);

% sorted_action_betas_v5 = action_betas_v5(I5,:);
% sorted_action_betas_v6 = action_betas_v6(I6,:);
% sorted_action_betas_v7 = action_betas_v7(I7,:);
% sorted_action_betas_v8 = action_betas_v8(I8,:);
% 
% sorted_action_betas_v9 = action_betas_v9(I9,:);
% sorted_action_betas_v10 = action_betas_v10(I10,:);
% sorted_action_betas_v11 = action_betas_v11(I11,:);
% sorted_action_betas_v12 = action_betas_v12(I12,:);
% 
% sorted_action_betas_v13 = action_betas_v13(I13,:);
% sorted_action_betas_v14 = action_betas_v14(I14,:);
% sorted_action_betas_v15 = action_betas_v15(I15,:);
% sorted_action_betas_v16 = action_betas_v16(I16,:);
% 
% sorted_action_betas_v17 = action_betas_v17(I17,:);
% sorted_action_betas_v18 = action_betas_v18(I18,:);
% sorted_action_betas_v19 = action_betas_v19(I19,:);
% sorted_action_betas_v20 = action_betas_v20(I20,:);
% 
% sorted_action_betas_v21 = action_betas_v21(I21,:);
% sorted_action_betas_v22 = action_betas_v22(I22,:);
% sorted_action_betas_v23 = action_betas_v23(I23,:);
% sorted_action_betas_v24 = action_betas_v24(I24,:);



%% ASSEMBLE ALL SORTED ACTION BETAS IN ONE MATRIX
sorted_action_betas(:,:,1) = sorted_action_betas_v1;
sorted_action_betas(:,:,2) = sorted_action_betas_v2;
sorted_action_betas(:,:,3) = sorted_action_betas_v3;
sorted_action_betas(:,:,4) = sorted_action_betas_v4;
% sorted_action_betas(:,:,1) = sorted_action_betas_v5;
% sorted_action_betas(:,:,2) = sorted_action_betas_v6;
% sorted_action_betas(:,:,3) = sorted_action_betas_v7;
% sorted_action_betas(:,:,4) = sorted_action_betas_v8;
% sorted_action_betas(:,:,1) = sorted_action_betas_v9;
% sorted_action_betas(:,:,2) = sorted_action_betas_v10;
% sorted_action_betas(:,:,3) = sorted_action_betas_v11;
% sorted_action_betas(:,:,4) = sorted_action_betas_v12;
% sorted_action_betas(:,:,1) = sorted_action_betas_v13;
% sorted_action_betas(:,:,2) = sorted_action_betas_v14;
% sorted_action_betas(:,:,3) = sorted_action_betas_v15;
% sorted_action_betas(:,:,4) = sorted_action_betas_v16;
% sorted_action_betas(:,:,1) = sorted_action_betas_v17;
% sorted_action_betas(:,:,2) = sorted_action_betas_v18;
% sorted_action_betas(:,:,3) = sorted_action_betas_v19;
% sorted_action_betas(:,:,4) = sorted_action_betas_v20;
% sorted_action_betas(:,:,1) = sorted_action_betas_v21;
% sorted_action_betas(:,:,2) = sorted_action_betas_v22;
% sorted_action_betas(:,:,3) = sorted_action_betas_v23;
% sorted_action_betas(:,:,4) = sorted_action_betas_v24;

cd(['/Users/burcuaysenurgen/Documents/Projects/ActionClusters/Data_fMRI/subjects/subject01/Session1/SPM_oneSession_2_2_2/' roi]);
save sorted_action_betas sorted_action_betas
sorted_action_betas_MEAN = mean(sorted_action_betas,3);
save sorted_action_betas_MEAN sorted_action_betas_MEAN





