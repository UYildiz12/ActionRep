%% Action Attention Multiple Regression RSA 2 %% Combine Subject Level Results %% Active Session %%
alignedGroupMap = cell(tot_sub,1);
sub_no = 1;
analysis_path = sprintf('C:\\Users\\UmurY\\OneDrive\\Masaüstü\\Action_Clusters_Python\\Raw_Files\\Sub%d_WB_Rel\\subject_level\\active', sub_no);
tot_sub=2;
data_path=sprintf('C:\\Program Files (x86)\\Umram\\ActionClusters Project\\ActionClusters(mixed)\\Analysis\\spm\\sub%d\\1st level_RSA', sub_no);
mask_fn=fullfile(data_path, 'mask.nii');
rsa_sub_path=[analysis_path];
rsa_model_fn=sprintf('sub%02d_mr_rsa.nii',sub_no);
ds1=cosmo_fmri_dataset(fullfile(rsa_sub_path, rsa_model_fn), 'mask', mask_fn);
alignedGroupMap{sub_no}=ds1;

%%
sub_no = 2;
analysis_path = sprintf('C:\\Users\\UmurY\\OneDrive\\Masaüstü\\Action_Clusters_Python\\Raw_Files\\Sub%d_WB_Rel\\subject_level\\active', sub_no);
tot_sub=2;
data_path=sprintf('C:\\Program Files (x86)\\Umram\\ActionClusters Project\\ActionClusters(mixed)\\Analysis\\spm\\sub%d\\1st level_RSA', sub_no);
mask_fn=fullfile(data_path, 'mask.nii');
rsa_sub_path=[analysis_path];
rsa_model_fn=sprintf('sub%02d_mr_rsa.nii',sub_no);
ds2=cosmo_fmri_dataset(fullfile(rsa_sub_path, rsa_model_fn), 'mask', mask_fn);
alignedGroupMap{sub_no}=ds2;
%%
[idxs,ds_intersect_cell]=cosmo_mask_dim_intersect(alignedGroupMap);
%%
for sub_no=1:2
    % because the output of brain maps are four rows results, targets are
    % labeled as 1,2,3,4,5

    % the first row -> AAction Class
    % the second row -> Background
    % the third row -> Gabor
    % the fourth row -> NoOfPeople
    % the fifth row -> OpticalFlow
    ds=ds_intersect_cell{sub_no];
    n_samples=size(ds.samples,1);
    ds.sa.chunks=ones(nsamples,1)*subject_i;

ds.sa.targets = [1 2 3 4 5]';


    %fisher transform
    %alignedGroupMap{sub_no}.samples=atanh(alignedGroupMap{sub_no}.samples);
end
%%
dsGroup = cosmo_stack(alignedGroupMap);
dsGroup = cosmo_remove_useless_data(dsGroup);

%% save data
group_path=fullfile(analysis_path);
cosmo_map2fmri(dsGroup, fullfile(group_path, sprintf('mr_rsa_grouptest_sub%02d.nii',sub_no)));

%% split data according to different types of models
ds_sliced = cosmo_split(dsGroup, 'targets', 1);

% Define model names
model_names={'Action_Class', 'Background', 'Gabor_bank', 'NoOfPeople','Opticalflow'};

% Ensure that the number of models matches the number of slices
assert(numel(model_names) == numel(ds_sliced));

% Save each model to a separate .nii file
for i = 1:numel(model_names)
    model_name = model_names{i};
    output_filename = fullfile(group_path, sprintf('mr_rsa_group_%s.nii', model_name));
    cosmo_map2fmri(ds_sliced{i}, output_filename);
end
