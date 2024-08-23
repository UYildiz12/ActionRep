
contrast_vector = zeros(1,912);

all_action_indices = [];
action_beta_indices = {};
act_indices = [1:56:841];

for i = 1:length(act_indices)
   indices = [act_indices(i):(act_indices(i)+49)];
   all_action_indices = [all_action_indices indices];
end

contrast_vector(all_action_indices) = 1;
save contrast_vector contrast_vector



