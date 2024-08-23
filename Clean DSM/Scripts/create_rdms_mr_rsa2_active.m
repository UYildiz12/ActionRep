%design of the rdm matrices goes like actor video 1, actor video 2, ....,
%actor video 8, effector video 1, ....., target video 8

%% Video Description Structure for 8 videos

video_descriptions(1).vidno=1;
video_descriptions(1).actor="female";
video_descriptions(1).effector="foot";
video_descriptions(1).target="human";

video_descriptions(2).vidno=2;
video_descriptions(2).actor="female";
video_descriptions(2).effector="foot";
video_descriptions(2).target="object";

video_descriptions(3).vidno=3;
video_descriptions(3).actor="female";
video_descriptions(3).effector="hand";
video_descriptions(3).target="human";

video_descriptions(4).vidno=4;
video_descriptions(4).actor="female";
video_descriptions(4).effector="hand";
video_descriptions(4).target="object";

video_descriptions(5).vidno=5;
video_descriptions(5).actor="male";
video_descriptions(5).effector="foot";
video_descriptions(5).target="human";

video_descriptions(6).vidno=6;
video_descriptions(6).actor="male";
video_descriptions(6).effector="foot";
video_descriptions(6).target="object";

video_descriptions(7).vidno=7;
video_descriptions(7).actor="male";
video_descriptions(7).effector="hand";
video_descriptions(7).target="human";

video_descriptions(8).vidno=8;
video_descriptions(8).actor="male";
video_descriptions(8).effector="hand";
video_descriptions(8).target="object";


%% Actor Model

actor_orders=[video_descriptions.actor]; %for 8 videos
actor_orders=repmat(actor_orders,1,3); %repeate the order for 3 times - for each task
actor_model=zeros(24,24);

for i = 1:24
    for j = 1:24
        actor_model(i,j) = actor_orders(i) ~= actor_orders(j); % if they are same, it is 0, otherwise 1.
    end
end


%% Effector Model

effector_orders=[video_descriptions.effector]; 
effector_orders=repmat(effector_orders,1,3); 
effector_model=zeros(24,24);

for i = 1:24
    for j = 1:24
        effector_model(i,j) = effector_orders(i) ~= effector_orders(j); % if they are same, it is 0, otherwise 1.
    end
end

%% Target Model

target_orders=[video_descriptions.target];
target_orders=repmat(target_orders,1,3);
target_model=zeros(24,24);

for i = 1:24
    for j = 1:24
        target_model(i,j) = target_orders(i) ~= target_orders(j); % if they are same, it is 0, otherwise 1.
    end
end

%% Create the grand RDM structure

RDM.actor_model=actor_model;
RDM.effector_model=effector_model;
RDM.target_model=target_model;

save RDMs_active.mat RDM

