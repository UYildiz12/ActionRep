
% Get voxels for LOTC, PPC, and PMC
function [] = extract_voxels_for_a_given_ROI(roi)

ROI_path = '/san/burcu/ActionCluster100Bilkent/ROIs/';
cd(ROI_path);
MaskMatrix = spm_read_vols(spm_vol([roi '.nii']));

beta_path = '/san/burcu/ActionCluster100Bilkent/Subjects/subj02/ANALYSIS/GLM_w_Regres_trials/';
cd(beta_path);

betas = [];

for t = 1:488
    
    if t >= 1 && t <= 9
        filename = ['beta_000' num2str(t) '.hdr'];
    elseif t >= 10 && t <= 99
        filename = ['beta_00' num2str(t) '.hdr'];
    elseif t >= 100 && t <= 488
        filename = ['beta_0' num2str(t) '.hdr'];
    end
       
    Matrix = spm_read_vols(spm_vol(filename));
    ROIvector = Matrix(logical(MaskMatrix))';
    betas = [betas ; ROIvector];
    
end

% Clean up if there are NaN values
betas_cleaned = [];
index = 1;
for i = 1:size(betas,2)
   
    if ~isnan(betas(1,i))
       betas_cleaned(:,index) = betas(:,i);
       index = index + 1;
    end
    
end

allBetas = betas_cleaned;

mkdir(roi)
cd([beta_path roi])
save allBetas allBetas

end

