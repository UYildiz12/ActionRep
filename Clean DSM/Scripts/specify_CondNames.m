
load('data.mat');
conditions = data.movieLists(:,1);

cond_names = {};

for i = 1:length(conditions)

    cNo = conditions(i);
    cName = num2str(cNo);
    cond_names{i} = cName;

end
save cond_names cond_names;
