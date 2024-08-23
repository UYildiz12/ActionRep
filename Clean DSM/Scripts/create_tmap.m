
currentClusters = spm_read_vols(spm_vol('activation_lh.img'));

tMAP = spm_read_vols(spm_vol('spmT_0001.img'));

tmap_activation_lh = currentClusters .* tMAP;

V = spm_vol('spmT_0001.img'); % open spm image
V.name= 'tmap_activation_lh.img';
V.fname='tmap_activation_lh.img';
spm_write_vol(V,tmap_activation_lh);

%%
currentClusters = spm_read_vols(spm_vol('activation_rh.img'));

tMAP = spm_read_vols(spm_vol('spmT_0001.img'));

tmap_activation_rh = currentClusters .* tMAP;

V = spm_vol('spmT_0001.img'); % open spm image
V.name= 'tmap_activation_rh.img';
V.fname='tmap_activation_rh.img';
spm_write_vol(V,tmap_activation_rh);
