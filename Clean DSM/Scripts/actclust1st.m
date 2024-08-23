% List of open inputs
nrun = 16; % enter the number of runs here
jobfile = {'C:\Program Files (x86)\Umram\ActionClusters Project\ActionClusters(mixed)\Analysis\actclust1st_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
