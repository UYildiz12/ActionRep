
function [avg_ranked_value_mat_100splits] = split_ranking_procedure_bilkent_BIDS_2session(data)

% Split ranking procedure
ranked_value_mat_100splits = [];
for k = 1:100 % repeat splitting 100 times
    
    % Split the betas into two random groups
    randindices = randperm(8);
    
    indices_for_rank = randindices(1:4); % normally should be 1:6
    indices_for_value = randindices(5:8); % normally should be 7:12
    
    % Get the 6 betas for rank and 6 betas for value
    rank_vector = data(:,:,indices_for_rank);
    value_vector = data(:,:,indices_for_value);
    
    % Get the mean of 6 betas for rank, and mean of the 6 betas for value
    mean_rank_vector = mean(rank_vector,3);
    mean_value_vector = mean(value_vector,3);
    
    % Do the ranking for each voxel based on the rank betas (above), and
    % sort the betas for value according to this rank
    mean_value_vector_ranked = [];
    for i = 1:size(mean_rank_vector,1) % go through all voxels
        
        vect_rank = mean_rank_vector(i,:); % for each voxel, get the 100 action element vector
        [ranked_vect rank_index] = sort(vect_rank, 'descend'); % sort into descending order so that rank 1st is the 1st element
        
        vect_value = mean_value_vector(i,:); % for each voxel, get the 100 action element vector
        mean_value_vector_ranked(i,:) = vect_value(rank_index); % get the ordered mean value vector based on rank for each voxel
        
    end
    
    ranked_value_mat_100splits(:,:,k) = mean_value_vector_ranked;
    
end

avg_ranked_value_mat_100splits = mean(ranked_value_mat_100splits,3);
%save avg_ranked_value_mat_100splits avg_ranked_value_mat_100splits

end
