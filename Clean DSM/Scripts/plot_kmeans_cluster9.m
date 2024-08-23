
%[idx9 cent9 sumdist9 D9] = kmeans(X,9, 'Distance', 'cityblock', 'MaxIter', 1000, 'Replicates', 1000, 'Display', 'final', 'Start', 'uniform');

% Plotting with 9 clusters

cluster1 = X(idx9 == 1, :);
cluster2 = X(idx9 == 2, :);
cluster3 = X(idx9 == 3, :);
cluster4 = X(idx9 == 4, :);
cluster5 = X(idx9 == 5, :);
cluster6 = X(idx9 == 6, :);
cluster7 = X(idx9 == 7, :);
cluster8 = X(idx9 == 8, :);
cluster9 = X(idx9 == 9, :);


%% Set action labels
dx = 1; dy = 1; dz = 1;

c1 = find(idx9 == 1);
c2 = find(idx9 == 2);
c3 = find(idx9 == 3);
c4 = find(idx9 == 4);
c5 = find(idx9 == 5);
c6 = find(idx9 == 6);
c7 = find(idx9 == 7);
c8 = find(idx9 == 8);
c9 = find(idx9 == 9);

save cluster9

b1 = num2str(c1); d1 = cellstr(b1);
b2 = num2str(c2); d2 = cellstr(b2);
b3 = num2str(c3); d3 = cellstr(b3);
b4 = num2str(c4); d4 = cellstr(b4);
b5 = num2str(c5); d5 = cellstr(b5);
b6 = num2str(c6); d6 = cellstr(b6);
b7 = num2str(c7); d7 = cellstr(b7);
b8 = num2str(c8); d8 = cellstr(b8);
b9 = num2str(c9); d9 = cellstr(b9);


% 3D plot
figure
axes
hold all
plot3(cluster1(:,1), cluster1(:,2), cluster1(:,3), '.', 'MarkerSize', 25, 'Color', 'r')
%text(cluster1(:,1)+dx, cluster1(:,2)+dy, cluster1(:,3)+dz, d1, 'FontSize', 10)

plot3(cluster2(:,1), cluster2(:,2), cluster2(:,3), '.', 'MarkerSize', 25, 'Color', 'g')
%text(cluster2(:,1)+dx, cluster2(:,2)+dy, cluster2(:,3)+dz, d2, 'FontSize', 10)

plot3(cluster3(:,1), cluster3(:,2), cluster3(:,3), '.', 'MarkerSize', 25, 'Color', 'b')
%text(cluster3(:,1)+dx, cluster3(:,2)+dy, cluster3(:,3)+dz, d3, 'FontSize', 10)

plot3(cluster4(:,1), cluster4(:,2), cluster4(:,3), '.', 'MarkerSize', 25, 'Color', 'y')
%text(cluster4(:,1)+dx, cluster4(:,2)+dy, cluster4(:,3)+dz, d4, 'FontSize', 10)

plot3(cluster5(:,1), cluster5(:,2), cluster5(:,3), '.', 'MarkerSize', 25, 'Color', 'm')
%text(cluster5(:,1)+dx, cluster5(:,2)+dy, cluster5(:,3)+dz, d5, 'FontSize', 10)

plot3(cluster6(:,1), cluster6(:,2), cluster6(:,3), '.', 'MarkerSize', 25, 'Color', 'c')
%text(cluster6(:,1)+dx, cluster6(:,2)+dy, cluster6(:,3)+dz, d6, 'FontSize', 10)

plot3(cluster7(:,1), cluster7(:,2), cluster7(:,3), '.', 'MarkerSize', 25, 'Color', 'k')
%text(cluster7(:,1)+dx, cluster7(:,2)+dy, cluster7(:,3)+dz, d7, 'FontSize', 10)

plot3(cluster8(:,1), cluster8(:,2), cluster8(:,3), '.', 'MarkerSize', 25, 'Color', [0.5 0.5 0.5])
%text(cluster8(:,1)+dx, cluster8(:,2)+dy, cluster8(:,3)+dz, d8, 'FontSize', 10)

plot3(cluster9(:,1), cluster9(:,2), cluster9(:,3), '.', 'MarkerSize', 25, 'Color', [1.0000 0.6445 0])
%text(cluster9(:,1)+dx, cluster9(:,2)+dy, cluster9(:,3)+dz, d9, 'FontSize', 10)

hold on;
%plot3(cent9(:,1), cent9(:,2), cent9(:,3), 'kx', 'MarkerSize', 15, 'LineWidth', 3); hold on;

xlabel('PC 1')
ylabel('PC 2')
zlabel('PC 3')

legend

grid on
box on



% 2D plot => PC1 vs PC2 
% figure
% axes
% hold all
% 
% plot(cent9(:,1), cent9(:,2), 'kx', 'MarkerSize', 15, 'LineWidth', 3); hold on;
% 
% plot(cluster1(:,1), cluster1(:,2),  '.', 'MarkerSize', 25, 'Color', 'r');  
% text(cluster1(:,1)+dx, cluster1(:,2)+dy, d1, 'FontSize', 10)
% 
% plot(cluster2(:,1), cluster2(:,2), '.', 'MarkerSize', 25, 'Color', 'g')
% text(cluster2(:,1)+dx, cluster2(:,2)+dy, d2, 'FontSize', 10)
% 
% plot(cluster3(:,1), cluster3(:,2), '.', 'MarkerSize', 25, 'Color', 'b')
% text(cluster3(:,1)+dx, cluster3(:,2)+dy, d3, 'FontSize', 10)
% 
% plot(cluster4(:,1), cluster4(:,2), '.', 'MarkerSize', 25, 'Color', 'y')
% text(cluster4(:,1)+dx, cluster4(:,2)+dy, d4, 'FontSize', 10)
% 
% plot(cluster5(:,1), cluster5(:,2), '.', 'MarkerSize', 25, 'Color', 'm')
% text(cluster5(:,1)+dx, cluster5(:,2)+dy, d5, 'FontSize', 10)
% 
% plot(cluster6(:,1), cluster6(:,2),  '.', 'MarkerSize', 25, 'Color', 'c')
% text(cluster6(:,1)+dx, cluster6(:,2)+dy, d6, 'FontSize', 10)
% 
% plot(cluster7(:,1), cluster7(:,2), '.', 'MarkerSize', 25, 'Color', 'k')
% text(cluster7(:,1)+dx, cluster7(:,2)+dy, d7, 'FontSize', 10)
% 
% plot(cluster8(:,1), cluster8(:,2), '.', 'MarkerSize', 25, 'Color', [0.5 0.5 0.5])
% text(cluster8(:,1)+dx, cluster8(:,2)+dy, d8, 'FontSize', 10)
% 
% plot(cluster9(:,1), cluster9(:,2),  '.', 'MarkerSize', 25, 'Color', [1.0000 0.6445 0])
% text(cluster9(:,1)+dx, cluster9(:,2)+dy, d9, 'FontSize', 10)
% 
% xlabel('PC 1')
% ylabel('PC 2')
% 
% legend
% 
% grid on
% box on

