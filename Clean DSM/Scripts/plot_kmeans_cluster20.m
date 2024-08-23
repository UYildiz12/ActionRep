
% Plotting with 20 clusters

cluster1 = X(idx20 == 1, :);
cluster2 = X(idx20 == 2, :);
cluster3 = X(idx20 == 3, :);
cluster4 = X(idx20 == 4, :);
cluster5 = X(idx20 == 5, :);
cluster6 = X(idx20 == 6, :);
cluster7 = X(idx20 == 7, :);
cluster8 = X(idx20 == 8, :);
cluster9 = X(idx20 == 9, :);
cluster10 = X(idx20 == 10, :);
cluster11 = X(idx20 == 11, :);
cluster12 = X(idx20 == 12, :);
cluster13 = X(idx20 == 13, :);
cluster14 = X(idx20 == 14, :);
cluster15 = X(idx20 == 15, :);
cluster16 = X(idx20 == 16, :);
cluster17 = X(idx20 == 17, :);
cluster18 = X(idx20 == 18, :);
cluster19 = X(idx20 == 19, :);
cluster20 = X(idx20 == 20, :);



%% 3D
dx = 1; dy = 1; dz = 1;

c1 = find(idx20 == 1);
c2 = find(idx20 == 2);
c3 = find(idx20 == 3);
c4 = find(idx20 == 4);
c5 = find(idx20 == 5);
c6 = find(idx20 == 6);
c7 = find(idx20 == 7);
c8 = find(idx20 == 8);
c9 = find(idx20 == 9);
c10 = find(idx20 == 10);
c11 = find(idx20 == 11);
c12 = find(idx20 == 12);
c13 = find(idx20 == 13);
c14 = find(idx20 == 14);
c15 = find(idx20 == 15);
c16 = find(idx20 == 16);
c17 = find(idx20 == 17);
c18 = find(idx20 == 18);
c19 = find(idx20 == 19);
c20 = find(idx20 == 20);


b1 = num2str(c1); d1 = cellstr(b1);
b2 = num2str(c2); d2 = cellstr(b2);
b3 = num2str(c3); d3 = cellstr(b3);
b4 = num2str(c4); d4 = cellstr(b4);
b5 = num2str(c5); d5 = cellstr(b5);
b6 = num2str(c6); d6 = cellstr(b6);
b7 = num2str(c7); d7 = cellstr(b7);
b8 = num2str(c8); d8 = cellstr(b8);
b9 = num2str(c9); d9 = cellstr(b9);
b10 = num2str(c10); d10 = cellstr(b10);
b11 = num2str(c11); d11 = cellstr(b11);
b12 = num2str(c12); d12 = cellstr(b12);
b13 = num2str(c13); d13 = cellstr(b13);
b14 = num2str(c14); d14 = cellstr(b14);
b15 = num2str(c15); d15 = cellstr(b15);
b16 = num2str(c16); d16 = cellstr(b16);
b17 = num2str(c17); d17 = cellstr(b17);
b18 = num2str(c18); d18 = cellstr(b18);
b19 = num2str(c19); d19 = cellstr(b19);
b20 = num2str(c20); d20 = cellstr(b20);



figure
axes
hold all

%plot3(cent9(:,1), cent9(:,2), cent9(:,3), 'kx', 'MarkerSize', 15, 'LineWidth', 3); hold on;

plot3(cluster1(:,1), cluster1(:,2), cluster1(:,3), '.', 'MarkerSize', 20, 'Color', 'r')
text(cluster1(:,1)+dx, cluster1(:,2)+dy, cluster1(:,3)+dz, d1, 'FontSize', 10)

plot3(cluster2(:,1), cluster2(:,2), cluster2(:,3), '.', 'MarkerSize', 20, 'Color', 'g')
text(cluster2(:,1)+dx, cluster2(:,2)+dy, cluster2(:,3)+dz, d2, 'FontSize', 10)

plot3(cluster3(:,1), cluster3(:,2), cluster3(:,3), '.', 'MarkerSize', 20, 'Color', 'b')
text(cluster3(:,1)+dx, cluster3(:,2)+dy, cluster3(:,3)+dz, d3, 'FontSize', 10)

plot3(cluster4(:,1), cluster4(:,2), cluster4(:,3), '.', 'MarkerSize', 20, 'Color', 'y')
text(cluster4(:,1)+dx, cluster4(:,2)+dy, cluster4(:,3)+dz, d4, 'FontSize', 10)

plot3(cluster5(:,1), cluster5(:,2), cluster5(:,3), '.', 'MarkerSize', 20, 'Color', 'm')
text(cluster5(:,1)+dx, cluster5(:,2)+dy, cluster5(:,3)+dz, d5, 'FontSize', 10)

