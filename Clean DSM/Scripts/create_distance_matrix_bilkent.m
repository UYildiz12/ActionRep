
cd('/Users/burgen/Studies/Action100Clustering/subj01/');

% %% RDM based on ICA components
% load('voxelsXactions_ica.mat');
% stimuli = voxelsXactions_ica;
% 
% ActionRDM_ica = [];
% for i = 1:100
%     for j = 1:100
%         ActionRDM_ica(i,j) = pdist2(stimuli(:,i)', stimuli(:,j)','correlation');
%     end
% end
% save ActionRDM_ica ActionRDM_ica
% 
% load('colorData.mat');
% matcol = RdBu10;
% matcol = flipud(matcol);
% matcol = matcol(2:end,:);
% 
% imagesc(ActionRDM_ica)
% axis off
% colormap(matcol)
% colorbar
% %set(gca, 'CLim', [0.85, 1]);
% sfname =  'ActionRDM_ica';
% saveas(gcf, sfname, 'png');
% close(gcf);
% 
% 
% %% RDM based on PCA components
% cd('/Users/burgen/Studies/Action100Clustering/subj1_final');
% load('voxelsXactions.mat');
% voxelsXactions_pca = PCA(voxelsXactions,100);
% save voxelsXactions_pca voxelsXactions_pca
% 
% load('voxelsXactions_pca.mat');
% stimuli = voxelsXactions_pca'; % stimuli = actions x pc_components
% stimuli = stimuli(:,1:10);
% 
% % ActionRDM_pca = [];
% % ActionRDM_pca = pdist(stimuli,'cosine');
% % ActionRDM_pca = squareform(ActionRDM_pca);
% % save ActionRDM_pca ActionRDM_pca
% 
% ActionRDM_pca10 = [];
% ActionRDM_pca10 = pdist(stimuli,'cosine');
% ActionRDM_pca10 = squareform(ActionRDM_pca10);
% save ActionRDM_pca10 ActionRDM_pca10
% 
% 
% ActionRDM_pca10_eucl = [];
% ActionRDM_pca10_eucl = pdist(stimuli,'euclidean');
% ActionRDM_pca10_eucl = squareform(ActionRDM_pca10_eucl);
% save ActionRDM_pca10_eucl ActionRDM_pca10_eucl
% 
% 
% ActionRDM_pca10_city = [];
% ActionRDM_pca10_city = pdist(stimuli,'cityblock');
% ActionRDM_pca10_city = squareform(ActionRDM_pca10_city);
% save ActionRDM_pca10_city ActionRDM_pca10_city
% 
% 
% ActionRDM_pca10_mink = [];
% ActionRDM_pca10_mink = pdist(stimuli,'cityblock');
% ActionRDM_pca10_mink = squareform(ActionRDM_pca10_mink);
% save ActionRDM_pca10_mink ActionRDM_pca10_mink
% 
% 
% ActionRDM_pca10_corr = [];
% ActionRDM_pca10_corr = pdist(stimuli,'cityblock');
% ActionRDM_pca10_corr = squareform(ActionRDM_pca10_corr);
% save ActionRDM_pca10_corr ActionRDM_pca10_corr
% 
% 
% % ActionRDM_pca_eucl = pdist(stimuli,'euclidean');
% % ActionRDM_pca_eucl = squareform(ActionRDM_pca_eucl);
% % save ActionRDM_pca_eucl ActionRDM_pca_eucl
% % 
% % ActionRDM_pca_city = pdist(stimuli,'cityblock');
% % ActionRDM_pca_city = squareform(ActionRDM_pca_city);
% % save ActionRDM_pca_city ActionRDM_pca_city
% % 
% % ActionRDM_pca_cor = pdist(stimuli,'correlation');
% % ActionRDM_pca_cor = squareform(ActionRDM_pca_cor);
% % save ActionRDM_pca_cor ActionRDM_pca_cor
%  
%  
%  
% load('colorData.mat');
% matcol = RdBu10;
% matcol = flipud(matcol);
% matcol = matcol(2:end,:);
% 
% imagesc(ActionRDM_pca10)
% axis off
% colormap(matcol)
% colorbar
% %set(gca, 'CLim', [0.85, 1]);
% sfname =  'ActionRDM_pca10';
% saveas(gcf, sfname, 'png');
% close(gcf);

%% No dimensionality reduction

cd('/Users/burcuaysenurgen/Documents/Projects/ActionClusters/Data_fMRI/subjects/subject01/SPM12_FirstLevel/Clustering_PPC_volume_spm12');
load('voxelsXactions.mat');
stimuli = voxelsXactions;

ActionRDM_voxels = [];
for i = 1:100
    for j = 1:100
        ActionRDM_voxels(i,j) = pdist2(stimuli(:,i)', stimuli(:,j)','euclidean');
    end
end
save ActionRDM_voxels ActionRDM_voxels


cd('/Users/burcuaysenurgen/Documents/Projects/ActionClusters/Scripts');
load('colorData.mat');
matcol = RdBu10;
matcol = flipud(matcol);
matcol = matcol(2:end,:);

cd('/Users/burcuaysenurgen/Documents/Projects/ActionClusters/Data_fMRI/subjects/subject01/SPM12_FirstLevel/Clustering_PPC_volume_spm12');
imagesc(ActionRDM_voxels)
axis off
colormap(matcol)
colorbar
%set(gca, 'CLim', [0.85, 1]);
sfname =  'ActionRDM_voxels';
saveas(gcf, sfname, 'png');
close(gcf);


