
A=  spm_read_vols(spm_vol('allactions_rh_29_-72_60.nii'));
F= dir('allactions_rh_*.nii');
for a=1:length(F)
    fname=F(a).name;
B=  spm_read_vols(spm_vol(fname));
s= find(B);
A(s)=1;
end
V = spm_vol('allactions_rh_29_-72_60.nii') ;% open spm image
V.name= 'allactions_rh.nii';
V.fname= 'allactions_rh.nii';
spm_write_vol(V,A);