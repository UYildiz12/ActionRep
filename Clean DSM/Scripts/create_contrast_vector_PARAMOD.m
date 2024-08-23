
contrast_vector = zeros(1,3312);

action_beta_indices = [1:4:197, 207:4:403, 413:4:609, 619:4:815, 825:4:1021, 1031:4:1227, 1237:4:1433, 1443:4:1639, ...
                       1649:4:1845, 1855:4:2051, 2061:4:2257, 2267:4:2463, 2473:4:2669, 2679:4:2875, 2885:4:3081, 3091:4:3287];
contrast_vector(action_beta_indices) = 1;

% regres_indices = [action_beta_indices+1, action_beta_indices+2, action_beta_indices+3];
% contrast_vector(regres_indices) = -1;

save contrast_vector contrast_vector

%%
contrast_vector_onlyReg = zeros(1,3312);
action_beta_indices = [1:4:197, 207:4:403, 413:4:609, 619:4:815, 825:4:1021, 1031:4:1227, 1237:4:1433, 1443:4:1639, ...
                       1649:4:1845, 1855:4:2051, 2061:4:2257, 2267:4:2463, 2473:4:2669, 2679:4:2875, 2885:4:3081, 3091:4:3287];
regress_indices = [action_beta_indices+1];                   
contrast_vector_onlyReg(regress_indices) = 1;

save contrast_vector_onlyReg contrast_vector_onlyReg