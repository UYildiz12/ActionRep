

path = '/Volumes/BAURGEN/fMRI_Action_Clusters/subjects_behavior/subject04/Behavior/session1/';
cd(path);

runname = 'run';
condition_names_session1 = [];
for i = 1:8
   rundir = [path runname num2str(i)];
   cd(rundir)
   load('conditions.mat');
   
   names_no = [];
   for j = 1:50
       names_no(j) = str2num(names{j});
   end
   condition_names_session1 = [condition_names_session1 names_no];
    
end
cd('/Volumes/BAURGEN/fMRI_Action_Clusters/subjects_behavior/subject04/Behavior/session1/')
save condition_names_session1 condition_names_session1

clear all
clc

%%
path = '/Volumes/BAURGEN/fMRI_Action_Clusters/subjects_behavior/subject04/Behavior/session2/';
cd(path);

runname = 'run';
condition_names_session2 = [];
for i = 1:8
   rundir = [path runname num2str(i)];
   cd(rundir)
   load('conditions.mat');
   
   names_no = [];
   for j = 1:50
       names_no(j) = str2num(names{j});
   end
   condition_names_session2 = [condition_names_session2 names_no];
    
end
cd('/Volumes/BAURGEN/fMRI_Action_Clusters/subjects_behavior/subject04/Behavior/session2/')
save condition_names_session2 condition_names_session2

clear all
clc
