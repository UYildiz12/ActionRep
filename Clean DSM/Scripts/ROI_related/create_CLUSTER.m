
A=  spm_read_vols(spm_vol('activation_lh_-10_-100_12.img'));
F= dir('activation_lh*.img');
for a=1:length(F);
    fname=F(a).name;
B=  spm_read_vols(spm_vol(fname));
s= find(B);
A(s)=1;
end
V = spm_vol('activation_lh_-10_-100_12.img') ;% open spm image
V.name= 'activation_lh.img';
V.fname= 'activation_lh.img';
spm_write_vol(V,A);