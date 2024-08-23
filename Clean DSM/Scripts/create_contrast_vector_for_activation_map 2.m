
% Contrast vector for activation map

long_runs = [1 1 1 1 1 1 1 1 1 1 1 1 1 -13 0 0 0 0 0 0 0 0 0];

long_runs_all = repmat(long_runs, 1, 4);

short_runs = [1 1 1 1 1 1 1 1 1 1 1 1 -12 0 0 0 0 0 0 0 0 0];

short_runs_all = repmat(short_runs, 1, 4);

runs = [0 0 0 0 0 0 0 0];

allActions_vs_fix = [long_runs_all short_runs_all runs];
save allActions_vs_fix allActions_vs_fix
