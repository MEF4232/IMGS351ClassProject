function plot_color_diff
Color_Diff_Patches = CIELab_patches(false);

disp(Color_Diff_Patches);

% create a new figure with hold on and line_width = 1.5
figure;
hold on;
line_weight = 1.5;

set(gca, 'FontSize', 14);
set(gca, 'LineWidth', line_weight);
axis('equal'); % make plot scales equal
axis([-60,60,-60,60]); % set the axis ranges
xlabel('a*');
ylabel('b*');

% set the min and max for each axis of the plot
axis([-60 60 -60 60],'xy');

% force the tick spacing of the plot to be 0.3 on the X axis
set(gca, 'XTick', -60:10:60);
set(gca, 'XTickLabel', -60:10:60 );

% force the tick spacing of the plot to be 0.3 on the Y axis
set(gca, 'YTick', -60:10:60);
set(gca, 'YTickLabel', -60:10:60 );

% set the minor ticks on the axis
set(gca, 'XMinorTick', 'on');
set(gca, 'YMinorTick', 'on');


r1 = plot(Color_Diff_Patches(1,2),Color_Diff_Patches(1,3),'sr');
c1 = viscircles([Color_Diff_Patches(1,2) Color_Diff_Patches(1,3)],2.5,'Color','black', 'LineWidth', .5);
i1 = plot(Color_Diff_Patches(2,2),Color_Diff_Patches(2,3),'dr');
m1 = plot(Color_Diff_Patches(3,2),Color_Diff_Patches(3,3),'+r');
r2 = plot(Color_Diff_Patches(4,2),Color_Diff_Patches(4,3),'sb');
c2 = viscircles([Color_Diff_Patches(4,2) Color_Diff_Patches(4,3)],2.5,'Color','black', 'LineWidth', .5);
i2 = plot(Color_Diff_Patches(5,2),Color_Diff_Patches(5,3),'db');
m2 = plot(Color_Diff_Patches(6,2),Color_Diff_Patches(6,3),'+b');

legend([r1 i1 m1 r2 i2 m2],{'28.1 real','28.1 imaged','28.1 matching','28.2 real','28.2 imaged','28.2 matching'},'Location','southeast');


end

