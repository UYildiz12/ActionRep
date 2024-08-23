
%% Marsbar part to extract the XYZ coordinates of the ROI
spm_name = '/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/SPM/SPM.mat';
roi_file = '/Volumes/BAURGEN/ActionClusters_ParametricModulator/subject01/ROIs/Clustering_PPC_volume_FINAL_roi.mat';

% Make marsbar design object
D = mardo(spm_name);
% Make marsbar ROI object
R = maroi(roi_file);
% Fetch data into marsbar data object
YO = get_marsy(R, D, 'mean');

region_no = 1;
voxel_data = region_data(YO, region_no);
voxel_data = voxel_data{1};
XYZ  = xyz(YO, region_no, 'vox'); % XYZ in spm_graph
save XYZ XYZ % save the ROI coordinates


%% SPM part
load('SPM.mat');
beta  = spm_get_data(SPM.Vbeta, XYZ);
Sess  = SPM.Sess;
s = length(Sess); % number of runs
u = length(Sess(s).U); % number of conditions (i.e. actions in each run = 50 for our case)

Uname = []; % an array that holds the name of the conditions = action no
Y = {}; % holds the fitted responses for a single voxel
Y_allVox = {}; % struct that holds fitted responses of all voxels
dt = SPM.xBF.dt;
for v = 1:size(beta,2) % go through all voxels in the ROI
    for r = 1:s % go through the runs
        for c = 1:u % go through the conditions (i.e. actions within a run)
            
            % basis functions and parameters
            X = SPM.xBF.bf/dt;
            x = ([1:size(X,1)] - 1)*dt;
            j = Sess(r).col(Sess(r).Fc(c).i(1:size(X,2)));
            B = beta(j,v); % take the beta of the FIRST VOXEL for the given condition.
            
            % fitted response
            Y{r,c} = X*B;
            
            % condition names
            Uname(r,c) = str2num(Sess(r).Fc(c).name);
            
        end
    end
    Y_allVox{v} = Y;
end

% Get the average of event-related fitted responses across different runs
action1 = []; action2 = []; action3 = []; action4 = []; action5 = []; action6 = []; action7 = []; action8 = []; action9 = []; action10 = [];
action11 = []; action12 = []; action13 = []; action14 = []; action15 = []; action16 = []; action17 = []; action18 = []; action19 = []; action20 = [];
action21 = []; action22 = []; action23 = []; action24 = []; action25 = []; action26 = []; action27 = []; action28 = []; action29 = []; action30 = [];
action31 = []; action32 = []; action33 = []; action34 = []; action35 = []; action36 = []; action37 = []; action38 = []; action39 = []; action40 = [];
action41 = []; action42 = []; action43 = []; action44 = []; action45 = []; action46 = []; action47 = []; action48 = []; action49 = []; action50 = [];
action51 = []; action52 = []; action53 = []; action54 = []; action55 = []; action56 = []; action57 = []; action58 = []; action59 = []; action60 = [];
action61 = []; action62 = []; action63 = []; action64 = []; action65 = []; action66 = []; action67 = []; action68 = []; action69 = []; action70 = [];
action71 = []; action72 = []; action73 = []; action74 = []; action75 = []; action76 = []; action77 = []; action78 = []; action79 = []; action80 = [];
action81 = []; action82 = []; action83 = []; action84 = []; action85 = []; action86 = []; action87 = []; action88 = []; action89 = []; action90 = [];
action91 = []; action92 = []; action93 = []; action94 = []; action95 = []; action96 = []; action97 = []; action98 = []; action99 = []; action100 = [];

area_action1 = []; area_action2 = []; area_action3 = []; area_action4 = []; area_action5 = []; area_action6 = []; area_action7 = []; area_action8 = []; area_action9 = []; area_action10 = [];
area_action11 = []; area_action12 = []; area_action13 = []; area_action14 = []; area_action15 = []; area_action16 = []; area_action17 = []; area_action18 = []; area_action19 = []; area_action20 = [];
area_action21 = []; area_action22 = []; area_action23 = []; area_action24 = []; area_action25 = []; area_action26 = []; area_action27 = []; area_action28 = []; area_action29 = []; area_action30 = [];
area_action31 = []; area_action32 = []; area_action33 = []; area_action34 = []; area_action35 = []; area_action36 = []; area_action37 = []; area_action38 = []; area_action39 = []; area_action40 = [];
area_action41 = []; area_action42 = []; area_action43 = []; area_action44 = []; area_action45 = []; area_action46 = []; area_action47 = []; area_action48 = []; area_action49 = []; area_action50 = [];
area_action51 = []; area_action52 = []; area_action53 = []; area_action54 = []; area_action55 = []; area_action56 = []; area_action57 = []; area_action58 = []; area_action59 = []; area_action60 = [];
area_action61 = []; area_action62 = []; area_action63 = []; area_action64 = []; area_action65 = []; area_action66 = []; area_action67 = []; area_action68 = []; area_action69 = []; area_action70 = [];
area_action71 = []; area_action72 = []; area_action73 = []; area_action74 = []; area_action75 = []; area_action76 = []; area_action77 = []; area_action78 = []; area_action79 = []; area_action80 = [];
area_action81 = []; area_action82 = []; area_action83 = []; area_action84 = []; area_action85 = []; area_action86 = []; area_action87 = []; area_action88 = []; area_action89 = []; area_action90 = [];
area_action91 = []; area_action92 = []; area_action93 = []; area_action94 = []; area_action95 = []; area_action96 = []; area_action97 = []; area_action98 = []; area_action99 = []; area_action100 = [];

