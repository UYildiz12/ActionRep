% % input
% PMC_Roi_MY=PMC_Roi_LH_0x2D1;
% j=1;
% for i=1:size(PMC_Roi_MY)
%     tmp=str2num(PMC_Roi_MY{i}(8:17));
%     if mod(tmp(1),2)==0 & mod(tmp(2),2)==0 & mod(tmp(3),2)==0
%         PMC_rois(j,:)=tmp;
%         j=j+1;
%     end
% end
% j=1;
% final_PMC_rois(1,:)= PMC_rois(j,:);
% for i=2:size(PMC_rois,1)
%     n=0;
%     for k=1:j
%          if sum(PMC_rois(i,:)==final_PMC_rois(k,:))==3
%              n=n+1;
%          end
%     end
%     if n==0
%         j=j+1;
%         final_PMC_rois(j,:)=PMC_rois(i,:);
%     end
% end
% plot3(final_PMC_rois(:,1),final_PMC_rois(:,2),final_PMC_rois(:,3),'.')
% % from IJK to MNI xyz 
% XYZ=[30.0, -16.0, 70.0];  
% IJK=[54, 48, 60] ;
% coord=(final_PMC_rois-repmat(IJK,size(final_PMC_rois,1),1))*2+repmat(XYZ,size(final_PMC_rois,1),1);
% save PMC_ROIS_LH-1 'coord';

% input

files=dir('Clustering_PPC_volume_FINAL');
f=1;
%for f=1:length(files)
PMC_Roi_MY=importdata(files(f).name);
j=1;
initial_rois(1,:)=str2num(PMC_Roi_MY{1}(8:end-1));
for i=2:size(PMC_Roi_MY)
    n=0;
    tmp=str2num(PMC_Roi_MY{i}(8:end-1));
    for k=1:j
         if sum(tmp==initial_rois(k,:))==3
             n=n+1;
         end
    end
    if n==0
        j=j+1;
        initial_rois(j,:)=tmp;
    end
end
plot3(initial_rois(:,1),initial_rois(:,2),initial_rois(:,3),'.')
% from IJK to MNI xyz 
XYZ=[30.0, -16.0, 70.0];  
IJK=[54, 48, 60] ;
Mini_Rois{f}.coord=(initial_rois-repmat(IJK,size(initial_rois,1),1))*2+repmat(XYZ,size(initial_rois,1),1);
clear initial_rois PMC_Roi_MY
%end
%mini_rois_jan=load('/mnt/.autofs/home/roohy/caret/jan_borders/mini_ROIs_PMC.mat'); % yan mini_ROIS
%for i=1:length(Mini_Rois)
coords=Mini_Rois{1,1}.coord;
    
save Clustering_PPC_volume_FINAL 'coords';
%clear
             