%% Action Attention Multiple Regression RSA 2 %% Aslı Eroğlu %% Active Session

% multiple regression RSA: low_level_vision + actor model + effector model + target model

analysis_path='E:\ActionAttention_RSA\MR_RSA2';
input_path='E:\spm_ActionAttention\subjects'; %get ind. masks after 1st level anaylsis

tot_sub=17;

cd(analysis_path)

load RDMs_active.mat %'RDM' includes 3 models: actor_model, effector_model, target_model
load lowlevel_vision.mat %low level visual features matrix. name is 'simMatrix'

%it is a similarity matrix. lets turn it into dissimilarity matrix:
low_level_diss=1-simMatrix;

models=fieldnames(RDM); %cell array includes the name of the models
tot_mod=length(fieldnames(RDM));

for sub_no = 1:17


    sub_path=fullfile(input_path,['sub' num2str(sub_no)]);
    data_path=fullfile(sub_path, '1stlevel_active');
    mask_fn=fullfile(data_path, 'mask.nii'); % whole brain mask created after 1st level analysis

    output_path=fullfile(analysis_path,'subject_level\active');
    
    data_fn=fullfile(data_path,'SPM.mat');

    targets=repmat(1:28,1,8);
    chunks=repelem(1:8,28);
    
    ds=cosmo_fmri_dataset([data_fn ':beta'],'mask',mask_fn,'targets',targets,'chunks',chunks);
    
    % masking to get only interested variables and get rid of the rest, isi, and inst
    % check your ds structure and decide which one to keep
    
    var_mask=[];
    for i=1:8 %number of runs
        for j=1:24 %total variable number we insterested
            var_mask=[var_mask, 1];
        end
    
        for k=1:4  %total variable number we are not insterested
            var_mask=[var_mask, 0];
        end
    end
    
    %logical mask with 1s and 0s. (if it is not "logical", it doesnt work)
    var_mask=logical(var_mask);
    
    %now we will have the data structure with desired variables
    ds=cosmo_slice(ds,var_mask,1);

    %average pattern for each condition across runs
    ds=cosmo_fx(ds,@(x)mean(x,1),'targets');

    %classes (in my case, each task is one class). not obligatory but might
    %be useful
    ds.sa.class=repelem(1:3,8)';

    %remove NaNs
    ds = cosmo_remove_useless_data(ds);

    % simple sanity check to ensure all attributes are set properly
    cosmo_check_dataset(ds);

    %% Define feature neighorhoods
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % For the searchlight, define neighborhood for each feature (voxel).
    nvoxels_per_searchlight=100;
    
    nbrhood=cosmo_spherical_neighborhood(ds,'count',nvoxels_per_searchlight);
 
    %cosmo_disp(nbrhood);
    
    % set measure
    measure=@cosmo_target_dsm_corr_measure;
    measure_args=struct();
    measure_args.type = 'Pearson'; % for corr between target & actual
    measure_args.center_data = 1; % subtract voxel means
    measure_args.progress=false; % do not show progress
    measure_args.glm_dsm={low_level_diss, RDM.actor_model, RDM.effector_model, RDM.target_model}; 

    %for single regression, use target_dsm instead of glm_dsm.
    %such as measure_args.target_dsm=RDM.actor_model
      
    % run searchlight
    ds_rsm_binary=cosmo_searchlight(ds,nbrhood,measure,measure_args);
    
    %Fisher-transform so that values are more normally distributed -
    %for group level analysis

    ds_rsm_binary.samples=atanh(ds_rsm_binary.samples);
   
    % store results
    fn_nii=['sub' sprintf('%02d',sub_no) '_mr_rsa2.nii'];
    fn_mat=['sub' sprintf('%02d',sub_no) '_mr_rsa2.mat'];

    output_fn=fullfile(output_path,fn_nii);
    cosmo_map2fmri(ds_rsm_binary,output_fn);

    save([output_path '\' fn_mat], 'ds_rsm_binary')


end

