
% extract betas for actions from all betas
function [] = extract_action_betas_BIDS_3session(roi)

cd(['/Users/burcuaysenurgen/Studies/SPM_ActionClustersBIDS_Subj02_Best3_Sess235/SPM/' roi]);
load('allBetas.mat')

action_betas = [];
action_beta_indices = {};
act_indices = [1:56:1344];

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

action_betas_v5 = action_betas(401:500,:);
action_betas_v6 = action_betas(501:600,:);
action_betas_v7 = action_betas(601:700,:);
action_betas_v8 = action_betas(701:800,:);

action_betas_v9 = action_betas(801:900,:);
action_betas_v10 = action_betas(901:1000,:);
action_betas_v11 = action_betas(1001:1100,:);
action_betas_v12 = action_betas(1101:1200,:);
% 
% action_betas_v13 = action_betas(1201:1300,:);
% action_betas_v14 = action_betas(1301:1400,:);
% action_betas_v15 = action_betas(1401:1500,:);
% action_betas_v16 = action_betas(1501:1600,:);
% 
% action_betas_v17 = action_betas(1601:1700,:);
% action_betas_v18 = action_betas(1701:1800,:);
% action_betas_v19 = action_betas(1801:1900,:);
% action_betas_v20 = action_betas(1901:2000,:);
% 
% action_betas_v21 = action_betas(2001:2100,:);
% action_betas_v22 = action_betas(2101:2200,:);
% action_betas_v23 = action_betas(2201:2300,:);
% action_betas_v24 = action_betas(2301:2400,:);

%% Get the indices for sorting
cd('/Users/burcuaysenurgen/Documents/Projects/ActionClusters/Data_fMRI/subjects/subject02/Behavior/subject2/');
load('condition_names_session2.mat');
load('condition_names_session3.mat');
load('condition_names_session5.mat');
% load('condition_names_session4.mat');
% load('condition_names_session5.mat');
% load('condition_names_session6.mat');

[Y1 I1] = sort(condition_names_session2(1:100));
[Y2 I2] = sort(condition_names_session2(101:200));
[Y3 I3] = sort(condition_names_session2(201:300));
[Y4 I4] = sort(condition_names_session2(301:400));

[Y5 I5] = sort(condition_names_session3(1:100));
[Y6 I6] = sort(condition_names_session3(101:200));
[Y7 I7] = sort(condition_names_session3(201:300));
[Y8 I8] = sort(condition_names_session3(301:400));

[Y9 I9] = sort(condition_names_session5(1:100));
[Y10 I10] = sort(condition_names_session5(101:200));
[Y11 I11] = sort(condition_names_session5(201:300));
[Y12 I12] = sort(condition_names_session5(301:400));
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

sorted_action_betas_v5 = action_betas_v5(I5,:);
sorted_action_betas_v6 = action_betas_v6(I6,:);
sorted_action_betas_v7 = action_betas_v7(I7,:);
sorted_action_betas_v8 = action_betas_v8(I8,:);

sorted_action_betas_v9 = action_betas_v9(I9,:);
sorted_action_betas_v10 = action_betas_v10(I10,:);
sorted_action_betas_v11 = action_betas_v11(I11,:);
sorted_action_betas_v12 = action_betas_v12(I12,:);
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
sorted_action_betas(:,:,5) = sorted_action_betas_v5;
sorted_action_betas(:,:,6) = sorted_action_betas_v6;
sorted_action_betas(:,:,7) = sorted_action_betas_v7;
sorted_action_betas(:,:,8) = sorted_action_betas_v8;
sorted_action_betas(:,:,9) = sorted_action_betas_v9;
sorted_action_betas(:,:,10) = sorted_action_betas_v10;
sorted_action_betas(:,:,11) = sorted_action_betas_v11;
sorted_action_betas(:,:,12) = sorted_action_betas_v12;
% sorted_action_betas(:,:,13) = sorted_action_betas_v13;
% sorted_action_betas(:,:,14) = sorted_action_betas_v14;
% sorted_action_betas(:,:,15) = sorted_action_betas_v15;
% sorted_action_betas(:,:,16) = sorted_action_betas_v16;
% sorted_action_betas(:,:,17) = sorted_action_betas_v17;
% sorted_action_betas(:,:,18) = sorted_action_betas_v18;
% sorted_action_betas(:,:,19) = sorted_action_betas_v19;
% sorted_action_betas(:,:,20) = sorted_action_betas_v20;
% sorted_action_betas(:,:,21) = sorted_action_betas_v21;
% sorted_action_betas(:,:,22) = sorted_action_betas_v22;
% sorted_action_betas(:,:,23) = sorted_action_betas_v23;
% sorted_action_betas(:,:,24) = sorted_action_betas_v24;

cd(['/Users/burcuaysenurgen/Studies/SPM_ActionClustersBIDS_Subj02_Best3_Sess235/SPM/' roi]);
save sorted_action_betas sorted_action_betas
sorted_action_betas_MEAN = mean(sorted_action_betas,3);
save sorted_action_betas_MEAN sorted_action_betas_MEAN





