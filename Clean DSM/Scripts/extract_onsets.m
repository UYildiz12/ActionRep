

load('data.mat')

%% Condition names
movieorder = data.movieStruct.order;
condition_names = {};
for i = 1:length(movieorder)
    condition_names{i} = num2str(movieorder(i));
end
save condition_names condition_names;


%% Condition onsets
allonsets = data.stimonsets;
condition_onsets = {};
count = 1;
for i = 1:3:length(allonsets)
   condition_onsets{count} = allonsets(i);
   count = count + 1;
end
save condition_onsets condition_onsets

% diff = [];
% for i = 1:length(condition_onsets)-1
%     diff(i) = condition_onsets(i+1) - condition_onsets(i)
% end

%% Condition durations
% condition_durations = repmat(9,1,50);
% cond_durations = {};
% for i = 1:length(condition_durations)
%     cond_durations{i} = condition_durations(i);
% end
% save cond_durations cond_durations
% 
% clear all

%% Condition durations
condition_durations = data.moviedurations;
cond_durations = {};
countDur = 1;
for i = 1:3:length(condition_durations)-2
    x = [condition_durations(i) condition_durations(i+1) condition_durations(i+2)];
    y = sum(x);
    cond_durations{countDur} = y;
    countDur = countDur + 1;
end
save cond_durations cond_durations

clear all

%%
load('condition_names.mat');
load('condition_onsets.mat');
load('cond_durations.mat');

names = condition_names;
onsets = condition_onsets;
durations = cond_durations;

clear condition_names condition_onsets cond_durations
save conditions
clear all
clc
