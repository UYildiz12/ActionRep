
beta_path = 'C:\Program Files (x86)\Umram\ActionClusters Project\ActionClusters(mixed)\Analysis\spm\sub2\1st level_RSA';
cd(beta_path);

betas = [];

for t = 1:1088  % Corrected loop limit
    
    if t >= 1 && t <= 9
        filename = ['beta_000' num2str(t) '.nii'];
    elseif t >= 10 && t <= 99
        filename = ['beta_00' num2str(t) '.nii'];
    elseif t >= 100 && t <= 999   
        filename = ['beta_0' num2str(t) '.nii'];
    elseif t >= 1000 && t <= 1088  
        filename = ['beta_' num2str(t) '.nii'];
    end
    
    Matrix = spm_read_vols(spm_vol(filename));
    allvoxels = Matrix(:)';
    betas = [betas; allvoxels];
end

% Clean up if there are NaN values
betas_cleaned = betas(:, ~any(isnan(betas), 1));

allBetas = betas_cleaned;

% Create the directory if it doesn't exist
if ~exist('WholeBrain', 'dir')
    mkdir('WholeBrain');
end

cd('WholeBrain')
save('allBetas_WB', 'allBetas')

%%
action_betas = [];
action_beta_indices = {};
act_indices = [1:67:1072];

for i = 1:length(act_indices)
   action_beta_indices{i} = [act_indices(i):(act_indices(i)+57)];
   action_betas = [action_betas; allBetas(action_beta_indices{i},:)];
end
save action_betas action_betas
action_betas_MEAN = mean(action_betas,3);
save action_betas_MEAN action_betas_MEAN


window_size = 58;

num_windows = floor(size(action_betas, 1) / window_size);
mean_betas = zeros(window_size, size(action_betas,2));

for i = 1:window_size
    for n=1:size(action_betas,2)
         l=0;
        for x=1:num_windows
            l= l+action_betas(i+((x-1)*58),n);
        end
    mean_betas(i,n)= l/num_windows;
    end
end

%% 

%%%
% Save action_betas_mean_matrix
save('actmean_betas.mat', 'mean_betas');
