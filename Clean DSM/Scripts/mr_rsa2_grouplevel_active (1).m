%% Action Attention Multiple Regression RSA 2 %% Combine Subject Level Results %% Active Session %%

analysis_path='E:\ActionAttention_RSA\MR_RSA2';
tot_sub=17;

%% merge individual maps into group-level map for further statistics

mask_fn=fullfile(analysis_path, 'rmni_brain_mask.nii');

alignedGroupMap = cell(tot_sub,1);

for sub_no = 1:tot_sub

    rsa_sub_path=[analysis_path '\subject_level\active'];
    rsa_model_fn=sprintf('sub%02d_mr_rsa2.nii',sub_no);

    alignedGroupMap{sub_no} = cosmo_fmri_dataset(fullfile(rsa_sub_path, rsa_model_fn), 'mask', mask_fn);

    % because the output of brain maps are four rows results, targets are
    % labeled as 1,2,3,4

    % the first row -> low level visual model
    % the second row -> actor model
    % the third row -> effector model
    % the fourth row -> target model

    alignedGroupMap{sub_no}.sa.targets = [1 2 3 4]';
    alignedGroupMap{sub_no}.sa.chunks = zeros(4,1)+sub_no;

    %fisher transform
    %alignedGroupMap{sub_no}.samples=atanh(alignedGroupMap{sub_no}.samples);

end

dsGroup = cosmo_stack(alignedGroupMap);
dsGroup = cosmo_remove_useless_data(dsGroup);

%% save data
group_path=fullfile(analysis_path,'group_level\active');
cosmo_map2fmri(dsGroup, fullfile(group_path, sprintf('mr_rsa2_group_results_all.nii')));

%% split data according to different types of models
ds_sliced = cosmo_split(dsGroup, 'targets', 1);

% low level visual model
cosmo_map2fmri(ds_sliced{1},fullfile(group_path, 'mr_rsa2_group_low_level_visual.nii'));

% actor model
cosmo_map2fmri(ds_sliced{2},fullfile(group_path, 'mr_rsa2_group_actor_model.nii'));

% effector model
cosmo_map2fmri(ds_sliced{3},fullfile(group_path, 'mr_rsa2_group_effector_model.nii'));

% target model 
cosmo_map2fmri(ds_sliced{4},fullfile(group_path, 'mr_rsa2_group_target_model.nii'));

