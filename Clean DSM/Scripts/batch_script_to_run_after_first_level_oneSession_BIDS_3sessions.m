
% Scripts to run after first level

extract_voxels_for_a_given_ROI_BIDS_3session('Clustering_LOTC_volume_final');
extract_voxels_for_a_given_ROI_BIDS_3session('Clustering_PPC_volume_FINAL');
extract_voxels_for_a_given_ROI_BIDS_3session('Clustering_PMC_volume_FINAL');

extract_action_betas_BIDS_3session('Clustering_LOTC_volume_final');
extract_action_betas_BIDS_3session('Clustering_PPC_volume_FINAL');
extract_action_betas_BIDS_3session('Clustering_PMC_volume_FINAL');


