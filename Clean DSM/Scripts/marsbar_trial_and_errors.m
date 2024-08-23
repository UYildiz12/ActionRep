
% Open SPM Results
% Select a contrast, e.g. action1
% Choose the following options: mask with image => select ROI file (e.g.
% PPC nii file), then set p threshold to 1
% Look at the workspace: xSPM struct is created

ppc2 = xSPM.XYZ;
save ppc2 ppc2

% we need to specify a: How?
% 'a' should be SPM.xY.P
action2_con = spm_get_data(a, ppc2);

%% Define the x,y,z coordinates of the ROI: e.g. PPC
cd('/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ROIs/');
seedroi = 'Clustering_PPC_volume_FINAL.nii';
Y = spm_read_vols(spm_vol(seedroi),1);
indx = find(Y>0);
[x,y,z] = ind2sub(size(Y),indx);

XYZ = [x y z]';

%%
A = spm_get_data(SPM.xY.P, XYZ);



%% MARSBAR
spm_name = '/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM/SPM.mat';
roi_file = '/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ROIs/Clustering_PPC_volume_FINAL_roi.mat';

% Make marsbar design object
D  = mardo(spm_name);
% Make marsbar ROI object
R  = maroi(roi_file);
% Fetch data into marsbar data object
Y  = get_marsy(R, D, 'mean');
% Estimate design on ROI data
E = estimate(D, Y);

% Get compound event types structure
ets = event_types_named(E);
n_event_types = length(ets);
dur = 9;
for e_t = 1:n_event_types
    fitted_tc(:, e_t) = event_fitted(E, ets(e_t).e_spec, dur);
end



%%
region_no = 1;

% Help yourself to information
voxel_data = region_data(Y, region_no);
voxel_data = voxel_data{1};
voxel_xyz  = xyz(Y, region_no, 'mm');

voxel_xyz_vox  = xyz(Y, region_no, 'vox'); % XYZ in spm_graph


%%
% So, say your TR was
% around 2.5, then the time course would have; dt = 2.5 / 16; 34 / dt =
% 217 time points.


%%

% FORMAT [tc dt]  = event_fitted(D, e_spec, dur);
%   D          - design
%   e_spec     - 2 by N array specifying events to combine
%                   with row 1 giving session number
%                   and row 2 giving event number in session
%                   This may in due course become an object type
%   dur        - duration in seconds of event to estimate for
%
%   Returns
%   tc         - fitted event time course, averaged over events
%   dt         - time units (seconds per row in X)


% SAMPLE CODE TO EXTRACT FIR EVENT TIME COURSE - THIS SHOULD BE ADOPTED FOR
% FITTED TIME COURSE
% % Get compound event types structure
% ets = event_types_named(E);
% n_event_types = length(ets);
% % Bin size in seconds for FIR
% bin_size = tr(E);
% % Length of FIR in seconds
% fir_length = 24;
% % Number of FIR time bins to cover length of FIR
% bin_no = fir_length / bin_size;
% % Options - here 'single' FIR model, return estimated % signal change
% opts = struct('single', 1, 'percent', 1);
% for e_t = 1:n_event_types
%    fir_tc(:, e_t) = event_fitted_fir(E, ets(e_t).e_spec, bin_size, ...
%       bin_no, opts);
% end

