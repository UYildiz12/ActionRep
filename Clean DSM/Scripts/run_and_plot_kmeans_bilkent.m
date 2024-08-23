
%RUN PCA
cd('C:\Program Files (x86)\Umram\ActionClusters Project\ActionClusters(mixed)\Analysis\Umur\1stlev1\1stlevel\Clustering_PMC_volume_FINAL');
load('actmean_betas.mat');

% % 800 voxels
%load('voxel_nos_to_go_to_clustering_800.mat');
%sorted_action_betas_selectedVoxels = sorted_action_betas_MEAN(:,voxel_nos_to_go_to_clustering_800);

% All negatively correlated voxels
sorted_action_betas_selectedVoxels = sorted_action_betas_MEAN;

% 1000 voxels
% load('voxel_nos_to_go_to_clustering_1000.mat');
% sorted_action_betas_selectedVoxels = sorted_action_betas_MEAN(:,voxel_nos_to_go_to_clustering_1000);

    
voxelsXactions = sorted_action_betas_selectedVoxels';
save voxelsXactions voxelsXactions

voxelsXactions_pca = PCA(voxelsXactions,100);
save voxelsXactions_pca voxelsXactions_pca


% CHECK HOW MUCH VARIANCE EACH COMPONENT EXPLAINS
load('voxelsXactions_pca.mat');
y = voxelsXactions_pca'; % this makes it a conditions X pc matrix
y_var = var(y);
totalVar = sum(y_var);
y_var_explained = y_var/totalVar;

plot(y_var_explained, 'Color', 'r', 'LineWidth', 2);
%a = sum(y_var_explained(1:55)); % 90% variance

%% Run k-means on a selected number of PC representations
load('voxelsXactions_pca.mat');
stimuli = voxelsXactions_pca'; % stimuli = actions x pc_components
stimuli = stimuli(:,1:57); % specify the number of PCs included in the analysis in the column of stimuli matrix
X = stimuli;

