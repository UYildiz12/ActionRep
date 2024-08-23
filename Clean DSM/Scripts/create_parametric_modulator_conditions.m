
path = '/Users/burgen/Studies/Action100_BILKENT/subjects/subject01/ses-1/run1/';
cd(path);

load('conditions.mat');
load('regres_gabor.mat');
load('regres_lum.mat');
load('regres_motion.mat');

pmod = {};
for i = 1:length(regres_gabor)
    pmod(i).name{1} = 'gabor-param';
    pmod(i).param{1} = regres_gabor(i);
    pmod(i).poly{1} = 1;
end


for i = 1:length(regres_lum)
    pmod(i).name{2} = 'lum-param';
    pmod(i).param{2} = regres_lum(i);
    pmod(i).poly{2} = 1;
end


for i = 1:length(regres_motion)
    pmod(i).name{3} = 'motion-param';
    pmod(i).param{3} = regres_motion(i);
    pmod(i).poly{3} = 1;
end

clear i regres_gabor regres_lum regres_motion path
save conditions

clear all
clc
