
%% %%%%%%%%%%%%%%%%%%%%  RUNS with 13 conditions  %%%%%%%%%%%%%%%%%%%%
load('data.mat');

conditions = data.movieLists(:,1);
names = {};

for i = 1:length(conditions)

    cNo = conditions(i);
    cName = num2str(cNo);
    names{i} = cName;

end
names{14} = 'fix';

%% Specify condition onsets
a = data.stimonsets - data.expSTime;

onsets{1} = [a(1) a(40) a(79) a(118)];
onsets{2} = [a(4) a(43) a(82) a(121)];
onsets{3} = [a(7) a(46) a(85) a(124)];
onsets{4} = [a(10) a(49) a(88) a(127)];
onsets{5} = [a(13) a(52) a(91) a(130)];
onsets{6} = [a(16) a(55) a(94) a(133)];
onsets{7} = [a(19) a(58) a(97) a(136)];
onsets{8} = [a(22) a(61) a(100) a(139)];
onsets{9} = [a(25) a(64) a(103) a(142)];
onsets{10} = [a(28) a(67) a(106) a(145)];
onsets{11} = [a(31) a(70) a(109) a(148)];
onsets{12} = [a(34) a(73) a(112) a(151)];
onsets{13} = [a(37) a(76) a(115) a(154)];

b = data.fixonsets - data.expSTime;
onsets{14} = b;

%% Specify condition durations
durations = {};
for i = 1:14
    durations{i} = 9;
end

clearvars -except names onsets durations
save CondInfo



%% %%%%%%%%%%%%%%%%%%%%  RUNS with 12 conditions  %%%%%%%%%%%%%%%%%%%%
load('data.mat');

conditions = data.movieLists(:,1);
names = {};

for i = 1:length(conditions)

    cNo = conditions(i);
    cName = num2str(cNo);
    names{i} = cName;

end
names{13} = 'fix';

%% Specify condition onsets
a = data.stimonsets - data.expSTime;

onsets{1} = [a(1) a(37) a(73) a(109)];
onsets{2} = [a(4) a(40) a(76) a(112)];
onsets{3} = [a(7) a(43) a(79) a(115)];
onsets{4} = [a(10) a(46) a(82) a(118)];
onsets{5} = [a(13) a(49) a(85) a(121)];
onsets{6} = [a(16) a(52) a(88) a(124)];
onsets{7} = [a(19) a(55) a(91) a(127)];
onsets{8} = [a(22) a(59) a(94) a(130)];
onsets{9} = [a(25) a(61) a(97) a(133)];
onsets{10} = [a(28) a(64) a(100) a(136)];
onsets{11} = [a(31) a(67) a(103) a(139)];
onsets{12} = [a(34) a(70) a(106) a(142)];

b = data.fixonsets - data.expSTime;
onsets{13} = b;

%% Specify condition durations
durations = {};
for i = 1:13
    durations{i} = 9;
end

clearvars -except names onsets durations
save CondInfo

