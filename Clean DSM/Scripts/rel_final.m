
%% Beta Design: 58 video + ISI + Q + Rest + 6xMotion Regressors (67 beta) e.g. beta68 is for video 1

beta_path='C:\Program Files (x86)\Umram\ActionClusters Project\ActionClusters(mixed)\Analysis\spm\sub2\1st level_RSA';
cd(beta_path)


action_beta_indices = {};
act_indices = [1:67:1072];

for i = 1:length(act_indices)
   action_beta_indices{i} = [act_indices(i):(act_indices(i)+57)];
end
action_beta_indices = cell2mat(action_beta_indices);


%read all betas
betas = [];
allvoxels = [];

for t = action_beta_indices

    filename=['beta_' sprintf('%04d',t) '.nii'];
    
    % Check if the file exists
    if ~isfile(filename)
        fprintf('File %s does not exist.\n', filename);
        continue;
    end
    
    Matrix = spm_read_vols(spm_vol(filename));
    
    % Check if all the values in the Matrix are NaN
    if all(isnan(Matrix(:)))
        fprintf('All values in the Matrix for file %s are NaN.\n', filename);
    end
    
    allvoxels = Matrix(:)';
    betas = [betas ; allvoxels]; % betas x voxels (400 x ~500000)
    
    % Check if all values in betas are NaN after each iteration
    if all(isnan(betas(:)))
        fprintf('All values in the Betas matrix are NaN after reading file %s.\n', filename);
    end
    
end



%reshape the betas so that each run is stacked across 3rd dimension
shaped_betas=zeros(58,565812,16); % change 4 to 16
for i=1:16 % change 4 to 16
    shaped_betas(:,:,i) = betas(1+58*(i-1):i*58,:);
end

betas_part_1=shaped_betas(:,:,1:8); %session 1 run 1 to 8
betas_part_2=shaped_betas(:,:,9:16); %session 2 run 1 to 8

rel_mean_betas_1=mean(betas_part_1,3)'; %session 1, avg. run 1 to 8
rel_mean_betas_2=mean(betas_part_2,3)'; %session 2, avg. run 1 to 8

%% Create reliability matrix

reliability_matrix = [];
for i = 1:size(rel_mean_betas_1,1)
   r1 = rel_mean_betas_1(i,:);
   r2 = rel_mean_betas_2(i,:); 
   reliability_matrix(i) = 1 - pdist2(r1, r2,'correlation');
end

sub_path='C:\Program Files (x86)\Umram\ActionClusters Project\ActionClusters(mixed)\Analysis\spm\sub1';
cd(sub_path)

save reliability_matrix reliability_matrix


%% Create reliability map as a nifti file

cd(beta_path);

%load one of the beta files as baseline
Map = spm_read_vols(spm_vol('beta_0001.nii'));
Map_3D_reliability = reshape(reliability_matrix, size(Map,1),size(Map,2),size(Map,3));

C = spm_vol('beta_0001.nii');
C.name = 'Map_3d_reliability.nii';
C.fname = 'Map_3d_reliability.nii';

cd(sub_path);
spm_write_vol(C,Map_3D_reliability);


%% Realiability thresholds

%correlations to be tested
r=0.1:0.1:0.8;

NaN_voxels = isnan(reliability_matrix);
bad_voxel_indices = find(NaN_voxels == 1);
good_voxel_indices = find(NaN_voxels == 0);

reliability_matrix_good = reliability_matrix(good_voxel_indices); % non NaN voxel values

%find voxels whose reliability/correlatio score is > r

% Get the total number of voxels
num_voxels_remaining = zeros(1, 8);

% Get the total number of voxels
total_voxels = length(reliability_matrix_good);
percentage_voxels_remaining = zeros(1, 8); % for storing percentage

