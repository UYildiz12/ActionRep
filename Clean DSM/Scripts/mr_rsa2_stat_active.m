%% Action Attention Multiple Regression RSA 1 %% Create Statistical Maps %%

analysis_path= 'E:\ActionAttention_RSA\MR_RSA2';
group_path=fullfile(analysis_path,'group_level\active');

tot_sub=17;
model_names={'low_level_visual', 'actor_model', 'effector_model', 'target_model'};

%% load data and do TFCE statistics for group-level statistical analysis

for model = 1:length(model_names)

    ds = cosmo_fmri_dataset(fullfile(group_path, sprintf('mr_rsa2_group_%s.nii', model_names{model})));
    ds = cosmo_slice(ds, 1:tot_sub, 1);
    ds.sa.targets = ones(tot_sub,1);
    ds.sa.chunks = (1:tot_sub)';
    ds = cosmo_remove_useless_data(ds);
    nbrhood = cosmo_cluster_neighborhood(ds);
    
    %TFCE set parameters
    opt = struct();
    opt.cluster_stat = 'tfce';
    opt.niter = 5000;        
    opt.h0_mean = 0;
    opt.dh = 0.1;
    %opt.nproc = 4;
    
    % run analysis with montercarlo
    ds_z = cosmo_montecarlo_cluster_stat(ds, nbrhood, opt);
    
    % save data
    cosmo_map2fmri(ds_z, fullfile(group_path, sprintf('mr_rsa2_TFCE_%s.nii', model_names{model})));
    
    %% make statistics maps (z>1.65)
    dstarget = cosmo_slice(ds, length(ds.samples(:,1)), 1);% get the data structure as ds
    dstarget.samples(ds_z.samples<1.65)=0;

    % save data
    cosmo_map2fmri(dstarget,fullfile(group_path,sprintf('mr_rsa2_TFCE_%s_statmap.nii', model_names{model})));

end