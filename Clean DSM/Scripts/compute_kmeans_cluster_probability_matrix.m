
mainDir = '/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM/INPUT_FITTED_ONLYPOSITIVE_AUC/Clustering_PPC_volume_FINAL/ClusteringWithProb/';
cd(mainDir)

probMatrix = zeros(100,100);
cfile = [];
for j = 1:100 % number of actions
    
    for k = 1:100 % number of actions
        
        if j == k
            probMatrix(j,k) = 1;
        else
            for i = 1:100 % number of kmeans runs
                
                % Go to each kmeans run directory and load the cluster file
                fname = ['run' num2str(i)];
                filesInRunDir = dir(fname);
                
                
                for f = 1:size(filesInRunDir,1)
                   file =  filesInRunDir(f).name;
                   TF = startsWith(file,'cluster');
                   if TF == 1
                       cfile = f;
                       break;
                   end
                end
                
                clusterFile = filesInRunDir(cfile);
                runDir = [mainDir fname];
                cd(runDir);
                load(clusterFile.name);
                
                % Determine how many clusters there are
                n = clusterFile.name(8:9);
                clusterSize = str2num(n);
                
                
                for c = 1:clusterSize
                   
                    currentCluster = eval(['c' num2str(c)]); 
                    
                    j_member = ismember(j,currentCluster);
                    k_member = ismember(k,currentCluster);
                    
                    j_member_1 = find(j_member == 1); 
                    k_member_1 = find(k_member == 1);
                    
                    if ~isempty(j_member_1) && ~isempty(k_member_1)
                       probMatrix(j,k) = probMatrix(j,k) + 1;                        
                    end
                                        
                end
                cd ..
                
                clearvars -EXCEPT mainDir j k i probMatrix
            end
        end
        
    end
    
end

probMatrix901_1000 = probMatrix;
save probMatrix901_1000 probMatrix901_1000

%%
cd(mainDir)
load('probMatrix1_100.mat');
load('probMatrix101_200.mat');
load('probMatrix201_300.mat');
load('probMatrix301_400.mat');
load('probMatrix401_500.mat');
load('probMatrix501_600.mat');
load('probMatrix601_700.mat');
load('probMatrix701_800.mat');
load('probMatrix801_900.mat');
load('probMatrix901_1000.mat');


sum_probMatrix = probMatrix1_100 + probMatrix101_200 + probMatrix201_300 + probMatrix301_400 + probMatrix401_500 + ...
                 probMatrix501_600 + probMatrix601_700 + probMatrix701_800 + probMatrix801_900 + probMatrix901_1000;
             
all_probMatrix = sum_probMatrix;             
for i = 1:100
    for j = 1:100
        if i == j
            all_probMatrix(i,j) = 1000;
        end
    end
end


probMatrix = [];             
for i = 1:100
    for j = 1:100
       probMatrix(i,j) = all_probMatrix(i,j)/10;
    end
end


final_probMatrix = [];             
for i = 1:100
    for j = 1:100
       final_probMatrix(i,j) = probMatrix(i,j)/100;
    end
end

probMatrix_perc = final_probMatrix;
save probMatrix_perc probMatrix_perc

imagesc(probMatrix_perc); axis off; colorbar

% dissimilarity matrix for probability matrix
dis_probMatrix = 1-probMatrix_perc;
save dis_probMatrix dis_probMatrix

% MDS
actions = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', ...
            '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', ...
            '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', ...
            '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', ...
            '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', ...
            '51', '52', '53', '54', '55', '56', '57', '58', '59', '60', ...
            '61', '62', '63', '64', '65', '66', '67', '68', '69', '70', ...
            '71', '72', '73', '74', '75', '76', '77', '78', '79', '80', ...
            '81', '82', '83', '84', '85', '86', '87', '88', '89', '90', ...
            '91', '92', '93', '94', '95', '96', '97', '98', '99', '100'};
        
[Y,eigvals] = cmdscale(dis_probMatrix);
plot(Y(:,1),Y(:,2),'.', 'markers',15, 'Color', 'r');
text(Y(:,1)+0.008,Y(:,2),actions);

%% For each action, list the actions whose probability being together with that action is > 0.5

actions_friendsList_09 = {};
for i = 1:100
   
    currentAction = probMatrix_perc(i,:);
    currentAction_friends_index = find(currentAction >= 0.9);
    actions_friendsList_09{i} = currentAction_friends_index;
    
end
save actions_friendsList_09 actions_friendsList_09


actions_friendsList_08 = {};
for i = 1:100
   
    currentAction = probMatrix_perc(i,:);
    currentAction_friends_index = find(currentAction >= 0.8);
    actions_friendsList_08{i} = currentAction_friends_index;
    
end
save actions_friendsList_08 actions_friendsList_08


actions_friendsList_07 = {};
for i = 1:100
   
    currentAction = probMatrix_perc(i,:);
    currentAction_friends_index = find(currentAction >= 0.7);
    actions_friendsList_07{i} = currentAction_friends_index;
    
end
save actions_friendsList_07 actions_friendsList_07

actions_friendsList_06 = {};
for i = 1:100
   
    currentAction = probMatrix_perc(i,:);
    currentAction_friends_index = find(currentAction >= 0.6);
    actions_friendsList_06{i} = currentAction_friends_index;
    
end
save actions_friendsList_06 actions_friendsList_06

actions_friendsList_05 = {};
for i = 1:100
   
    currentAction = probMatrix_perc(i,:);
    currentAction_friends_index = find(currentAction >= 0.5);
    actions_friendsList_05{i} = currentAction_friends_index;
    
end
save actions_friendsList_05 actions_friendsList_05

actions_friendsList_04 = {};
for i = 1:100
   
    currentAction = probMatrix_perc(i,:);
    currentAction_friends_index = find(currentAction >= 0.4);
    actions_friendsList_04{i} = currentAction_friends_index;
    
end
save actions_friendsList_04 actions_friendsList_04

actions_friendsList_03 = {};
for i = 1:100
   
    currentAction = probMatrix_perc(i,:);
    currentAction_friends_index = find(currentAction >= 0.3);
    actions_friendsList_03{i} = currentAction_friends_index;
    
end
save actions_friendsList_03 actions_friendsList_03
