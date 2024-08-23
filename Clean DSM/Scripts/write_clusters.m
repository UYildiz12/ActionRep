
cd('/Volumes/BAURGEN/fMRI_Action_Clusters/ANALYSIS/subj03/Clustering_PPC_volume_FINAL/Clustering/run4/');
load('cluster14.mat');

fileID = fopen('clusters.txt','a');
clust1 = 'c1';
clust2 = 'c2';
clust3 = 'c3';
clust4 = 'c4';
clust5 = 'c5';
clust6 = 'c6';
clust7 = 'c7';
clust8 = 'c8';
clust9 = 'c9';
clust10 = 'c10';
clust11 = 'c11';
clust12 = 'c12';
clust13 = 'c13';
clust14 = 'c14';
%clust15 = 'c15';

fprintf(fileID,'%s\t', clust1);
for i = 1:length(c1)
   fprintf(fileID,'%d\t', c1(i));
end
fprintf(fileID,'\n');

fprintf(fileID,'%s\t', clust2);
for i = 1:length(c2)
   fprintf(fileID,'%d\t', c2(i));
end
fprintf(fileID,'\n');

fprintf(fileID,'%s\t', clust3);
for i = 1:length(c3)
   fprintf(fileID,'%d\t', c3(i));
end
fprintf(fileID,'\n');

fprintf(fileID,'%s\t', clust4);
for i = 1:length(c4)
   fprintf(fileID,'%d\t', c4(i));
end
fprintf(fileID,'\n');

fprintf(fileID,'%s\t', clust5);
for i = 1:length(c5)
   fprintf(fileID,'%d\t', c5(i));
end
fprintf(fileID,'\n');

fprintf(fileID,'%s\t', clust6);
for i = 1:length(c6)
   fprintf(fileID,'%d\t', c6(i));
end
fprintf(fileID,'\n');

fprintf(fileID,'%s\t', clust7);
for i = 1:length(c7)
   fprintf(fileID,'%d\t', c7(i));
end
fprintf(fileID,'\n');

fprintf(fileID,'%s\t', clust8);
for i = 1:length(c8)
   fprintf(fileID,'%d\t', c8(i));
end
fprintf(fileID,'\n');

fprintf(fileID,'%s\t', clust9);
for i = 1:length(c9)
   fprintf(fileID,'%d\t', c9(i));
end
fprintf(fileID,'\n');

fprintf(fileID,'%s\t', clust10);
for i = 1:length(c10)
   fprintf(fileID,'%d\t', c10(i));
end
fprintf(fileID,'\n');

fprintf(fileID,'%s\t', clust11);
for i = 1:length(c11)
   fprintf(fileID,'%d\t', c11(i));
end
fprintf(fileID,'\n');

fprintf(fileID,'%s\t', clust12);
for i = 1:length(c12)
   fprintf(fileID,'%d\t', c12(i));
end
fprintf(fileID,'\n');

fprintf(fileID,'%s\t', clust13);
for i = 1:length(c13)
   fprintf(fileID,'%d\t', c13(i));
end
fprintf(fileID,'\n');

fprintf(fileID,'%s\t', clust14);
for i = 1:length(c14)
   fprintf(fileID,'%d\t', c14(i));
end
% fprintf(fileID,'\n');
% 
% fprintf(fileID,'%s\t', clust15);
% for i = 1:length(c15)
%    fprintf(fileID,'%d\t', c15(i));
% end

fclose(fileID);
