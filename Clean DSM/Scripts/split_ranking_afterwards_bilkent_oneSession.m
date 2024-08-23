

cd('/Users/burcuaysenurgen/Documents/Projects/ActionClusters/Data_fMRI/subjects/subject01/Session1/SPM_oneSession_2_2_2/Clustering_PPC_volume_spm12_2_2_2/');
load('sorted_action_betas.mat');
[avg_ranked_value_mat_100splits] = split_ranking_procedure_bilkent_oneSession(sorted_action_betas);
save avg_ranked_value_mat_100splits avg_ranked_value_mat_100splits

%% Fit a polynomial curve and plot
% rank = linspace(1,100);
% beta = avg_ranked_value_mat_100splits(:,900)'; % 100th voxel
% % Fit 2nd order polynomial
% p = polyfit(rank,beta,3);
% y1 = polyval(p,rank);
% figure
% plot(rank,beta,'o');
% hold on
% plot(rank,y1);
% hold off

%% Take the non-parametric correlation between rank and value for all voxels
x = [1:100];
correlation_all_voxels = [];
for j = 1:size(avg_ranked_value_mat_100splits,2)   
    y = avg_ranked_value_mat_100splits(:,j);
    [corr_rank_value pval] = corr(x(:),y(:));
    correlation_all_voxels(j) = corr_rank_value;
    pval_all_voxels(j) = pval;
end
f1 = figure;
histogram(correlation_all_voxels, 'FaceColor', [0.5 0.5 0.5]);
saveas(f1, 'histogram_correlation_all_voxels.png')

save correlation_all_voxels correlation_all_voxels
save pval_all_voxels pval_all_voxels

%% Select the significant voxels

significant_voxel_indices = find(pval_all_voxels < 0.05);
save significant_voxel_indices significant_voxel_indices

correlation_signif_voxels = correlation_all_voxels(significant_voxel_indices);
f2 = figure;
histogram(correlation_signif_voxels,  'FaceColor', [0.5 0.5 0.5]);
saveas(f2, 'histogram_correlation_signif_voxels.png')

percentage_signif = length(significant_voxel_indices)/length(pval_all_voxels);
save percentage_signif percentage_signif

avg_ranked_value_mat_100splits_signif = avg_ranked_value_mat_100splits(:,significant_voxel_indices);
save avg_ranked_value_mat_100splits_signif avg_ranked_value_mat_100splits_signif

%% Compute SI for each voxel - the rank that corresponds to the 50% of the maximum beta response
SI_all_voxels = [];
x = [1:100];
SI = [];
for j = 1:size(avg_ranked_value_mat_100splits_signif,2)
    y = avg_ranked_value_mat_100splits_signif(:,j)';
   
    p = polyfit(x,y,3); % 3rd order
    max_y = max(y);
    min_y = min(y);
    
    mean_y = (max_y - min_y)/2;
    halfway_cutoff = min_y + mean_y;
    
%     r = roots([p(1) p(2) (p(3) - max_y_50perc)]);
%     SI = r(2);
    
    y_output = p(1).*(x.^3) + p(2).*(x.^2) + p(3).*(x) + p(4); % Third order
%    y_output = p(1).*(x.^5) + p(2).*(x.^4) + p(3).*(x.^3) + p(4).*(x.^2) + p(5).*(x) + p(6); % Fifth order
    
    yi = halfway_cutoff;
    xi = interp1(y_output,x,yi, 'nearest', 'extrap');
    SI = xi;
      
    SI_all_voxels(j) = SI;
end

save SI_all_voxels SI_all_voxels

f3 = figure;
histogram(SI_all_voxels,  'FaceColor', [1 0 0])
saveas(f3, 'histogram_SI_signif_voxels.png')