plot3(cluster6(:,1), cluster6(:,2), cluster6(:,3), '.', 'MarkerSize', 20, 'Color', 'c')
text(cluster6(:,1)+dx, cluster6(:,2)+dy, cluster6(:,3)+dz, d6, 'FontSize', 10)

plot3(cluster7(:,1), cluster7(:,2), cluster7(:,3), '.', 'MarkerSize', 20, 'Color', 'k')
text(cluster7(:,1)+dx, cluster7(:,2)+dy, cluster7(:,3)+dz, d7, 'FontSize', 10)

plot3(cluster8(:,1), cluster8(:,2), cluster8(:,3), '.', 'MarkerSize', 20, 'Color', [0.5 0.5 0.5])
text(cluster8(:,1)+dx, cluster8(:,2)+dy, cluster8(:,3)+dz, d8, 'FontSize', 10)

plot3(cluster9(:,1), cluster9(:,2), cluster9(:,3), '.', 'MarkerSize', 20, 'Color', [1.0000 0.6445 0])
text(cluster9(:,1)+dx, cluster9(:,2)+dy, cluster9(:,3)+dz, d9, 'FontSize', 10)

plot3(cluster10(:,1), cluster10(:,2), cluster10(:,3), '.', 'MarkerSize', 20, 'Color', [0  0.3906  0])
text(cluster10(:,1)+dx, cluster10(:,2)+dy, cluster10(:,3)+dz, d10, 'FontSize', 10)

plot3(cluster11(:,1), cluster11(:,2), cluster11(:,3), '.', 'MarkerSize', 20, 'Color', [0.5000  0  0.5000])
text(cluster11(:,1)+dx, cluster11(:,2)+dy, cluster11(:,3)+dz, d11, 'FontSize', 10)

plot3(cluster12(:,1), cluster12(:,2), cluster12(:,3), '.', 'MarkerSize', 20, 'Color', [1.0000 0.7500 0.7930])
text(cluster12(:,1)+dx, cluster12(:,2)+dy, cluster12(:,3)+dz, d12, 'FontSize', 10)

plot3(cluster13(:,1), cluster13(:,2), cluster13(:,3), '.', 'MarkerSize', 20, 'Color', [0.9542 0.6406 0.3750])
text(cluster13(:,1)+dx, cluster13(:,2)+dy, cluster13(:,3)+dz, d13, 'FontSize', 10)

plot3(cluster14(:,1), cluster14(:,2), cluster14(:,3), '.', 'MarkerSize', 20, 'Color', [0.6250  0.3203  0.1758])
text(cluster14(:,1)+dx, cluster14(:,2)+dy, cluster14(:,3)+dz, d14, 'FontSize', 10)

plot3(cluster15(:,1), cluster15(:,2), cluster15(:,3), '.', 'MarkerSize', 20, 'Color', [0.3320  0.4180  0.1836])
text(cluster15(:,1)+dx, cluster15(:,2)+dy, cluster15(:,3)+dz, d15, 'FontSize', 10)

plot3(cluster16(:,1), cluster16(:,2), cluster16(:,3), '.', 'MarkerSize', 20, 'Color', [0.2539  0.4102  0.8789])
text(cluster16(:,1)+dx, cluster16(:,2)+dy, cluster16(:,3)+dz, d16, 'FontSize', 10)

plot3(cluster17(:,1), cluster17(:,2), cluster17(:,3), '.', 'MarkerSize', 20, 'Color', [0.4141  0.3516  0.8008])
text(cluster17(:,1)+dx, cluster17(:,2)+dy, cluster17(:,3)+dz, d17, 'FontSize', 10)

plot3(cluster18(:,1), cluster18(:,2), cluster18(:,3), '.', 'MarkerSize', 20, 'Color', [0.1836  0.3086  0.3086])
text(cluster18(:,1)+dx, cluster18(:,2)+dy, cluster18(:,3)+dz, d18, 'FontSize', 10)

plot3(cluster19(:,1), cluster19(:,2), cluster19(:,3), '.', 'MarkerSize', 20, 'Color', [0.7773    0.0820    0.5195])
text(cluster19(:,1)+dx, cluster19(:,2)+dy, cluster19(:,3)+dz, d19, 'FontSize', 10)

plot3(cluster20(:,1), cluster20(:,2), cluster20(:,3), '.', 'MarkerSize', 20, 'Color', [1.0000    0.3867    0.2773])
text(cluster20(:,1)+dx, cluster20(:,2)+dy, cluster20(:,3)+dz, d20, 'FontSize', 10)


xlabel('PC 1')
ylabel('PC 2')
zlabel('PC 3')

legend

grid on
box on