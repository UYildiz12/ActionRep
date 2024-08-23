dataActClstfMRI = [];
%% Demographics
subjnum = input('Enter subject no: ');
dataActClstfMRI.subject=subjnum;
sessionnum = input('Enter session no: ');
dataActClstfMRI.session=sessionnum;
runnum = input('Enter run no: ');
dataActClstfMRI.run=runnum;
expdate = datestr(now);
dataActClstfMRI.expdate=expdate;

path = 'D:\Hilal\ActionClusters\Experiment_Folder\';
datapath = [path 'Output\'];
cd(datapath);

subjdirname = ['subject-' num2str(subjnum)];
mkdir(subjdirname);
cd(subjdirname);
subjectpath = [datapath '\' subjdirname];

sessiondirname = ['session-' num2str(sessionnum)];
mkdir(sessiondirname);
cd(sessiondirname);
sessionpath = [datapath subjdirname '\' sessiondirname];

rundirname = ['run-' num2str(runnum)];
mkdir(rundirname);
cd(rundirname);
runpath = [sessionpath '\' rundirname];


% Open a text file to write the results
fname = ['Output_Subj' num2str(subjnum) '_SessionNo_' num2str(sessionnum) '_RunNo_' num2str(runnum) '.xls'];
[outfile message] = fopen(fname, 'a');
if outfile == -1
    fprintf('Cannot open the file.\n%s\n', message);
end
fprintf(outfile, 'Subject no: %d', subjnum); fprintf(outfile, '\n');
fprintf(outfile, 'Session no: %d', sessionnum); fprintf(outfile, '\n');
fprintf(outfile, 'Run no: %d', runnum); fprintf(outfile, '\n');
fprintf(outfile, 'Date of experiment: %s', expdate); fprintf(outfile, '\n\n');

fprintf(outfile, 'VideoNo\tVideoName\tisiOnset\tisiDuration\tstimOnset\tstimDuration\tPreMovieDelay\n');

%% Load Actions and Create the Movie List
actionCodes=[2,4,5,7,8,12,13,15,16,17,20,21,22,23,24,27,28,31,35,36,40,41,42,44,46,47,48,49,50,51,53,55,57,58,59,62,63,64,68,70,71,72,74,75,77,78,82,85,87,88,89,92,94,95,96,98,99,100];
cd('D:\Hilal\ActionClusters\Experiment_Folder'); load('actionNames.mat'); %actionNames.mat is named as 'C' in the Workspace
movieName1_arr=[]; movieName2_arr=[];
for row=2:59
    if randi(2)==1
        %movieName1=[sprintf('%03d', C{row,1}) '_M.avi'];
        movieName1=[sprintf('%03d', C{row,1}) '_M.mp4'];
    else
        %movieName1=[sprintf('%03d', C{row,1}) '_F.avi'];
        movieName1=[sprintf('%03d', C{row,1}) '_F.mp4'];
    end
    movieName1_arr=[movieName1_arr; movieName1];
end
     movieName1_arr=Shuffle(movieName1_arr,2);
for n=1:length(movieName1_arr)
    if movieName1_arr(n, 5)=='M'
        %movieName2=[movieName1_arr(n,1:4) 'F.avi'];
        movieName2=[movieName1_arr(n,1:4) 'F.mp4'];
    else
        %movieName2=[movieName1_arr(n,1:4) 'M.avi'];
        movieName2=[movieName1_arr(n,1:4) 'M.mp4'];
    end
    movieName2_arr=[movieName2_arr; movieName2];
end
movieList_arr=[];
for i=1:58
    movieList_arr=[movieList_arr; movieName1_arr(i,:); movieName2_arr(i,:)];
end
cd(runpath);
save movieList_arr movieList_arr
%% Screen Settings
HideCursor;
Screen('Preference', 'SkipSyncTests', 1);
Screen('Preference', 'VisualDebugLevel', 1);
Screen('Preference','TextEncodingLocale','UTF-8');
screens=Screen('Screens',1);
screenNumber=max(screens);
[win, winrect] = Screen('OpenWindow', screenNumber, [123 120 123]);
w=RectWidth(winrect);
h=RectHeight(winrect);
center= [winrect(3)/2 winrect(4)/2];
% FPS, IFI and VBL
fps=Screen('FrameRate',win);      % frames per second
ifi=Screen('GetFlipInterval', win);
if fps==0
    fps=1/ifi;
end
Priority(MaxPriority(win));
vbl=Screen('Flip', win); % initial flip
%% Trigger and Kb Settings
% Initialize trigger counter & Keyboard
feature('DefaultCharacterSet', 'UTF8');
KbName('UnifyKeyNames');
Key.trigger = KbName ('6^');
Key.Escape = KbName('escape');
KbQueueCreate();

%Trigger
display('Waiting for trigger ...');

textSize=20;
Screen('TextSize',win,textSize);
DrawFormattedText(win,'Hoşgeldiniz!','center','center', [0 0 0], [], 1);
Screen('Flip',win);

KbQueueStart();
curTR=0;
while curTR==0
    [pressed, Keycode] = KbQueueCheck();
    timeSecs = Keycode(find(Keycode));
    if pressed && Keycode (Key.trigger)
        CurrTR=1;
        break;
    end
end
KbQueueStop();

display('Trigger is received ...');

[id, name, allInfos] = GetKeyboardIndices();
KbName('UnifyKeyNames');
Key.blue = KbName('1!');
Key.yellow = KbName('2@');
Key.green = KbName ('3#');
Key.red = KbName('4$');

keysOfInterest=zeros(1,256);
keysOfInterest(KbName({'1!', '2@', '3#', '4$'}))=1;
KbQueueCreate(id, keysOfInterest); %Here I have taken 'id' as an input, however it should be changed accordingly once the resp box is plugged.

%% Experimental trials settings
CrossWidth = 12;
dur = 3;
response_arr_movies = [];
RT_arr_movies = [];
stimonsets = [];
isionsets = [];
isidurations = [];
restdurations=[];
durQ = 3;
moviedurations = [];
questionDurations = [];
resp_arr=[];
respRT_arr=[];
resp_count=0; noresp_count=1;
%% Question Queries
Qint=randperm(59,4);
Qord=[10,11,12,13];
QordShuffle=Shuffle(Qord);
%% Creating the ISI
cd(sessionpath);
Dur.ISI=[];
Dur.mov= 3;
Dur.ISItot=90; %demanded sum of 90 (total jitter time=90sec)
cd('D:\Hilal\ActionClusters\Experiment_Folder');
%     x=0.001 *(999+randperm(1001, 59)); %randomly selected 59 jitters between 1-2 sec
%     while sum(x)~=Dur.ISItot
%         x=0.001 *(999+randperm(1001, 59));
%         Dur.ISI=x;
%         if sum(x)==Dur.ISItot
%             break
%         end
%     end
load('ISIseries.mat'); %loaded as 'x'
Dur.ISI=x;
%% Experiment Starts
isi_count = 1;
expSTime = GetSecs;
%% Rest Block at the start
restSDur=9;
cd(path);
imagedata = imread('fixation_point.png');
TexturePointer = Screen('MakeTexture', win, imagedata);
Screen(win,'DrawTexture', TexturePointer);
Screen('Flip',win);
RestSTime = GetSecs;
WaitSecs(restSDur);
RestETime = GetSecs;
RestDur=RestETime-RestSTime;
dataActClstfMRI.output.RestatStartOnset=RestSTime-expSTime;
dataActClstfMRI.output.RestatStartOffset=RestETime-expSTime;
dataActClstfMRI.output.RestatStartDur=RestETime-RestSTime;
%% Experimental Block
count=0;pairnum1=[];pairnum2=[];pairnum3=[];pairnum4=[];pairnum=1;Qcount=0;LFcount=0;
blockSTime = GetSecs();
for j = 1:length(movieList_arr)
    KbQueueFlush();
    if mod(j,2) == 1 %fixation display between blocks of two videos
        isi = Dur.ISI(isi_count); % isi duration varies between 1.7 and 2.7 over a normal distribution
        % Show fixation cross
        cd(path);
        imagedata = imread('fixation_point.png');
        TexturePointer = Screen('MakeTexture', win, imagedata);
        Screen(win,'DrawTexture', TexturePointer);
        Screen('Flip',win);
        fixSTime = GetSecs;
        WaitSecs(isi);
        fixETime = GetSecs;
        dataActClstfMRI.output.ISIonset(isi_count)=fixSTime-expSTime;
        dataActClstfMRI.output.ISIoffset(isi_count)=fixETime-expSTime;
        dataActClstfMRI.output.ISIdur(isi_count)=fixETime-fixSTime;
        isi_count = isi_count + 1;
    end
    % Show movie
    stim = movieList_arr(j,:);
    movieName{j}=movieList_arr(j,:);
    Problematic_movieNames={'024_F.mp4','048_M.mp4','048_F.mp4','005_F.mp4'}; %2.94 sec, 2.82 sec, 2.61 sec, 2.62 sec
   % stimulus = ['D:\Hilal\ActionClusters\fMRI_ActionCluster_Experiment_old\Videos-with-dot\' stim];
    stimulus = ['D:\Hilal\ActionClusters\OriginalVideos\Mirrored_Videos\CCN ActClsfMRI Mirrored\' stim];
    openmovtime = GetSecs;
    [movie dur fps imgw imgh] = Screen('OpenMovie', win, stimulus);
    Screen('SetMovieTimeIndex', movie, 0);
    Screen('PlayMovie', movie, 1, 0, 0);
    missed = 1;
    starttime = GetSecs;
    movSTime = starttime;
%     if mod(j,2)==0
%         movSTime=pairSTime;
%     end
    while GetSecs < starttime + dur
        [movietexture pts] = Screen('GetMovieImage', win, movie, 1, [], [], 0);
        if movietexture <= 0
            break;
        end
        Screen('DrawTexture', win, movietexture);
        Screen('Flip', win);
        Screen('Close', movietexture);
    end
    Screen('CloseMovie', movie);
    movETime = GetSecs;
    movDur = movETime - movSTime;
    dataActClstfMRI.output.movName{j}=stim;
    dataActClstfMRI.output.movOnset(j)=movSTime-expSTime;
    dataActClstfMRI.output.movOffset(j)=movETime-expSTime;
    dataActClstfMRI.output.movDur(j)=movDur;
    
    if all(stim == Problematic_movieNames{1}) %024_F
        LFcount=LFcount+1;
        cd('D:\Hilal\ActionClusters\OriginalVideos\Videos_less_than_3_sec_lastFrames');
        lastFrame=[stim(1:5) '_LastFrame.jpg'];
        imagedata = imread(lastFrame);
        lastFrame_img = Screen('MakeTexture', win, imagedata);
        Screen(win, 'DrawTexture', lastFrame_img);
        Screen('Flip',win);
        WaitSecs(3-2.92);
        %Screen('Close', lastFrame);
        lastFrame_offset=GetSecs;
        lastFrame_Dur=lastFrame_offset-movSTime;
        dataActClstfMRI.output.lastFrameDur(LFcount)=lastFrame_Dur;
    elseif all(stim == Problematic_movieNames{2}) %048_M
        LFcount=LFcount+1;
        cd('D:\Hilal\ActionClusters\OriginalVideos\Videos_less_than_3_sec_lastFrames');
        lastFrame=[stim(1:5) '_LastFrame.jpg'];
        imagedata = imread(lastFrame);
        lastFrame_img = Screen('MakeTexture', win, imagedata);
        Screen(win, 'DrawTexture', lastFrame_img);
        Screen('Flip',win);
        WaitSecs(3-2.8);
        %Screen('Close', lastFrame);
        lastFrame_offset=GetSecs;
        lastFrame_Dur=lastFrame_offset-movSTime;
        dataActClstfMRI.output.lastFrameDur(LFcount)=lastFrame_Dur;
    elseif all(stim == Problematic_movieNames{3}) %048_F
        LFcount=LFcount+1;
        cd('D:\Hilal\ActionClusters\OriginalVideos\Videos_less_than_3_sec_lastFrames');
        lastFrame=[stim(1:5) '_LastFrame.jpg'];
        imagedata = imread(lastFrame);
        lastFrame_img = Screen('MakeTexture', win, imagedata);
        Screen(win, 'DrawTexture', lastFrame_img);
        Screen('Flip',win);
        WaitSecs(3-2.6);
        %Screen('Close', lastFrame);
        lastFrame_offset=GetSecs;
        lastFrame_Dur=lastFrame_offset-movSTime;
        dataActClstfMRI.output.lastFrameDur(LFcount)=lastFrame_Dur;
    elseif all(stim == Problematic_movieNames{4}) %005_F
        LFcount=LFcount+1;
        cd('D:\Hilal\ActionClusters\OriginalVideos\Videos_less_than_3_sec_lastFrames');
        lastFrame=[stim(1:5) '_LastFrame.jpg'];
        imagedata = imread(lastFrame);
        lastFrame_img = Screen('MakeTexture', win, imagedata);
        Screen(win, 'DrawTexture', lastFrame_img);
        Screen('Flip',win);
        WaitSecs(3-2.6);
        %Screen('Close', lastFrame);
        lastFrame_offset=GetSecs;
        lastFrame_Dur=lastFrame_offset-movSTime;
        dataActClstfMRI.output.lastFrameDur(LFcount)=lastFrame_Dur;
    end
    
    count=count+1;
    if mod(j,2)==0
        pairSTime=dataActClstfMRI.output.movOnset(j-1);
        pairETime=dataActClstfMRI.output.movOffset(j);
        dataActClstfMRI.output.movPair(pairnum).movPairOnset=pairSTime;
        dataActClstfMRI.output.movPair(pairnum).movPairOffset=pairETime;
        dataActClstfMRI.output.movPair(pairnum).movPairDur=pairETime-pairSTime;
        if pairnum==QordShuffle(1)
            KbQueueStart();
            pairnum1=pairnum;
            textSize=20;
            Screen('TextSize',win,textSize);
            DrawFormattedText(win,[C{Qint(1), 3}{1, 1} '?'],'center','center', [0 0 0], [], 1);
            Screen('Flip',win);
            textOn=GetSecs;
            WaitSecs(durQ);
            textOff=GetSecs;
            Qcount=Qcount+1;
            dataActClstfMRI.output.Question(Qcount).textOnset=textOn-expSTime;
            dataActClstfMRI.output.Question(Qcount).textOffset=textOff-expSTime;
            dataActClstfMRI.output.Question(Qcount).textDur=textOff-textOn;
            dataActClstfMRI.output.Question(Qcount).text=C{Qint(1), 3}{1, 1};
            [pressed, firstPress] = KbQueueCheck();
            if pressed
                if find(firstPress)==KbName('1!')||find(firstPress)==KbName('4$')
                    timeSecs = firstPress(find(firstPress));
                    if (timeSecs >= textOn) && (timeSecs <= textOff)
                        % Valid 'space' key response within the totalStimDuration interval:
                        resp_count=resp_count+1;
                        resp = KbName(firstPress);
                        respRT = timeSecs - textOn;
                        resp_arr=[resp_arr resp];
                        respRT_arr=[respRT_arr respRT];
                        KbQueueStop();
                        dataActClstfMRI.output.Question(Qcount).resp=resp;
                        dataActClstfMRI.output.Question(Qcount).restRT=respRT;
                        %fprintf(outfile, '%s\t%8.3f\t%8.3f\t%d\t%d\t%d\t%d\t%d\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%s\t%8.3f\r', [], [], [], [], [], [], [], [], [], [], [], [], [], [], resp, respRT);
                        %'BlockType\tBlockOnset\tBlockDuration\tDistractorType\tDistractorLocation\tTrialNo\ttShapeOrientation\ttShapeColor\tConditionOnset\tConditionDur\ttOnset\ttDur\tISI_onset\tISI_Dur\tResponse\tRT\n'
                        %data.Response{resp_count}=resp_arr; resp_arr=[];
                        %data.RT{resp_count}=respRT_arr; respRT_arr=[];
                    end
                else
                    resp='Miss';
                    resp_arr=[resp_arr resp];
                    dataActClstfMRI.output.Question(Qcount).resp=resp;
                    dataActClstfMRI.output.Question(Qcount).restRT='NA';
                    %respTrial_arr=[respTrial_arr respTrial];
                    %fprintf(outfile, '%s\t%8.3f\t%8.3f\t%d\t%d\t%d\t%d\t%d\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%s\t%8.3f\r', curBlock, blockOnsetT, [], 99, 99, trialNo, curTOrientation, curTColor, displayOnsetT, [], tOnsetT, tDur, ISIonsetT, ISIdur, 'MISS', '0');
                    %'BlockType\tBlockOnset\tBlockDuration\tDistractorType\tDistractorLocation\tTrialNo\ttShapeOrientation\ttShapeColor\tConditionOnset\tConditionDur\ttOnset\ttDur\tISI_onset\tISI_Dur\tResponse\tRT\n'
                end
            else
                resp='NA';
                resp_arr=[resp_arr resp];
                dataActClstfMRI.output.Question(Qcount).resp=resp;
                dataActClstfMRI.output.Question(Qcount).restRT='NA';
                %respTrial_arr=[respTrial_arr respTrial];
                %fprintf(outfile, '%s\t%8.3f\t%8.3f\t%d\t%d\t%d\t%d\t%d\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%s\t%8.3f\r', curBlock, blockOnsetT, [], 99, 99, trialNo, curTOrientation, curTColor, displayOnsetT, [], tOnsetT, tDur, ISIonsetT, ISIdur, 'NA', '0');
                %'BlockType\tBlockOnset\tBlockDuration\tDistractorType\tDistractorLocation\tTrialNo\ttShapeOrientation\ttShapeColor\tConditionOnset\tConditionDur\ttOnset\ttDur\tISI_onset\tISI_Dur\tResponse\tRT\n'
            end
        end
        KbQueueFlush();
        if pairnum==QordShuffle(2)+pairnum1
            KbQueueStart();
            pairnum2=pairnum;
            textSize=20;
            Screen('TextSize',win,textSize);
            DrawFormattedText(win,[C{Qint(2),3}{1, 1} '?'],'center','center', [0 0 0], [], 1);
            Screen('Flip',win);
            textOn=GetSecs;
            WaitSecs(durQ);
            textOff=GetSecs;
            Qcount=Qcount+1;
            dataActClstfMRI.output.Question(Qcount).textOnset=textOn-expSTime;
            dataActClstfMRI.output.Question(Qcount).textOffset=textOff-expSTime;
            dataActClstfMRI.output.Question(Qcount).textDur=textOff-textOn;
            dataActClstfMRI.output.Question(Qcount).text=C{Qint(2), 3}{1, 1};
            [pressed, firstPress] = KbQueueCheck();
            if pressed
                if find(firstPress)==KbName('1!')||find(firstPress)==KbName('4$')
                    timeSecs = firstPress(find(firstPress));
                    if (timeSecs >= textOn) && (timeSecs <= textOff)
                        % Valid 'space' key response within the totalStimDuration interval:
                        resp_count=resp_count+1;
                        resp = KbName(firstPress);
                        respRT = timeSecs - textOn;
                        resp_arr=[resp_arr resp];
                        respRT_arr=[respRT_arr respRT];
                        KbQueueStop();
                        dataActClstfMRI.output.Question(Qcount).resp=resp;
                        dataActClstfMRI.output.Question(Qcount).restRT=respRT;
                        %fprintf(outfile, '%s\t%8.3f\t%8.3f\t%d\t%d\t%d\t%d\t%d\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%s\t%8.3f\r', [], [], [], [], [], [], [], [], [], [], [], [], [], [], resp, respRT);
                        %'BlockType\tBlockOnset\tBlockDuration\tDistractorType\tDistractorLocation\tTrialNo\ttShapeOrientation\ttShapeColor\tConditionOnset\tConditionDur\ttOnset\ttDur\tISI_onset\tISI_Dur\tResponse\tRT\n'
                        %data.Response{resp_count}=resp_arr; resp_arr=[];
                        %data.RT{resp_count}=respRT_arr; respRT_arr=[];
                    end
                else
                    resp='Miss';
                    resp_arr=[resp_arr resp];
                    dataActClstfMRI.output.Question(Qcount).resp=resp;
                    dataActClstfMRI.output.Question(Qcount).restRT='NA';
                    %respTrial_arr=[respTrial_arr respTrial];
                    %fprintf(outfile, '%s\t%8.3f\t%8.3f\t%d\t%d\t%d\t%d\t%d\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%s\t%8.3f\r', curBlock, blockOnsetT, [], 99, 99, trialNo, curTOrientation, curTColor, displayOnsetT, [], tOnsetT, tDur, ISIonsetT, ISIdur, 'MISS', '0');
                    %'BlockType\tBlockOnset\tBlockDuration\tDistractorType\tDistractorLocation\tTrialNo\ttShapeOrientation\ttShapeColor\tConditionOnset\tConditionDur\ttOnset\ttDur\tISI_onset\tISI_Dur\tResponse\tRT\n'
                end
            else
                resp='NA';
                resp_arr=[resp_arr resp];
                dataActClstfMRI.output.Question(Qcount).resp=resp;
                dataActClstfMRI.output.Question(Qcount).restRT='NA';
                %respTrial_arr=[respTrial_arr respTrial];
                %fprintf(outfile, '%s\t%8.3f\t%8.3f\t%d\t%d\t%d\t%d\t%d\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%s\t%8.3f\r', curBlock, blockOnsetT, [], 99, 99, trialNo, curTOrientation, curTColor, displayOnsetT, [], tOnsetT, tDur, ISIonsetT, ISIdur, 'NA', '0');
                %'BlockType\tBlockOnset\tBlockDuration\tDistractorType\tDistractorLocation\tTrialNo\ttShapeOrientation\ttShapeColor\tConditionOnset\tConditionDur\ttOnset\ttDur\tISI_onset\tISI_Dur\tResponse\tRT\n'
            end
        end
        KbQueueFlush();
        if pairnum==QordShuffle(3)+pairnum2
            KbQueueStart();
            pairnum3=pairnum;
            textSize=20;
            Screen('TextSize',win,textSize);
            DrawFormattedText(win,[C{Qint(3),3}{1, 1} '?'],'center','center', [0 0 0], [], 1);
            Screen('Flip',win);
            textOn=GetSecs;
            WaitSecs(durQ);
            textOff=GetSecs;
            Qcount=Qcount+1;
            dataActClstfMRI.output.Question(Qcount).textOnset=textOn-expSTime;
            dataActClstfMRI.output.Question(Qcount).textOffset=textOff-expSTime;
            dataActClstfMRI.output.Question(Qcount).textDur=textOff-textOn;
            dataActClstfMRI.output.Question(Qcount).text=C{Qint(1), 3}{1, 1};
            [pressed, firstPress] = KbQueueCheck();
            if pressed
                if find(firstPress)==KbName('1!')||find(firstPress)==KbName('4$')
                    timeSecs = firstPress(find(firstPress));
                    if (timeSecs >= textOn) && (timeSecs <= textOff)
                        % Valid 'space' key response within the totalStimDuration interval:
                        resp_count=resp_count+1;
                        resp = KbName(firstPress);
                        respRT = timeSecs - textOn;
                        resp_arr=[resp_arr resp];
                        respRT_arr=[respRT_arr respRT];
                        KbQueueStop();
                        dataActClstfMRI.output.Question(Qcount).resp=resp;
                        dataActClstfMRI.output.Question(Qcount).restRT=respRT;
                        %fprintf(outfile, '%s\t%8.3f\t%8.3f\t%d\t%d\t%d\t%d\t%d\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%s\t%8.3f\r', [], [], [], [], [], [], [], [], [], [], [], [], [], [], resp, respRT);
                        %'BlockType\tBlockOnset\tBlockDuration\tDistractorType\tDistractorLocation\tTrialNo\ttShapeOrientation\ttShapeColor\tConditionOnset\tConditionDur\ttOnset\ttDur\tISI_onset\tISI_Dur\tResponse\tRT\n'
                        %data.Response{resp_count}=resp_arr; resp_arr=[];
                        %data.RT{resp_count}=respRT_arr; respRT_arr=[];
                    end
                else
                    resp='Miss';
                    resp_arr=[resp_arr resp];
                    dataActClstfMRI.output.Question(Qcount).resp=resp;
                    dataActClstfMRI.output.Question(Qcount).restRT='NA';
                    %respTrial_arr=[respTrial_arr respTrial];
                    %fprintf(outfile, '%s\t%8.3f\t%8.3f\t%d\t%d\t%d\t%d\t%d\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%s\t%8.3f\r', curBlock, blockOnsetT, [], 99, 99, trialNo, curTOrientation, curTColor, displayOnsetT, [], tOnsetT, tDur, ISIonsetT, ISIdur, 'MISS', '0');
                    %'BlockType\tBlockOnset\tBlockDuration\tDistractorType\tDistractorLocation\tTrialNo\ttShapeOrientation\ttShapeColor\tConditionOnset\tConditionDur\ttOnset\ttDur\tISI_onset\tISI_Dur\tResponse\tRT\n'
                end
            else
                resp='NA';
                resp_arr=[resp_arr resp];
                dataActClstfMRI.output.Question(Qcount).resp=resp;
                dataActClstfMRI.output.Question(Qcount).restRT='NA';
                %respTrial_arr=[respTrial_arr respTrial];
                %fprintf(outfile, '%s\t%8.3f\t%8.3f\t%d\t%d\t%d\t%d\t%d\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%s\t%8.3f\r', curBlock, blockOnsetT, [], 99, 99, trialNo, curTOrientation, curTColor, displayOnsetT, [], tOnsetT, tDur, ISIonsetT, ISIdur, 'NA', '0');
                %'BlockType\tBlockOnset\tBlockDuration\tDistractorType\tDistractorLocation\tTrialNo\ttShapeOrientation\ttShapeColor\tConditionOnset\tConditionDur\ttOnset\ttDur\tISI_onset\tISI_Dur\tResponse\tRT\n'
            end
        end
        KbQueueFlush();
        if pairnum==QordShuffle(4)+pairnum3
            KbQueueStart();
            pairnum4=pairnum;
            textSize=20;
            Screen('TextSize',win,textSize);
            DrawFormattedText(win,[C{Qint(4),3}{1, 1} '?'],'center','center', [0 0 0], [], 1);
            Screen('Flip',win);
            textOn=GetSecs;
            WaitSecs(durQ);
            textOff=GetSecs;
            Qcount=Qcount+1;
            dataActClstfMRI.output.Question(Qcount).textOnset=textOn-expSTime;
            dataActClstfMRI.output.Question(Qcount).textOffset=textOff-expSTime;
            dataActClstfMRI.output.Question(Qcount).textDur=textOff-textOn;
            dataActClstfMRI.output.Question(Qcount).text=C{Qint(1), 3}{1, 1};
            [pressed, firstPress] = KbQueueCheck();
            if pressed
                if find(firstPress)==KbName('1!')||find(firstPress)==KbName('4$')
                    timeSecs = firstPress(find(firstPress));
                    if (timeSecs >= textOn) && (timeSecs <= textOff)
                        resp_count=resp_count+1;
                        resp = KbName(firstPress);
                        respRT = timeSecs - textOn;
                        resp_arr=[resp_arr resp];
                        respRT_arr=[respRT_arr respRT];
                        KbQueueStop();
                        dataActClstfMRI.output.Question(Qcount).resp=resp;
                        dataActClstfMRI.output.Question(Qcount).restRT=respRT;
                        %fprintf(outfile, '%s\t%8.3f\t%8.3f\t%d\t%d\t%d\t%d\t%d\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%s\t%8.3f\r', [], [], [], [], [], [], [], [], [], [], [], [], [], [], resp, respRT);
                        %'BlockType\tBlockOnset\tBlockDuration\tDistractorType\tDistractorLocation\tTrialNo\ttShapeOrientation\ttShapeColor\tConditionOnset\tConditionDur\ttOnset\ttDur\tISI_onset\tISI_Dur\tResponse\tRT\n'
                        %data.Response{resp_count}=resp_arr; resp_arr=[];
                        %data.RT{resp_count}=respRT_arr; respRT_arr=[];
                    end
                else
                    resp='Miss';
                    resp_arr=[resp_arr resp];
                    dataActClstfMRI.output.Question(Qcount).resp=resp;
                    dataActClstfMRI.output.Question(Qcount).restRT='NA';
                    %respTrial_arr=[respTrial_arr respTrial];
                    %fprintf(outfile, '%s\t%8.3f\t%8.3f\t%d\t%d\t%d\t%d\t%d\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%s\t%8.3f\r', curBlock, blockOnsetT, [], 99, 99, trialNo, curTOrientation, curTColor, displayOnsetT, [], tOnsetT, tDur, ISIonsetT, ISIdur, 'MISS', '0');
                    %'BlockType\tBlockOnset\tBlockDuration\tDistractorType\tDistractorLocation\tTrialNo\ttShapeOrientation\ttShapeColor\tConditionOnset\tConditionDur\ttOnset\ttDur\tISI_onset\tISI_Dur\tResponse\tRT\n'
                end
            else
                resp='NA';
                resp_arr=[resp_arr resp];
                dataActClstfMRI.output.Question(Qcount).resp=resp;
                dataActClstfMRI.output.Question(Qcount).restRT='NA';
                %respTrial_arr=[respTrial_arr respTrial];
                %fprintf(outfile, '%s\t%8.3f\t%8.3f\t%d\t%d\t%d\t%d\t%d\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%8.3f\t%s\t%8.3f\r', curBlock, blockOnsetT, [], 99, 99, trialNo, curTOrientation, curTColor, displayOnsetT, [], tOnsetT, tDur, ISIonsetT, ISIdur, 'NA', '0');
                %'BlockType\tBlockOnset\tBlockDuration\tDistractorType\tDistractorLocation\tTrialNo\ttShapeOrientation\ttShapeColor\tConditionOnset\tConditionDur\ttOnset\ttDur\tISI_onset\tISI_Dur\tResponse\tRT\n'
            end
        end
        KbQueueFlush();
        pairnum=pairnum+1;
    end
end
% last ISI after movielist is shown
isi = Dur.ISI(isi_count); % isi duration varies between 1.7 and 2.7 over a normal distribution
% Show fixation cross
cd(path);
imagedata = imread('fixation_point.png');
TexturePointer = Screen('MakeTexture', win, imagedata);
Screen(win,'DrawTexture', TexturePointer);
Screen('Flip',win);
fixSTime = GetSecs;
WaitSecs(isi);
fixETime = GetSecs;
isionsets = [isionsets fixSTime];
isidur = fixETime - fixSTime;
isidurations = [isidurations isidur];
dataActClstfMRI.output.ISIonset(isi_count)=fixSTime-expSTime;
dataActClstfMRI.output.ISIoffset(isi_count)=fixETime-expSTime;
dataActClstfMRI.output.ISIdur(isi_count)=fixETime-fixSTime;
blockETime = GetSecs();
dataActClstfMRI.output.ExpblockOnset=blockSTime-expSTime;
dataActClstfMRI.output.ExpblockOffset=blockETime-expSTime;
dataActClstfMRI.output.ExpblockDur=blockETime-blockSTime;
%% Rest Block at the end
restEDur=9;
cd(path);
imagedata = imread('fixation_point.png');
TexturePointer = Screen('MakeTexture', win, imagedata);
Screen(win,'DrawTexture', TexturePointer);
Screen('Flip',win);
RestSTime = GetSecs;
WaitSecs(restEDur);
RestETime = GetSecs;
RestDur=RestETime-RestSTime;
dataActClstfMRI.output.RestatEndOnset=RestSTime-expSTime;
dataActClstfMRI.output.RestatEndOffset=RestETime-expSTime;
dataActClstfMRI.output.RestatEndDur=RestETime-RestSTime;
expEndTime = GetSecs;
dataActClstfMRI.expDuration=expEndTime-expSTime;
%% Outfile
fprintf(outfile, '\n');
% fprintf(outfile, 'Block Start Time: %8.1f ', blockSTime); fprintf(outfile, '\n');
% fprintf(outfile, 'Block End Time: %8.1f ', blockETime); fprintf(outfile, '\n');
fprintf(outfile, 'Total Block Time: %8.1f', blockETime-blockSTime);
fprintf(outfile, '\n\n');

% allquestionResponses = keyQuestionResp;
% allquestionRTs = keyQuestionRT;
% allquestionOnsets = keyQuestionOnsets;

fprintf(outfile, '\n\n');
fprintf(outfile, 'Experiment Start Time: %8.1f ', expSTime); fprintf(outfile, '\n');
fprintf(outfile, 'Experiment End Time: %8.1f ', expEndTime); fprintf(outfile, '\n');
fprintf(outfile, 'Total Experiment Time: %8.1f ', expEndTime-expSTime);
%% Save results
Screen('CloseAll');
cd(runpath)
save dataActClstfMRI dataActClstfMRI;
