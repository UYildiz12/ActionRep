
load('CondInfo.mat');

names_trials = [];
index = 1;
for i = 1:length(names)-1
   
    names_trials{index} = [names{i} '_1'];
    names_trials{index+1} = [names{i} '_2'];
    names_trials{index+2} = [names{i} '_3'];
    names_trials{index+3} = [names{i} '_4'];
    index = index + 4;
    
end

names_trials{53} = 'fix';
names = names_trials;

%%

onset_trials = [];
index_onsets = 1;
for i = 1:length(onsets)-1
   
    onset_trials{index_onsets} = onsets{i}(1);
    onset_trials{index_onsets+1} = onsets{i}(2);
    onset_trials{index_onsets+2} = onsets{i}(3);
    onset_trials{index_onsets+3} = onsets{i}(4);
    index_onsets = index_onsets + 4;
    
end

onset_trials{53} = onsets{14};
onsets = onset_trials;

%%

duration_trials = [];
for i = 1:53
    duration_trials{i} = 9;
end

durations = duration_trials;

%%
clearvars -except names onsets durations

save CondInfoTrials

%% %%%%%%%%%%%%%%%%% Runs with 12 actions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('CondInfo.mat');

names_trials = [];
index = 1;
for i = 1:length(names)-1
   
    names_trials{index} = [names{i} '_1'];
    names_trials{index+1} = [names{i} '_2'];
    names_trials{index+2} = [names{i} '_3'];
    names_trials{index+3} = [names{i} '_4'];
    index = index + 4;
    
end

names_trials{49} = 'fix';
names = names_trials;

%%

onset_trials = [];
index_onsets = 1;
for i = 1:length(onsets)-1
   
    onset_trials{index_onsets} = onsets{i}(1);
    onset_trials{index_onsets+1} = onsets{i}(2);
    onset_trials{index_onsets+2} = onsets{i}(3);
    onset_trials{index_onsets+3} = onsets{i}(4);
    index_onsets = index_onsets + 4;
    
end

onset_trials{49} = onsets{13};
onsets = onset_trials;

%%

duration_trials = [];
for i = 1:49
    duration_trials{i} = 9;
end

durations = duration_trials;

%%
clearvars -except names onsets durations

save CondInfoTrials

