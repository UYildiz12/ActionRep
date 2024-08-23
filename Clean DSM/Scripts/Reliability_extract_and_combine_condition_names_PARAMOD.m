
path = '/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ses-1/';
cd(path);

runname = 'run';
condition_names1_sess1 = [];
for i = [1,2,5,6]
   rundir = [path runname num2str(i)];
   cd(rundir)
   load('conditions.mat');
   
   names_no = [];
   for j = 1:50
       names_no(j) = str2num(names{j});
   end
   condition_names1_sess1 = [condition_names1_sess1 names_no];
    
end
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ses-1/')
save condition_names1_sess1 condition_names1_sess1

clear all
clc

%%
path = '/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ses-2/';
cd(path);

runname = 'run';
condition_names1_sess2 = [];
for i = [1,2,5,6]
   rundir = [path runname num2str(i)];
   cd(rundir)
   load('conditions.mat');
   
   names_no = [];
   for j = 1:50
       names_no(j) = str2num(names{j});
   end
   condition_names1_sess2 = [condition_names1_sess2 names_no];
    
end
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ses-2/')
save condition_names1_sess2 condition_names1_sess2

clear all
clc


%%
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ses-1/')
load('condition_names1_sess1.mat');

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ses-2/')
load('condition_names1_sess2.mat');

Reliability1_condition_names = [condition_names1_sess1 condition_names1_sess2];
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_1/')
save Reliability1_condition_names Reliability1_condition_names

clear all
clc

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

path = '/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ses-1/';
cd(path);

runname = 'run';
condition_names2_sess1 = [];
for i = [3,4,7,8]
   rundir = [path runname num2str(i)];
   cd(rundir)
   load('conditions.mat');
   
   names_no = [];
   for j = 1:50
       names_no(j) = str2num(names{j});
   end
   condition_names2_sess1 = [condition_names2_sess1 names_no];
    
end
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ses-1/')
save condition_names2_sess1 condition_names2_sess1

clear all
clc

%%
path = '/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ses-2/';
cd(path);

runname = 'run';
condition_names2_sess2 = [];
for i = [3,4,7,8]
   rundir = [path runname num2str(i)];
   cd(rundir)
   load('conditions.mat');
   
   names_no = [];
   for j = 1:50
       names_no(j) = str2num(names{j});
   end
   condition_names2_sess2 = [condition_names2_sess2 names_no];
    
end
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ses-2/')
save condition_names2_sess2 condition_names2_sess2

clear all
clc

%%
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ses-1/')
load('condition_names2_sess1.mat');

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ses-2/')
load('condition_names2_sess2.mat');

Reliability2_condition_names = [condition_names2_sess1 condition_names2_sess2];
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM_Reliability_2/')
save Reliability2_condition_names Reliability2_condition_names

clear all
clc