action1_allVox = []; action2_allVox = []; action3_allVox = []; action4_allVox = []; action5_allVox = []; action6_allVox = []; action7_allVox = []; action8_allVox = []; action9_allVox = []; action10_allVox = [];
action11_allVox = []; action12_allVox = []; action13_allVox = []; action14_allVox = []; action15_allVox = []; action16_allVox = []; action17_allVox = []; action18_allVox = []; action19_allVox = []; action20_allVox = [];
action21_allVox = []; action22_allVox = []; action23_allVox = []; action24_allVox = []; action25_allVox = []; action26_allVox = []; action27_allVox = []; action28_allVox = []; action29_allVox = []; action30_allVox = [];
action31_allVox = []; action32_allVox = []; action33_allVox = []; action34_allVox = []; action35_allVox = []; action36_allVox = []; action37_allVox = []; action38_allVox = []; action39_allVox = []; action40_allVox = [];
action41_allVox = []; action42_allVox = []; action43_allVox = []; action44_allVox = []; action45_allVox = []; action46_allVox = []; action47_allVox = []; action48_allVox = []; action49_allVox = []; action50_allVox = [];
action51_allVox = []; action52_allVox = []; action53_allVox = []; action54_allVox = []; action55_allVox = []; action56_allVox = []; action57_allVox = []; action58_allVox = []; action59_allVox = []; action60_allVox = [];
action61_allVox = []; action62_allVox = []; action63_allVox = []; action64_allVox = []; action65_allVox = []; action66_allVox = []; action67_allVox = []; action68_allVox = []; action69_allVox = []; action70_allVox = [];
action71_allVox = []; action72_allVox = []; action73_allVox = []; action74_allVox = []; action75_allVox = []; action76_allVox = []; action77_allVox = []; action78_allVox = []; action79_allVox = []; action80_allVox = [];
action81_allVox = []; action82_allVox = []; action83_allVox = []; action84_allVox = []; action85_allVox = []; action86_allVox = []; action87_allVox = []; action88_allVox = []; action89_allVox = []; action90_allVox = [];
action91_allVox = []; action92_allVox = []; action93_allVox = []; action94_allVox = []; action95_allVox = []; action96_allVox = []; action97_allVox = []; action98_allVox = []; action99_allVox = []; action100_allVox = [];


allVox_area_action1 = []; allVox_area_action2 = []; allVox_area_action3 = []; allVox_area_action4 = []; allVox_area_action5 = []; allVox_area_action6 = []; allVox_area_action7 = []; allVox_area_action8 = []; allVox_area_action9 = []; allVox_area_action10 = [];
allVox_area_action11 = []; allVox_area_action12 = []; allVox_area_action13 = []; allVox_area_action14 = []; allVox_area_action15 = []; allVox_area_action16 = []; allVox_area_action17 = []; allVox_area_action18 = []; allVox_area_action19 = []; allVox_area_action20 = [];
allVox_area_action21 = []; allVox_area_action22 = []; allVox_area_action23 = []; allVox_area_action24 = []; allVox_area_action25 = []; allVox_area_action26 = []; allVox_area_action27 = []; allVox_area_action28 = []; allVox_area_action29 = []; allVox_area_action30 = [];
allVox_area_action31 = []; allVox_area_action32 = []; allVox_area_action33 = []; allVox_area_action34 = []; allVox_area_action35 = []; allVox_area_action36 = []; allVox_area_action37 = []; allVox_area_action38 = []; allVox_area_action39 = []; allVox_area_action40 = [];
allVox_area_action41 = []; allVox_area_action42 = []; allVox_area_action43 = []; allVox_area_action44 = []; allVox_area_action45 = []; allVox_area_action46 = []; allVox_area_action47 = []; allVox_area_action48 = []; allVox_area_action49 = []; allVox_area_action50 = [];
allVox_area_action51 = []; allVox_area_action52 = []; allVox_area_action53 = []; allVox_area_action54 = []; allVox_area_action55 = []; allVox_area_action56 = []; allVox_area_action57 = []; allVox_area_action58 = []; allVox_area_action59 = []; allVox_area_action60 = [];
allVox_area_action61 = []; allVox_area_action62 = []; allVox_area_action63 = []; allVox_area_action64 = []; allVox_area_action65 = []; allVox_area_action66 = []; allVox_area_action67 = []; allVox_area_action68 = []; allVox_area_action69 = []; allVox_area_action70 = [];
allVox_area_action71 = []; allVox_area_action72 = []; allVox_area_action73 = []; allVox_area_action74 = []; allVox_area_action75 = []; allVox_area_action76 = []; allVox_area_action77 = []; allVox_area_action78 = []; allVox_area_action79 = []; allVox_area_action80 = [];
allVox_area_action81 = []; allVox_area_action82 = []; allVox_area_action83 = []; allVox_area_action84 = []; allVox_area_action85 = []; allVox_area_action86 = []; allVox_area_action87 = []; allVox_area_action88 = []; allVox_area_action89 = []; allVox_area_action90 = [];
allVox_area_action91 = []; allVox_area_action92 = []; allVox_area_action93 = []; allVox_area_action94 = []; allVox_area_action95 = []; allVox_area_action96 = []; allVox_area_action97 = []; allVox_area_action98 = []; allVox_area_action99 = []; allVox_area_action100 = [];


