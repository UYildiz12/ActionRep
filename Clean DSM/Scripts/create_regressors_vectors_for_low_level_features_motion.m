
% STEP 2: in regressors

load('data.mat');
load('regres_motion.mat');

q1 = data.question_indices(1);
reg_motion_vect1 = [];
index = 1;
ind = 1;
for i = 1:length(regres_motion)+1
    
    if i ~= q1+1
        reg_motion_vect1(index) = regres_motion(ind);
        reg_motion_vect1(index+1) = regres_motion(ind);
        reg_motion_vect1(index+2) = regres_motion(ind);
        index = index + 3;
        ind = ind + 1;
    else
        reg_motion_vect1(index) = 0;
        index = index + 1;
    end
    
end

reg_motion_vect1(index) = 0;
reg_motion_vect1(index+1) = 0;
reg_motion_vect1(index+2) = 0;

%%
q2 = data.question_indices(2);
reg_motion_vect2 = [];
index = 1;
ind = 1;
for i = 1:length(regres_motion)+1
    
    if i ~= q2+1
        reg_motion_vect2(index) = regres_motion(ind);
        reg_motion_vect2(index+1) = regres_motion(ind);
        reg_motion_vect2(index+2) = regres_motion(ind);
        index = index + 3;
        ind = ind + 1;
    else
        reg_motion_vect2(index) = 0;
        index = index + 1;
    end
    
end

reg_motion_vect2(index) = 0;
reg_motion_vect2(index+1) = 0;
reg_motion_vect2(index+2) = 0;

%%
q3 = data.question_indices(3);
reg_motion_vect3 = [];
index = 1;
ind = 1;
for i = 1:length(regres_motion)+1
    
    if i ~= q3+1
        reg_motion_vect3(index) = regres_motion(ind);
        reg_motion_vect3(index+1) = regres_motion(ind);
        reg_motion_vect3(index+2) = regres_motion(ind);
        index = index + 3;
        ind = ind + 1;
    else
        reg_motion_vect3(index) = 0;
        index = index + 1;
    end
    
end

reg_motion_vect3(index) = 0;
reg_motion_vect3(index+1) = 0;
reg_motion_vect3(index+2) = 0;

%%

q4 = data.question_indices(4);
reg_motion_vect4 = [];
index = 1;
ind = 1;
for i = 1:length(regres_motion)+1
    
    if i ~= q4+1
        reg_motion_vect4(index) = regres_motion(ind);
        reg_motion_vect4(index+1) = regres_motion(ind);
        reg_motion_vect4(index+2) = regres_motion(ind);
        index = index + 3;
        ind = ind + 1;
    else
        reg_motion_vect4(index) = 0;
        index = index + 1;
    end
    
end

reg_motion_vect4(index) = 0;
reg_motion_vect4(index+1) = 0;
reg_motion_vect4(index+2) = 0;


%%
regres_motion_vect = [reg_motion_vect1 reg_motion_vect2 reg_motion_vect3 reg_motion_vect4];
regres_motion_vect = regres_motion_vect';

save regres_motion_vect regres_motion_vect

clear all
clc

