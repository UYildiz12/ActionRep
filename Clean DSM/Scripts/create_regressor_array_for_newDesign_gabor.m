
function [] = create_regressor_array_for_newDesign_gabor(runNo)

path = ['/Users/burgen/Studies/Action100_BILKENT/subjects/subject01/ses-1/run' num2str(runNo)];
cd(path);

% create a new duration array that includes dur = 0 for questions
load('data.mat');
x = data.isidurations(1:3:148);
y = data.question_indices+1;
y = unique(y);

if length(y) == 5
    array_size = 55;
elseif length(y) == 6
    array_size = 56;
end

new_dur_array = []; % that includes dur elements for questions as well, dur = 0
count = 1;
count_x = 1;
for i = 1:array_size
   a = ismember(i,y);
   b = any(a);
   if b ~= 1
       new_dur_array(count) = x(count_x);
       count = count + 1;
       count_x = count_x + 1;
   else
       new_dur_array(count+1) = 0;
       count = count + 1;
   end
end

if length(new_dur_array) == 55
    new_dur_array = [new_dur_array 0];
end


%%
load('regres_gabor.mat');

% create a new regressor array with 150 elements (replicate by 3)
full_count = 1;
regres_gabor_all = []; 
for i = 1:length(regres_gabor)
    regres_gabor_all(full_count) = regres_gabor(i);
    regres_gabor_all(full_count+1) = regres_gabor(i);
    regres_gabor_all(full_count+2) = regres_gabor(i);
    full_count = full_count + 3;
end

countReg = 2;
remain = 0;
regressor_array = [regres_gabor(1) regres_gabor(1) regres_gabor(1)]; % the first three elements
totalsum = 0;
trialDur = 0;

for i = 1:55 
    
    if new_dur_array(i+1) ~= 0
        trialDur = 9;
    else
        trialDur = 3;
    end
    
    totalsum = trialDur + remain + new_dur_array(i);
    no_of_reg = floor(totalsum/3);
    no_of_reg = no_of_reg - 1;
    regressor_array = [regressor_array 0];
    
    
        for k = 1:no_of_reg
            if new_dur_array(i+1) ~= 0
                regressor_array = [regressor_array regres_gabor(countReg)];
            else
                regressor_array = [regressor_array 0];
            end
        end  
        
        if new_dur_array(i+1) ~= 0
            countReg = countReg + 1;
        end
    
%     if no_of_reg == 2
%         countReg = countReg + 1;
%     end
    
    
    if (remain + new_dur_array(i)) >= 3 
        remain = remain + new_dur_array(i) - 3;
    else
        remain = remain + new_dur_array(i);
    end
    
end

a = length(regressor_array);
if a < 188
    diff = 188 - a;
    for i = 1:diff
        regressor_array = [regressor_array 0];
    end  
end

regressor_array_gabor = regressor_array;
save regressor_array_gabor regressor_array_gabor;