xax = 0:170; % size(Y)-1
for v = 1:size(beta,2) % go through all voxels in the ROI
    
    Y = Y_allVox{v}; % get the fitted responses for a given voxel
    for r = 1:s
        for c = 1:u
            currentAct = Uname(r,c);
            
            % compute area under curve based on fitted response
            gt0 = Y{r,c}>0;
            posArea = trapz(xax(gt0), Y{r,c}(gt0));     % Area > 0
            negArea = trapz(xax(~gt0), Y{r,c}(~gt0));    % Area < 0
            totalArea = posArea - negArea;
            
            if currentAct == 1
                % get fitted responses per event (action) and concatanate
                % different trials, e.g. 8 trials per action
                action1 = [action1; Y{r,c}'];
                area_action1 = [area_action1 totalArea];
            elseif currentAct == 2
                action2 = [action2; Y{r,c}'];
                area_action2 = [area_action2 totalArea];
            elseif currentAct == 3
                action3 = [action3; Y{r,c}'];
                area_action3 = [area_action3 totalArea];
            elseif currentAct == 4
                action4 = [action4; Y{r,c}'];
                area_action4 = [area_action4 totalArea];
            elseif currentAct == 5
                action5 = [action5; Y{r,c}'];
                area_action5 = [area_action5 totalArea];
            elseif currentAct == 6
                action6 = [action6; Y{r,c}'];
                area_action6 = [area_action6 totalArea];
            elseif currentAct == 7
                action7 = [action7; Y{r,c}'];
                area_action7 = [area_action7 totalArea];
            elseif currentAct == 8
                action8 = [action8; Y{r,c}'];
                area_action8 = [area_action8 totalArea];
            elseif currentAct == 9
                action9 = [action9; Y{r,c}'];
                area_action9 = [area_action9 totalArea];
            elseif currentAct == 10
                action10 = [action10; Y{r,c}'];
                area_action10 = [area_action10 totalArea];
            elseif currentAct == 11
                action11 = [action11; Y{r,c}'];
                area_action11 = [area_action11 totalArea];
            elseif currentAct == 12
                action12 = [action12; Y{r,c}'];
                area_action12 = [area_action12 totalArea];
            elseif currentAct == 13
                action13 = [action13; Y{r,c}'];
                area_action13 = [area_action13 totalArea];
            elseif currentAct == 14
                action14 = [action14; Y{r,c}'];
                area_action14 = [area_action14 totalArea];
            elseif currentAct == 15
                action15 = [action15; Y{r,c}'];
                area_action15 = [area_action15 totalArea];
            elseif currentAct == 16
                action16 = [action16; Y{r,c}'];
                area_action16 = [area_action16 totalArea];
            elseif currentAct == 17
                action17 = [action17; Y{r,c}'];
                area_action17 = [area_action17 totalArea];
            elseif currentAct == 18
                action18 = [action18; Y{r,c}'];
                area_action18 = [area_action18 totalArea];
            elseif currentAct == 19
                action19 = [action19; Y{r,c}'];
                area_action19 = [area_action19 totalArea];
            elseif currentAct == 20
                action20 = [action20; Y{r,c}'];
                area_action20 = [area_action20 totalArea];
            elseif currentAct == 21
                action21 = [action21; Y{r,c}'];
                area_action21 = [area_action21 totalArea];
            elseif currentAct == 22
                action22 = [action22; Y{r,c}'];
                area_action22 = [area_action22 totalArea];
            elseif currentAct == 23
                action23 = [action23; Y{r,c}'];
                area_action23 = [area_action23 totalArea];
            elseif currentAct == 24
                action24 = [action24; Y{r,c}'];
                area_action24 = [area_action24 totalArea];
            elseif currentAct == 25
                action25 = [action25; Y{r,c}'];
                area_action25 = [area_action25 totalArea];
            elseif currentAct == 26
                action26 = [action26; Y{r,c}'];
                area_action26 = [area_action26 totalArea];
            elseif currentAct == 27
                action27 = [action27; Y{r,c}'];
                area_action27 = [area_action27 totalArea];
            elseif currentAct == 28
                action28 = [action28; Y{r,c}'];
                area_action28 = [area_action28 totalArea];
            elseif currentAct == 29
                action29 = [action29; Y{r,c}'];
                area_action29 = [area_action29 totalArea];
            elseif currentAct == 30
                action30 = [action30; Y{r,c}'];
                area_action30 = [area_action30 totalArea];
            elseif currentAct == 31
                action31 = [action31; Y{r,c}'];
                area_action31 = [area_action31 totalArea];
            elseif currentAct == 32
                action32 = [action32; Y{r,c}'];
                area_action32 = [area_action32 totalArea];
            elseif currentAct == 33
                action33 = [action33; Y{r,c}'];
                area_action33 = [area_action33 totalArea];
            elseif currentAct == 34
                action34 = [action34; Y{r,c}'];
                area_action34 = [area_action34 totalArea];
            elseif currentAct == 35
                action35 = [action35; Y{r,c}'];
                area_action35 = [area_action35 totalArea];
            elseif currentAct == 36
                action36 = [action36; Y{r,c}'];
                area_action36 = [area_action36 totalArea];
            elseif currentAct == 37
                action37 = [action37; Y{r,c}'];
                area_action37 = [area_action37 totalArea];
            elseif currentAct == 38
                action38 = [action38; Y{r,c}'];
                area_action38 = [area_action38 totalArea];
            elseif currentAct == 39
                action39 = [action39; Y{r,c}'];
                area_action39 = [area_action39 totalArea];
            elseif currentAct == 40
                action40 = [action40; Y{r,c}'];
                area_action40 = [area_action40 totalArea];
            elseif currentAct == 41
                action41 = [action41; Y{r,c}'];
                area_action41 = [area_action41 totalArea];
            elseif currentAct == 42
                action42 = [action42; Y{r,c}'];
                area_action42 = [area_action42 totalArea];
            elseif currentAct == 43
                action43 = [action43; Y{r,c}'];
                area_action43 = [area_action43 totalArea];
            elseif currentAct == 44
                action44 = [action44; Y{r,c}'];
                area_action44 = [area_action44 totalArea];
            elseif currentAct == 45
                action45 = [action45; Y{r,c}'];
                area_action45 = [area_action45 totalArea];
            elseif currentAct == 46
                action46 = [action46; Y{r,c}'];
                area_action46 = [area_action46 totalArea];
            elseif currentAct == 47
                action47 = [action47; Y{r,c}'];
                area_action47 = [area_action47 totalArea];
            elseif currentAct == 48
                action48 = [action48; Y{r,c}'];
                area_action48 = [area_action48 totalArea];
            elseif currentAct == 49
                action49 = [action49; Y{r,c}'];
                area_action49 = [area_action49 totalArea];
            elseif currentAct == 50
                action50 = [action50; Y{r,c}'];
                area_action50 = [area_action50 totalArea];
            elseif currentAct == 51
                action51 = [action51; Y{r,c}'];
                area_action51 = [area_action51 totalArea];
            elseif currentAct == 52
                action52 = [action52; Y{r,c}'];
                area_action52 = [area_action52 totalArea];
            elseif currentAct == 53
                action53 = [action53; Y{r,c}'];
                area_action53 = [area_action53 totalArea];
            elseif currentAct == 54
                action54 = [action54; Y{r,c}'];
                area_action54 = [area_action54 totalArea];
            elseif currentAct == 55
                action55 = [action55; Y{r,c}'];
                area_action55 = [area_action55 totalArea];
            elseif currentAct == 56
                action56 = [action56; Y{r,c}'];
                area_action56 = [area_action56 totalArea];
            elseif currentAct == 57
                action57 = [action57; Y{r,c}'];
                area_action57 = [area_action57 totalArea];
            elseif currentAct == 58
                action58 = [action58; Y{r,c}'];
                area_action58 = [area_action58 totalArea];
            elseif currentAct == 59
                action59 = [action59; Y{r,c}'];
                area_action59 = [area_action59 totalArea];
            elseif currentAct == 60
                action60 = [action60; Y{r,c}'];
                area_action60 = [area_action60 totalArea];
            elseif currentAct == 61
                action61 = [action61; Y{r,c}'];
                area_action61 = [area_action61 totalArea];
            elseif currentAct == 62
                action62 = [action62; Y{r,c}'];
                area_action62 = [area_action62 totalArea];
            elseif currentAct == 63
                action63 = [action63; Y{r,c}'];
                area_action63 = [area_action63 totalArea];
            elseif currentAct == 64
                action64 = [action64; Y{r,c}'];
                area_action64 = [area_action64 totalArea];
            elseif currentAct == 65
                action65 = [action65; Y{r,c}'];
                area_action65 = [area_action65 totalArea];
            elseif currentAct == 66
                action66 = [action66; Y{r,c}'];
                area_action66 = [area_action66 totalArea];
            elseif currentAct == 67
                action67 = [action67; Y{r,c}'];
                area_action67 = [area_action67 totalArea];
            elseif currentAct == 68
                action68 = [action68; Y{r,c}'];
                area_action68 = [area_action68 totalArea];
            elseif currentAct == 69
                action69 = [action69; Y{r,c}'];
                area_action69 = [area_action69 totalArea];
            elseif currentAct == 70
                action70 = [action70; Y{r,c}'];
                area_action70 = [area_action70 totalArea];
            elseif currentAct == 71
                action71 = [action71; Y{r,c}'];
                area_action71 = [area_action71 totalArea];
            elseif currentAct == 72
                action72 = [action72; Y{r,c}'];
                area_action72 = [area_action72 totalArea];
            elseif currentAct == 73
                action73 = [action73; Y{r,c}'];
                area_action73 = [area_action73 totalArea];
            elseif currentAct == 74
                action74 = [action74; Y{r,c}'];
                area_action74 = [area_action74 totalArea];
            elseif currentAct == 75
                action75 = [action75; Y{r,c}'];
                area_action75 = [area_action75 totalArea];
            elseif currentAct == 76
                action76 = [action76; Y{r,c}'];
                area_action76 = [area_action76 totalArea];
            elseif currentAct == 77
                action77 = [action77; Y{r,c}'];
                area_action77 = [area_action77 totalArea];
            elseif currentAct == 78
                action78 = [action78; Y{r,c}'];
                area_action78 = [area_action78 totalArea];
            elseif currentAct == 79
                action79 = [action79; Y{r,c}'];
                area_action79 = [area_action79 totalArea];
            elseif currentAct == 80
                action80 = [action80; Y{r,c}'];
                area_action80 = [area_action80 totalArea];
            elseif currentAct == 81
                action81 = [action81; Y{r,c}'];
                area_action81 = [area_action81 totalArea];
            elseif currentAct == 82
                action82 = [action82; Y{r,c}'];
                area_action82 = [area_action82 totalArea];
            elseif currentAct == 83
                action83 = [action83; Y{r,c}'];
                area_action83 = [area_action83 totalArea];
            elseif currentAct == 84
                action84 = [action84; Y{r,c}'];
                area_action84 = [area_action84 totalArea];
            elseif currentAct == 85
                action85 = [action85; Y{r,c}'];
                area_action85 = [area_action85 totalArea];
            elseif currentAct == 86
                action86 = [action86; Y{r,c}'];
                area_action86 = [area_action86 totalArea];
            elseif currentAct == 87
                action87 = [action87; Y{r,c}'];
                area_action87 = [area_action87 totalArea];
            elseif currentAct == 88
                action88 = [action88; Y{r,c}'];
                area_action88 = [area_action88 totalArea];
            elseif currentAct == 89
                action89 = [action89; Y{r,c}'];
                area_action89 = [area_action89 totalArea];
            elseif currentAct == 90
                action90 = [action90; Y{r,c}'];
                area_action90 = [area_action90 totalArea];
            elseif currentAct == 91
                action91 = [action91; Y{r,c}'];
                area_action91 = [area_action91 totalArea];
            elseif currentAct == 92
                action92 = [action92; Y{r,c}'];
                area_action92 = [area_action92 totalArea];
            elseif currentAct == 93
                action93 = [action93; Y{r,c}'];
                area_action93 = [area_action93 totalArea];
            elseif currentAct == 94
                action94 = [action94; Y{r,c}'];
                area_action94 = [area_action94 totalArea];
            elseif currentAct == 95
                action95 = [action95; Y{r,c}'];
                area_action95 = [area_action95 totalArea];
            elseif currentAct == 96
                action96 = [action96; Y{r,c}'];
                area_action96 = [area_action96 totalArea];
            elseif currentAct == 97
                action97 = [action97; Y{r,c}'];
                area_action97 = [area_action97 totalArea];
            elseif currentAct == 98
                action98 = [action98; Y{r,c}'];
                area_action98 = [area_action98 totalArea];
            elseif currentAct == 99
                action99 = [action99; Y{r,c}'];
                area_action99 = [area_action99 totalArea];
            elseif currentAct == 100
                action100 = [action100; Y{r,c}'];
                area_action100 = [area_action100 totalArea];
            end
            
        end
    end
    
    action1_allVox{v} = action1;
    action2_allVox{v} = action2;
    action3_allVox{v} = action3;
    action4_allVox{v} = action4;
    action5_allVox{v} = action5;
    action6_allVox{v} = action6;
    action7_allVox{v} = action7;
    action8_allVox{v} = action8;
    action9_allVox{v} = action9;
    action10_allVox{v} = action10;
    
    action11_allVox{v} = action11;
    action12_allVox{v} = action12;
    action13_allVox{v} = action13;
    action14_allVox{v} = action14;
    action15_allVox{v} = action15;
    action16_allVox{v} = action16;
    action17_allVox{v} = action17;
    action18_allVox{v} = action18;
    action19_allVox{v} = action19;
    action20_allVox{v} = action20;
    
    action21_allVox{v} = action21;
    action22_allVox{v} = action22;
    action23_allVox{v} = action23;
    action24_allVox{v} = action24;
    action25_allVox{v} = action25;
    action26_allVox{v} = action26;
    action27_allVox{v} = action27;
    action28_allVox{v} = action28;
    action29_allVox{v} = action29;
    action30_allVox{v} = action30;
    
    action31_allVox{v} = action31;
    action32_allVox{v} = action32;
    action33_allVox{v} = action33;
    action34_allVox{v} = action34;
    action35_allVox{v} = action35;
    action36_allVox{v} = action36;
    action37_allVox{v} = action37;
    action38_allVox{v} = action38;
    action39_allVox{v} = action39;
    action40_allVox{v} = action40;
    
    action41_allVox{v} = action41;
    action42_allVox{v} = action42;
    action43_allVox{v} = action43;
    action44_allVox{v} = action44;
    action45_allVox{v} = action45;
    action46_allVox{v} = action46;
    action47_allVox{v} = action47;
    action48_allVox{v} = action48;
    action49_allVox{v} = action49;
    action50_allVox{v} = action50;
    
    action51_allVox{v} = action51;
    action52_allVox{v} = action52;
    action53_allVox{v} = action53;
    action54_allVox{v} = action54;
    action55_allVox{v} = action55;
    action56_allVox{v} = action56;
    action57_allVox{v} = action57;
    action58_allVox{v} = action58;
    action59_allVox{v} = action59;
    action60_allVox{v} = action60;
    
    action61_allVox{v} = action61;
    action62_allVox{v} = action62;
    action63_allVox{v} = action63;
    action64_allVox{v} = action64;
    action65_allVox{v} = action65;
    action66_allVox{v} = action66;
    action67_allVox{v} = action67;
    action68_allVox{v} = action68;
    action69_allVox{v} = action69;
    action70_allVox{v} = action70;
    
    action71_allVox{v} = action71;
    action72_allVox{v} = action72;
    action73_allVox{v} = action73;
    action74_allVox{v} = action74;
    action75_allVox{v} = action75;
    action76_allVox{v} = action76;
    action77_allVox{v} = action77;
    action78_allVox{v} = action78;
    action79_allVox{v} = action79;
    action80_allVox{v} = action80;
    
    action81_allVox{v} = action81;
    action82_allVox{v} = action82;
    action83_allVox{v} = action83;
    action84_allVox{v} = action84;
    action85_allVox{v} = action85;
    action86_allVox{v} = action86;
    action87_allVox{v} = action87;
    action88_allVox{v} = action88;
    action89_allVox{v} = action89;
    action90_allVox{v} = action90;
    
    action91_allVox{v} = action91;
    action92_allVox{v} = action92;
    action93_allVox{v} = action93;
    action94_allVox{v} = action94;
    action95_allVox{v} = action95;
    action96_allVox{v} = action96;
    action97_allVox{v} = action97;
    action98_allVox{v} = action98;
    action99_allVox{v} = action99;
    action100_allVox{v} = action100;
    
    
    
    action1 = []; action2 = []; action3 = []; action4 = []; action5 = []; action6 = []; action7 = []; action8 = []; action9 = []; action10 = [];
    action11 = []; action12 = []; action13 = []; action14 = []; action15 = []; action16 = []; action17 = []; action18 = []; action19 = []; action20 = [];
    action21 = []; action22 = []; action23 = []; action24 = []; action25 = []; action26 = []; action27 = []; action28 = []; action29 = []; action30 = [];
    action31 = []; action32 = []; action33 = []; action34 = []; action35 = []; action36 = []; action37 = []; action38 = []; action39 = []; action40 = [];
    action41 = []; action42 = []; action43 = []; action44 = []; action45 = []; action46 = []; action47 = []; action48 = []; action49 = []; action50 = [];
    action51 = []; action52 = []; action53 = []; action54 = []; action55 = []; action56 = []; action57 = []; action58 = []; action59 = []; action60 = [];
    action61 = []; action62 = []; action63 = []; action64 = []; action65 = []; action66 = []; action67 = []; action68 = []; action69 = []; action70 = [];
    action71 = []; action72 = []; action73 = []; action74 = []; action75 = []; action76 = []; action77 = []; action78 = []; action79 = []; action80 = [];
    action81 = []; action82 = []; action83 = []; action84 = []; action85 = []; action86 = []; action87 = []; action88 = []; action89 = []; action90 = [];
    action91 = []; action92 = []; action93 = []; action94 = []; action95 = []; action96 = []; action97 = []; action98 = []; action99 = []; action100 = [];
    
    
    
    
    allVox_area_action1{v} = area_action1;
    allVox_area_action2{v} = area_action2;
    allVox_area_action3{v} = area_action3;
    allVox_area_action4{v} = area_action4;
    allVox_area_action5{v} = area_action5;
    allVox_area_action6{v} = area_action6;
    allVox_area_action7{v} = area_action7;
    allVox_area_action8{v} = area_action8;
    allVox_area_action9{v} = area_action9;
    allVox_area_action10{v} = area_action10;
    
    allVox_area_action11{v} = area_action11;
    allVox_area_action12{v} = area_action12;
    allVox_area_action13{v} = area_action13;
    allVox_area_action14{v} = area_action14;
    allVox_area_action15{v} = area_action15;
    allVox_area_action16{v} = area_action16;
    allVox_area_action17{v} = area_action17;
    allVox_area_action18{v} = area_action18;
    allVox_area_action19{v} = area_action19;
    allVox_area_action20{v} = area_action20;
    
    allVox_area_action21{v} = area_action21;
    allVox_area_action22{v} = area_action22;
    allVox_area_action23{v} = area_action23;
    allVox_area_action24{v} = area_action24;
    allVox_area_action25{v} = area_action25;
    allVox_area_action26{v} = area_action26;
    allVox_area_action27{v} = area_action27;
    allVox_area_action28{v} = area_action28;
    allVox_area_action29{v} = area_action29;
    allVox_area_action30{v} = area_action30;
    
    allVox_area_action31{v} = area_action31;
    allVox_area_action32{v} = area_action32;
    allVox_area_action33{v} = area_action33;
    allVox_area_action34{v} = area_action34;
    allVox_area_action35{v} = area_action35;
    allVox_area_action36{v} = area_action36;
    allVox_area_action37{v} = area_action37;
    allVox_area_action38{v} = area_action38;
    allVox_area_action39{v} = area_action39;
    allVox_area_action40{v} = area_action40;
    
    allVox_area_action41{v} = area_action41;
    allVox_area_action42{v} = area_action42;
    allVox_area_action43{v} = area_action43;
    allVox_area_action44{v} = area_action44;
    allVox_area_action45{v} = area_action45;
    allVox_area_action46{v} = area_action46;
    allVox_area_action47{v} = area_action47;
    allVox_area_action48{v} = area_action48;
    allVox_area_action49{v} = area_action49;
    allVox_area_action50{v} = area_action50;
    
    allVox_area_action51{v} = area_action51;
    allVox_area_action52{v} = area_action52;
    allVox_area_action53{v} = area_action53;
    allVox_area_action54{v} = area_action54;
    allVox_area_action55{v} = area_action55;
    allVox_area_action56{v} = area_action56;
    allVox_area_action57{v} = area_action57;
    allVox_area_action58{v} = area_action58;
    allVox_area_action59{v} = area_action59;
    allVox_area_action60{v} = area_action60;
    
    allVox_area_action61{v} = area_action61;
    allVox_area_action62{v} = area_action62;
    allVox_area_action63{v} = area_action63;
    allVox_area_action64{v} = area_action64;
    allVox_area_action65{v} = area_action65;
    allVox_area_action66{v} = area_action66;
    allVox_area_action67{v} = area_action67;
    allVox_area_action68{v} = area_action68;
    allVox_area_action69{v} = area_action69;
    allVox_area_action70{v} = area_action70;
    
    allVox_area_action71{v} = area_action71;
    allVox_area_action72{v} = area_action72;
    allVox_area_action73{v} = area_action73;
    allVox_area_action74{v} = area_action74;
    allVox_area_action75{v} = area_action75;
    allVox_area_action76{v} = area_action76;
    allVox_area_action77{v} = area_action77;
    allVox_area_action78{v} = area_action78;
    allVox_area_action79{v} = area_action79;
    allVox_area_action80{v} = area_action80;
    
    allVox_area_action81{v} = area_action81;
    allVox_area_action82{v} = area_action82;
    allVox_area_action83{v} = area_action83;
    allVox_area_action84{v} = area_action84;
    allVox_area_action85{v} = area_action85;
    allVox_area_action86{v} = area_action86;
    allVox_area_action87{v} = area_action87;
    allVox_area_action88{v} = area_action88;
    allVox_area_action89{v} = area_action89;
    allVox_area_action90{v} = area_action90;
    
    allVox_area_action91{v} = area_action91;
    allVox_area_action92{v} = area_action92;
    allVox_area_action93{v} = area_action93;
    allVox_area_action94{v} = area_action94;
    allVox_area_action95{v} = area_action95;
    allVox_area_action96{v} = area_action96;
    allVox_area_action97{v} = area_action97;
    allVox_area_action98{v} = area_action98;
    allVox_area_action99{v} = area_action99;
    allVox_area_action100{v} = area_action100;
    
    
    area_action1 = []; area_action2 = []; area_action3 = []; area_action4 = []; area_action5 = []; area_action6 = []; area_action7 = []; area_action8 = []; area_action9 = []; area_action10 = [];
    area_action11 = []; area_action12 = []; area_action13 = []; area_action14 = []; area_action15 = []; area_action16 = []; area_action17 = []; area_action18 = []; area_action19 = []; area_action20 = [];
    area_action21 = []; area_action22 = []; area_action23 = []; area_action24 = []; area_action25 = []; area_action26 = []; area_action27 = []; area_action28 = []; area_action29 = []; area_action30 = [];
    area_action31 = []; area_action32 = []; area_action33 = []; area_action34 = []; area_action35 = []; area_action36 = []; area_action37 = []; area_action38 = []; area_action39 = []; area_action40 = [];
    area_action41 = []; area_action42 = []; area_action43 = []; area_action44 = []; area_action45 = []; area_action46 = []; area_action47 = []; area_action48 = []; area_action49 = []; area_action50 = [];
    area_action51 = []; area_action52 = []; area_action53 = []; area_action54 = []; area_action55 = []; area_action56 = []; area_action57 = []; area_action58 = []; area_action59 = []; area_action60 = [];
    area_action61 = []; area_action62 = []; area_action63 = []; area_action64 = []; area_action65 = []; area_action66 = []; area_action67 = []; area_action68 = []; area_action69 = []; area_action70 = [];
    area_action71 = []; area_action72 = []; area_action73 = []; area_action74 = []; area_action75 = []; area_action76 = []; area_action77 = []; area_action78 = []; area_action79 = []; area_action80 = [];
    area_action81 = []; area_action82 = []; area_action83 = []; area_action84 = []; area_action85 = []; area_action86 = []; area_action87 = []; area_action88 = []; area_action89 = []; area_action90 = [];
    area_action91 = []; area_action92 = []; area_action93 = []; area_action94 = []; area_action95 = []; area_action96 = []; area_action97 = []; area_action98 = []; area_action99 = []; area_action100 = [];
    
    
    
end


sorted_action_betas = []; % 3D array: actions x number of voxels x number of trials per condition (100 x 3000 x 8)

for v = 1:size(beta,2) % go through all voxels in the ROI
    sorted_action_betas(1,v,:) = allVox_area_action1{v};
    sorted_action_betas(2,v,:) = allVox_area_action2{v};
    sorted_action_betas(3,v,:) = allVox_area_action3{v};
    sorted_action_betas(4,v,:) = allVox_area_action4{v};
    sorted_action_betas(5,v,:) = allVox_area_action5{v};
    sorted_action_betas(6,v,:) = allVox_area_action6{v};
    sorted_action_betas(7,v,:) = allVox_area_action7{v};
    sorted_action_betas(8,v,:) = allVox_area_action8{v};
    sorted_action_betas(9,v,:) = allVox_area_action9{v};
    sorted_action_betas(10,v,:) = allVox_area_action10{v};
    
    sorted_action_betas(11,v,:) = allVox_area_action11{v};
    sorted_action_betas(12,v,:) = allVox_area_action12{v};
    sorted_action_betas(13,v,:) = allVox_area_action13{v};
    sorted_action_betas(14,v,:) = allVox_area_action14{v};
    sorted_action_betas(15,v,:) = allVox_area_action15{v};
    sorted_action_betas(16,v,:) = allVox_area_action16{v};
    sorted_action_betas(17,v,:) = allVox_area_action17{v};
    sorted_action_betas(18,v,:) = allVox_area_action18{v};
    sorted_action_betas(19,v,:) = allVox_area_action19{v};
    sorted_action_betas(20,v,:) = allVox_area_action20{v};
    
    sorted_action_betas(21,v,:) = allVox_area_action21{v};
    sorted_action_betas(22,v,:) = allVox_area_action22{v};
    sorted_action_betas(23,v,:) = allVox_area_action23{v};
    sorted_action_betas(24,v,:) = allVox_area_action24{v};
    sorted_action_betas(25,v,:) = allVox_area_action25{v};
    sorted_action_betas(26,v,:) = allVox_area_action26{v};
    sorted_action_betas(27,v,:) = allVox_area_action27{v};
    sorted_action_betas(28,v,:) = allVox_area_action28{v};
    sorted_action_betas(29,v,:) = allVox_area_action29{v};
    sorted_action_betas(30,v,:) = allVox_area_action30{v};
    
    sorted_action_betas(31,v,:) = allVox_area_action31{v};
    sorted_action_betas(32,v,:) = allVox_area_action32{v};
    sorted_action_betas(33,v,:) = allVox_area_action33{v};
    sorted_action_betas(34,v,:) = allVox_area_action34{v};
    sorted_action_betas(35,v,:) = allVox_area_action35{v};
    sorted_action_betas(36,v,:) = allVox_area_action36{v};
    sorted_action_betas(37,v,:) = allVox_area_action37{v};
    sorted_action_betas(38,v,:) = allVox_area_action38{v};
    sorted_action_betas(39,v,:) = allVox_area_action39{v};
    sorted_action_betas(40,v,:) = allVox_area_action40{v};
    
    sorted_action_betas(41,v,:) = allVox_area_action41{v};
    sorted_action_betas(42,v,:) = allVox_area_action42{v};
    sorted_action_betas(43,v,:) = allVox_area_action43{v};
    sorted_action_betas(44,v,:) = allVox_area_action44{v};
    sorted_action_betas(45,v,:) = allVox_area_action45{v};
    sorted_action_betas(46,v,:) = allVox_area_action46{v};
    sorted_action_betas(47,v,:) = allVox_area_action47{v};
    sorted_action_betas(48,v,:) = allVox_area_action48{v};
    sorted_action_betas(49,v,:) = allVox_area_action49{v};
    sorted_action_betas(50,v,:) = allVox_area_action50{v};
    
    sorted_action_betas(51,v,:) = allVox_area_action51{v};
    sorted_action_betas(52,v,:) = allVox_area_action52{v};
    sorted_action_betas(53,v,:) = allVox_area_action53{v};
    sorted_action_betas(54,v,:) = allVox_area_action54{v};
    sorted_action_betas(55,v,:) = allVox_area_action55{v};
    sorted_action_betas(56,v,:) = allVox_area_action56{v};
    sorted_action_betas(57,v,:) = allVox_area_action57{v};
    sorted_action_betas(58,v,:) = allVox_area_action58{v};
    sorted_action_betas(59,v,:) = allVox_area_action59{v};
    sorted_action_betas(60,v,:) = allVox_area_action60{v};
    
    sorted_action_betas(61,v,:) = allVox_area_action61{v};
    sorted_action_betas(62,v,:) = allVox_area_action62{v};
    sorted_action_betas(63,v,:) = allVox_area_action63{v};
    sorted_action_betas(64,v,:) = allVox_area_action64{v};
    sorted_action_betas(65,v,:) = allVox_area_action65{v};
    sorted_action_betas(66,v,:) = allVox_area_action66{v};
    sorted_action_betas(67,v,:) = allVox_area_action67{v};
    sorted_action_betas(68,v,:) = allVox_area_action68{v};
    sorted_action_betas(69,v,:) = allVox_area_action69{v};
    sorted_action_betas(70,v,:) = allVox_area_action70{v};
    
    sorted_action_betas(71,v,:) = allVox_area_action71{v};
    sorted_action_betas(72,v,:) = allVox_area_action72{v};
    sorted_action_betas(73,v,:) = allVox_area_action73{v};
    sorted_action_betas(74,v,:) = allVox_area_action74{v};
    sorted_action_betas(75,v,:) = allVox_area_action75{v};
    sorted_action_betas(76,v,:) = allVox_area_action76{v};
    sorted_action_betas(77,v,:) = allVox_area_action77{v};
    sorted_action_betas(78,v,:) = allVox_area_action78{v};
    sorted_action_betas(79,v,:) = allVox_area_action79{v};
    sorted_action_betas(80,v,:) = allVox_area_action80{v};
    
    sorted_action_betas(81,v,:) = allVox_area_action81{v};
    sorted_action_betas(82,v,:) = allVox_area_action82{v};
    sorted_action_betas(83,v,:) = allVox_area_action83{v};
    sorted_action_betas(84,v,:) = allVox_area_action84{v};
    sorted_action_betas(85,v,:) = allVox_area_action85{v};
    sorted_action_betas(86,v,:) = allVox_area_action86{v};
    sorted_action_betas(87,v,:) = allVox_area_action87{v};
    sorted_action_betas(88,v,:) = allVox_area_action88{v};
    sorted_action_betas(89,v,:) = allVox_area_action89{v};
    sorted_action_betas(90,v,:) = allVox_area_action90{v};
    
    sorted_action_betas(91,v,:) = allVox_area_action91{v};
    sorted_action_betas(92,v,:) = allVox_area_action92{v};
    sorted_action_betas(93,v,:) = allVox_area_action93{v};
    sorted_action_betas(94,v,:) = allVox_area_action94{v};
    sorted_action_betas(95,v,:) = allVox_area_action95{v};
    sorted_action_betas(96,v,:) = allVox_area_action96{v};
    sorted_action_betas(97,v,:) = allVox_area_action97{v};
    sorted_action_betas(98,v,:) = allVox_area_action98{v};
    sorted_action_betas(99,v,:) = allVox_area_action99{v};
    sorted_action_betas(100,v,:) = allVox_area_action100{v};
    
end

sorted_action_betas_AUC = sorted_action_betas;
save sorted_action_betas_AUC sorted_action_betas_AUC

% % Plot fitted responses = Y
% plot(x,Y,'Color',Col(2,:),'LineWidth',4)

