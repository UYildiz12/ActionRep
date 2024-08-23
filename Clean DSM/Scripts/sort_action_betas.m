
function [] = sort_action_betas(roi)

cd('/san/burcu/ActionCluster100Bilkent/Subjects/subj02/BehavioralData/')
load('RUNS.mat');
action_order = [];
for i = 1:8
   action_order = [action_order RUNS{i}];
end
save action_order action_order;


cd(['/san/burcu/ActionCluster100Bilkent/Subjects/subj02/ANALYSIS/GLM_w_Regres_trials/' roi]);
load('action_betas_v1.mat');
load('action_betas_v2.mat');
load('action_betas_v3.mat');
load('action_betas_v4.mat');

sorted_action_betas_v1 = [];
sorted_action_betas_v2 = [];
sorted_action_betas_v3 = [];
sorted_action_betas_v4 = [];

[Y I] = sort(action_order);

sorted_action_betas_v1 = action_betas_v1(I,:);
sorted_action_betas_v2 = action_betas_v2(I,:);
sorted_action_betas_v3 = action_betas_v3(I,:);
sorted_action_betas_v4 = action_betas_v4(I,:);


save sorted_action_betas_v1 sorted_action_betas_v1
save sorted_action_betas_v2 sorted_action_betas_v2
save sorted_action_betas_v3 sorted_action_betas_v3
save sorted_action_betas_v4 sorted_action_betas_v4

end