tic
% Perform k-means for different k = clusters
% [idx2 cent2 sumdist2 D2] = kmeans(X,2, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
% [idx3 cent3 sumdist3 D3] = kmeans(X,3, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
% [idx4 cent4 sumdist4 D4] = kmeans(X,4, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
[idx5 cent5 sumdist5 D5] = kmeans(X,5, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
[idx6 cent6 sumdist6 D6] = kmeans(X,6, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
[idx7 cent7 sumdist7 D7] = kmeans(X,7, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
[idx8 cent8 sumdist8 D8] = kmeans(X,8, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
[idx9 cent9 sumdist9 D9] = kmeans(X,9, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
[idx10 cent10 sumdist10 D10] = kmeans(X,10, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
[idx11 cent11 sumdist11 D11] = kmeans(X,11, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
[idx12 cent12 sumdist12 D12] = kmeans(X,12, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
[idx13 cent13 sumdist13 D13] = kmeans(X,13, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
[idx14 cent14 sumdist14 D14] = kmeans(X,14, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
[idx15 cent15 sumdist15 D15] = kmeans(X,15, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
% [idx16 cent16 sumdist16 D16] = kmeans(X,16, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
% [idx17 cent17 sumdist17 D17] = kmeans(X,17, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
% [idx18 cent18 sumdist18 D18] = kmeans(X,18, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
% [idx19 cent19 sumdist19 D19] = kmeans(X,19, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
% [idx20 cent20 sumdist20 D20] = kmeans(X,20, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');
toc

% Compute the silhouettes for each version of the kmeans
% silh2 = silhouette(X,idx2, 'cityblock');
% silh3 = silhouette(X,idx3, 'cityblock');
% silh4 = silhouette(X,idx4, 'cityblock');
silh5 = silhouette(X,idx5, 'cityblock');
silh6 = silhouette(X,idx6, 'cityblock');
silh7 = silhouette(X,idx7, 'cityblock');
silh8 = silhouette(X,idx8, 'cityblock');
silh9 = silhouette(X,idx9, 'cityblock');
silh10 = silhouette(X,idx10, 'cityblock');
silh11 = silhouette(X,idx11, 'cityblock');
silh12 = silhouette(X,idx12, 'cityblock');
silh13 = silhouette(X,idx13, 'cityblock');
silh14 = silhouette(X,idx14, 'cityblock');
silh15 = silhouette(X,idx15, 'cityblock');
% silh16 = silhouette(X,idx16, 'cityblock');
% silh17 = silhouette(X,idx17, 'cityblock');
% silh18 = silhouette(X,idx18, 'cityblock');
% silh19 = silhouette(X,idx19, 'cityblock');
% silh20 = silhouette(X,idx20, 'cityblock');


% Compute the sum of distances for each version of kmeans
sumOfdistances = [sum(sumdist5) sum(sumdist6) sum(sumdist7) sum(sumdist8) ...
                  sum(sumdist9) sum(sumdist10) sum(sumdist11) sum(sumdist12) ...
                  sum(sumdist13) sum(sumdist14) sum(sumdist15) ];
%                   sum(sumdist16) ...
%                   sum(sumdist17) sum(sumdist18) sum(sumdist19) sum(sumdist20)];
              

% Compute the average silhouette for each version
avgSilh = [mean(silh5) mean(silh6) mean(silh7) mean(silh8) mean(silh9) mean(silh10) ...
           mean(silh11) mean(silh12) mean(silh13) mean(silh14) mean(silh15) ];
%            mean(silh16) mean(silh17) mean(silh18) mean(silh19) mean(silh20)];
       

% Compute the proportion of negative silhouette
% propSilh2 = length(silh2(silh2<0))/length(silh2);
% propSilh3 = length(silh3(silh3<0))/length(silh3);
% propSilh4 = length(silh4(silh4<0))/length(silh4);
propSilh5 = length(silh5(silh5<0))/length(silh5);
propSilh6 = length(silh6(silh6<0))/length(silh6);
propSilh7 = length(silh7(silh7<0))/length(silh7);
propSilh8 = length(silh8(silh8<0))/length(silh8);
propSilh9 = length(silh9(silh9<0))/length(silh9);
propSilh10 = length(silh10(silh10<0))/length(silh10);
propSilh11 = length(silh11(silh11<0))/length(silh11);
propSilh12 = length(silh12(silh12<0))/length(silh12);
propSilh13 = length(silh13(silh13<0))/length(silh13);
propSilh14 = length(silh14(silh14<0))/length(silh14);
propSilh15 = length(silh15(silh15<0))/length(silh15);
% propSilh16 = length(silh16(silh16<0))/length(silh16);
% propSilh17 = length(silh17(silh17<0))/length(silh17);
% propSilh18 = length(silh18(silh18<0))/length(silh18);
% propSilh19 = length(silh19(silh19<0))/length(silh19);
% propSilh20 = length(silh20(silh20<0))/length(silh20);       
%        
propOfNegSilh = [propSilh5 propSilh6 propSilh7 propSilh8 propSilh9 propSilh10 propSilh11 ...
                 propSilh12 propSilh13 propSilh14 propSilh15 ];
             %propSilh16  propSilh17 propSilh18 propSilh19 propSilh20];     


%% Plot the objective measures to choose the optimal cluster number
%cd('/Users/burgen/Studies/Action100_BILKENT/subjects/subject01/SPM_wregressors/Clustering_PPC_volume_FINAL/Clustering/');

cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM/Clustering_PPC_volume_FINAL/Clustering/')

plot(sumOfdistances, 'LineWidth', 2, 'Color', 'r'); hold on
xticks([1:12])
xticklabels({'5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15'})
legend('Average sum of distances')
sfname =  'avg_sumofdistances';
saveas(gcf, sfname, 'png');
close(gcf);

plot(avgSilh, 'LineWidth', 2, 'Color', 'b'); hold on 
xticks([1:12])
xticklabels({'5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15'})
legend('Average silhouette')
sfname =  'avg_silh';
saveas(gcf, sfname, 'png');
close(gcf);

plot(propOfNegSilh, 'LineWidth', 2, 'Color', 'g'); hold on;
xticks([1:12])
xticklabels({'5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15'})
legend('Prop of negative silhouette')
sfname =  'propNeg';
saveas(gcf, sfname, 'png');
close(gcf);

save all_kmeans_results

% %% Plot silhouette image for the optimal cluster number
% % figure
% % [silh h] = silhouette(X,idx16, 'cityblock');
% % h = gca;
% % h.Children.EdgeColor = [.8 .8 1];
% % xlabel 'Silhouette Value'
% % ylabel 'Cluster'
% % 
% % sfname =  'silhValue_for_k=16';
% % saveas(gcf, sfname, 'png');
% % close(gcf);
% 
