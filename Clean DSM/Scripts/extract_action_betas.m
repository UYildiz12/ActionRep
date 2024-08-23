
% extract betas for actions from all betas
function [] = extract_action_betas(roi)

cd(['/san/burcu/ActionCluster100Bilkent/Subjects/subj02/ANALYSIS/GLM_w_Regres_trials/' roi]);
load('allBetas.mat')

action_betas = [];

action_betas = [action_betas; allBetas(1:52,:)];
action_betas = [action_betas; allBetas(63:114,:)];
action_betas = [action_betas; allBetas(125:176,:)];
action_betas = [action_betas; allBetas(187:238,:)];
action_betas = [action_betas; allBetas(249:296,:)];
action_betas = [action_betas; allBetas(307:354,:)];
action_betas = [action_betas; allBetas(365:412,:)];
action_betas = [action_betas; allBetas(423:470,:)];

save action_betas action_betas

%%
load('action_betas.mat');
action_betas_v1 = [];
action_betas_v2 = [];
action_betas_v3 = [];
action_betas_v4 = [];

indices_v1 = 1:4:397;
indices_v2 = 2:4:398;
indices_v3 = 3:4:399;
indices_v4 = 4:4:400;

action_betas_v1 = action_betas(indices_v1,:);
action_betas_v2 = action_betas(indices_v2,:);
action_betas_v3 = action_betas(indices_v3,:);
action_betas_v4 = action_betas(indices_v4,:);

save action_betas_v1 action_betas_v1
save action_betas_v2 action_betas_v2
save action_betas_v3 action_betas_v3
save action_betas_v4 action_betas_v4

