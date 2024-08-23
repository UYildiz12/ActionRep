

maindir = '/san/burcu/ActionCluster100Bilkent/Subjects/';
subjname = 'subj02';
subjdir = [maindir subjname];
behavdir = [subjdir '/BehavioralData/'];
mvpaDir = [subjdir '/ANALYSIS/GLM_w_Regres_trials/'];


%% MODEL SPECIFICATION
matlabbatch{1}.spm.stats.fmri_spec.dir = {mvpaDir};
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 3;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 1;

% SESSION 1
for k = 1:8
    cd(subjdir);
    d = dir(['RUN' num2str(k) '_*']);
    rundir = d.name;
    cd(rundir);
    
    mFile = dir('rp_*');
    motionRegressorFile = mFile.name;
    
    epiScans = [];
    [epiScans3D dirs]= spm_select('List', pwd, '^swr.*\.nii$');
    if ischar(epiScans3D)
        for i = 1:length(epiScans3D)
            epiScans{1,i} = [pwd '/' epiScans3D(i,:)];
        end
    end
    
    matlabbatch{1}.spm.stats.fmri_spec.sess(k).scans = epiScans(1,:);
    
    matlabbatch{1}.spm.stats.fmri_spec.sess(k).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {});
    matlabbatch{1}.spm.stats.fmri_spec.sess(k).multi = {[behavdir 'Run' num2str(k)  '/CondInfoTrials.mat']};
    matlabbatch{1}.spm.stats.fmri_spec.sess(k).multi_reg = {[behavdir 'Run' num2str(k)  '/all_regres.txt']};
    matlabbatch{1}.spm.stats.fmri_spec.sess(k).hpf = 128;
    
    clear epiScans3D dirs epiScans
    
end


%MODEL ESTIMATION
spmmatDir = [mvpaDir 'SPM.mat'];
matlabbatch{1}.spm.stats.fmri_est.spmmat = {spmmatDir}; %'SPM.mat' file generated in the previous step will be spcified here
matlabbatch{1}.spm.stats.fmri_est.method.Classical = 1;

%%

spm_jobman('run', matlabbatch);