for j = 1:8
    indices = find(reliability_matrix_good > r(j));
    reliability_matrix_good = reliability_matrix_good(indices);
    actual_indices = good_voxel_indices(indices);

    % Store the number of voxels remaining after this threshold
    num_voxels_remaining(j) = length(indices);

    % Calculate the percentage of voxels remaining
    percentage_voxels_remaining(j) = (length(indices) / total_voxels) * 100;
    fprintf('Threshold r=%.1f: %d voxels remaining (%.2f%%)\n', r(j), length(indices), percentage_voxels_remaining(j));
    fprintf('Threshold r=%.1f: %d voxels remaining (%.2f%%)\n', r(j), length(indices), percentage_voxels_remaining);
    Rel1_matrix = rel_mean_betas_1(actual_indices,:);
    Rel2_matrix = rel_mean_betas_2(actual_indices,:);
    

    cond_corr_mat = []

    for i = 1:58
        cond_rel1 = Rel1_matrix(:,i)';
        cond_rel2 = Rel2_matrix(:,i)';
        cond_corr = 1 - pdist2(cond_rel1, cond_rel2,'correlation');
        cond_corr_mat(:, i) = cond_corr;
    end
    corr_matrix(j,:)=cond_corr_mat(:)';
    saveas(gcf, sprintf('plot_r%02d.png', j));
end

disp(num_voxels_remaining);

% Plot the percentage of voxels remaining
figure;
plot(r, percentage_voxels_remaining, '-o', 'LineWidth', 2, 'MarkerSize', 10);
xlabel('Reliability Threshold', 'FontSize', 14);
ylabel('Percentage of Voxels Remaining', 'FontSize', 14);
title('Percentage of Voxels Remaining vs. Reliability Threshold', 'FontSize', 16);
grid on;
set(gca, 'FontSize', 12);
saveas(gcf, 'percentage_voxels_remaining.png');


disp(num_voxels_remaining);
figure;
for i = 1:size(corr_matrix,2)
    action = corr_matrix(:,i);
    plot(action, 'Color', 'g', 'LineWidth', 0.55); hold on; 
end

%%
reliability_matrix_good = reliability_matrix(good_voxel_indices); % non NaN voxel values
average_videos = mean(corr_matrix,2);
plot(average_videos, 'Color', 'k', 'LineWidth', 4);

[y_sorted, y_index] = sort(average_videos, 'descend');
highest_two_points = y_sorted(1:2);
highest_two_points_index = y_index(1:2);
if any(highest_two_points_index == 8)
    highest_two_points_index(highest_two_points_index == 8) = [];
    highest_two_points_index = [highest_two_points_index; y_index(3)];
    highest_two_points = [highest_two_points(1); y_sorted(3)];
end

% Plot the highest two points in red and filled
plot(highest_two_points_index, highest_two_points, 'ro', 'MarkerFaceColor', 'r');

% Show their values beside them
for i = 1:length(highest_two_points)
    text(highest_two_points_index(i), highest_two_points(i)+0.05, num2str(highest_two_points(i)), 'Color', 'r');
end

cd(sub_path)
save average_videos average_videos
%%

reliability_matrix_good = reliability_matrix(good_voxel_indices); % non NaN voxel values
cond_corr_mat_r01 = corr_matrix(1,:);
cond_corr_mat_r02 = corr_matrix(2,:);
cond_corr_mat_r03 = corr_matrix(3,:);
cond_corr_mat_r04 = corr_matrix(4,:);
cond_corr_mat_r05 = corr_matrix(5,:);
cond_corr_mat_r06 = corr_matrix(6,:);
cond_corr_mat_r07 = corr_matrix(7,:);
cond_corr_mat_r08 = corr_matrix(8,:);

%Best case seems to be r05 or r06
    
%%

reliability_matrix_good = reliability_matrix(good_voxel_indices); % non NaN voxel values

thresholds = [0.1, 0.2, 0.3, 0.4, 0.5];

for i = 1:length(thresholds)
    threshold = thresholds(i);
    
    indices = find(reliability_matrix_good > threshold);
    reliability_matrix_good_threshold = reliability_matrix_good(indices);
    actual_indices = good_voxel_indices(indices);
    indices_smaller = find(reliability_matrix_good <= threshold);
    actual_indices_smaller = good_voxel_indices(indices_smaller);

    reliability_map = reliability_matrix;
    reliability_map(actual_indices_smaller) = 0;
    reliability_map(actual_indices) = 1;

    cd(beta_path);
    Map = spm_read_vols(spm_vol('beta_0001.nii'));
    Map_3D = reshape(reliability_map, size(Map,1),size(Map,2),size(Map,3));

    C = spm_vol('beta_0001.nii');
    C.name = ['Map_3d_r', num2str(threshold), '.nii'];
    C.fname = ['Map_3d_r', num2str(threshold), '.nii'];
    cd(sub_path);
    spm_write_vol(C,Map_3D);
end





