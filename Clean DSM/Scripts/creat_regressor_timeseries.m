
load('regres_gabor.mat');
load('data.mat');

qIndices = [];
qIndices(1) = data.question_indices(1)*4 + 1;
qIndices(2) = data.question_indices(2)*4 + 4;
qIndices(3) = data.question_indices(3)*4 + 7;
qIndices(4) = data.question_indices(4)*4 + 10;
qIndices(5) = data.question_indices(5)*4 + 13;
qIndices(6) = data.question_indices(6)*4 + 16;

qIndices_all = [qIndices qIndices+1 qIndices+2];

regres_gabor_timeseries = {};

count = 1;
ind = 1;
while count <= 206
   
    x = ismember(count,qIndices_all);
    y = any(x); 
    if y ~= 1
        regres_gabor_timeseries{count} = regres_gabor(ind);
        regres_gabor_timeseries{count+1} = regres_gabor(ind);
        regres_gabor_timeseries{count+2} = regres_gabor(ind);
        regres_gabor_timeseries{count+3} = 0;
        count = count + 4;
        ind = ind + 1;
    else
        regres_gabor_timeseries{count} = 0;
        regres_gabor_timeseries{count+1} = 0;
        regres_gabor_timeseries{count+2} = 0;
        count = count + 3;
    end
    
end