
% STEP 2: in regressors

load('data.mat');
load('regres_gabor.mat');

q1 = data.question_indices(1);
reg_gabor_vect1 = [];
index = 1;
ind = 1;
for i = 1:length(regres_gabor)+1
    
    if i ~= q1+1
        reg_gabor_vect1(index) = regres_gabor(ind);
        reg_gabor_vect1(index+1) = regres_gabor(ind);
        reg_gabor_vect1(index+2) = regres_gabor(ind);
        index = index + 3;
        ind = ind + 1;
    else
        reg_gabor_vect1(index) = 0;
        index = index + 1;
    end
    
end

reg_gabor_vect1(index) = 0;
reg_gabor_vect1(index+1) = 0;
reg_gabor_vect1(index+2) = 0;

%%
q2 = data.question_indices(2);
reg_gabor_vect2 = [];
index = 1;
ind = 1;
for i = 1:length(regres_gabor)+1
    
    if i ~= q2+1
        reg_gabor_vect2(index) = regres_gabor(ind);
        reg_gabor_vect2(index+1) = regres_gabor(ind);
        reg_gabor_vect2(index+2) = regres_gabor(ind);
        index = index + 3;
        ind = ind + 1;
    else
        reg_gabor_vect2(index) = 0;
        index = index + 1;
    end
    
end

reg_gabor_vect2(index) = 0;
reg_gabor_vect2(index+1) = 0;
reg_gabor_vect2(index+2) = 0;

%%
q3 = data.question_indices(3);
reg_gabor_vect3 = [];
index = 1;
ind = 1;
for i = 1:length(regres_gabor)+1
    
    if i ~= q3+1
        reg_gabor_vect3(index) = regres_gabor(ind);
        reg_gabor_vect3(index+1) = regres_gabor(ind);
        reg_gabor_vect3(index+2) = regres_gabor(ind);
        index = index + 3;
        ind = ind + 1;
    else
        reg_gabor_vect3(index) = 0;
        index = index + 1;
    end
    
end

reg_gabor_vect3(index) = 0;
reg_gabor_vect3(index+1) = 0;
reg_gabor_vect3(index+2) = 0;

%%

q4 = data.question_indices(4);
reg_gabor_vect4 = [];
index = 1;
ind = 1;
for i = 1:length(regres_gabor)+1
    
    if i ~= q4+1
        reg_gabor_vect4(index) = regres_gabor(ind);
        reg_gabor_vect4(index+1) = regres_gabor(ind);
        reg_gabor_vect4(index+2) = regres_gabor(ind);
        index = index + 3;
        ind = ind + 1;
    else
        reg_gabor_vect4(index) = 0;
        index = index + 1;
    end
    
end

reg_gabor_vect4(index) = 0;
reg_gabor_vect4(index+1) = 0;
reg_gabor_vect4(index+2) = 0;

%%
q5 = data.question_indices(5);
reg_gabor_vect5 = [];
index = 1;
ind = 1;
for i = 1:length(regres_gabor)+1
    
    if i ~= q5+1
        reg_gabor_vect5(index) = regres_gabor(ind);
        reg_gabor_vect5(index+1) = regres_gabor(ind);
        reg_gabor_vect5(index+2) = regres_gabor(ind);
        index = index + 3;
        ind = ind + 1;
    else
        reg_gabor_vect5(index) = 0;
        index = index + 1;
    end
    
end

reg_gabor_vect5(index) = 0;
reg_gabor_vect5(index+1) = 0;
reg_gabor_vect5(index+2) = 0;

%%
q6 = data.question_indices(6);
reg_gabor_vect6 = [];
index = 1;
ind = 1;
for i = 1:length(regres_gabor)+1
    
    if i ~= q6+1
        reg_gabor_vect6(index) = regres_gabor(ind);
        reg_gabor_vect6(index+1) = regres_gabor(ind);
        reg_gabor_vect6(index+2) = regres_gabor(ind);
        index = index + 3;
        ind = ind + 1;
    else
        reg_gabor_vect6(index) = 0;
        index = index + 1;
    end
    
end

reg_gabor_vect6(index) = 0;
reg_gabor_vect6(index+1) = 0;
reg_gabor_vect6(index+2) = 0;

%%
regres_gabor_vect = [reg_gabor_vect1 reg_gabor_vect2 reg_gabor_vect3 reg_gabor_vect4 reg_gabor_vect5 reg_gabor_vect6];
regres_gabor_vect = regres_gabor_vect';

save regres_gabor_vect regres_gabor_vect

clear all
clc

