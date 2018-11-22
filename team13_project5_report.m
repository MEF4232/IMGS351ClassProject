%% Project 5 - Camera Characterization
% Molly Feldmann and Kevin Arnett, Team 13

%% step 3

img = imread('chart.png');
r = img(:,:,1); 
g = img(:,:,2); 
b = img(:,:,3); 

row_start = [75 250 425 625];
row_end = [200 390 580 750];

col_start = [35 225 415 590 775 950];
col_end = [180 360 540 715 905 1075];

cam_rgbs = zeros(3,18);
for row = 1:3
    for col = 1:6
        cam_rgbs(1,((row*6)-6)+col) = mean2(r(row_start(row):row_end(row),col_start(col):col_end(col)))/255;
        cam_rgbs(2,((row*6)-6)+col) = mean2(g(row_start(row):row_end(row),col_start(col):col_end(col)))/255;
        cam_rgbs(3,((row*6)-6)+col) = mean2(b(row_start(row):row_end(row),col_start(col):col_end(col)))/255;
    end
end

cam_gray_rgbs = zeros(3,6);
for col = 1:6
    cam_gray_rgbs(1,col) = mean2(r(row_start(4):row_end(4),col_start(col):col_end(col)))/255;
    cam_gray_rgbs(2,col) = mean2(g(row_start(4):row_end(4),col_start(col):col_end(col)))/255;
    cam_gray_rgbs(3,col) = mean2(b(row_start(4):row_end(4),col_start(col):col_end(col)))/255;
end

%cam_rgbs = [ cam_rgbs cam_gray_rgbs ];
cam_gray_rgbs = fliplr(cam_gray_rgbs);

%% step 4

munki = load("munki_CC_XYZs_Labs.txt"); 
munki_xyzs = munki(:,2:4)';
munki_labs = munki(:,5:7)';
munki_gray_ys = fliplr(munki_xyzs(2,19:24)/100);

%% step 5

figure;
plot(munki_gray_ys, cam_gray_rgbs(1,:), 'r',...
munki_gray_ys, cam_gray_rgbs(2,:), 'g',...
munki_gray_ys, cam_gray_rgbs(3,:), 'b');

title('original grayscale Y to RGB relationship');
xlabel('munki gray Ys');
ylabel('camera gray RGBs');

%% step 6

r = 1; g = 2; b = 3;

% a) fit low-order polynomial functions between normalized
% camera-captured gray RGBs and the munki-measured gray Ys
cam_polys(r,:) = polyfit(cam_gray_rgbs(r,:),munki_gray_ys,3);
cam_polys(g,:) = polyfit(cam_gray_rgbs(g,:),munki_gray_ys,3);
cam_polys(b,:) = polyfit(cam_gray_rgbs(b,:),munki_gray_ys,3);

% b) use the functions to linearize the camera data
cam_rss(r,:) = polyval(cam_polys(r,:),cam_rgbs(r,:));
cam_rss(g,:) = polyval(cam_polys(g,:),cam_rgbs(g,:));
cam_rss(b,:) = polyval(cam_polys(b,:),cam_rgbs(b,:));

cam_gray_rss(r,:) = polyval(cam_polys(r,:),cam_gray_rgbs(r,:));
cam_gray_rss(g,:) = polyval(cam_polys(g,:),cam_gray_rgbs(g,:));
cam_gray_rss(b,:) = polyval(cam_polys(b,:),cam_gray_rgbs(b,:));

% c) clip out of range values
cam_rss(cam_rss<0) = 0;
cam_rss(cam_rss>1) = 1;

cam_gray_rss(cam_gray_rss<0) = 0;
cam_gray_rss(cam_gray_rss>1) = 1;

%% step 7

figure;
plot(munki_gray_ys, cam_gray_rss(1,:), 'r',...
munki_gray_ys, cam_gray_rss(2,:), 'g',...
munki_gray_ys, cam_gray_rss(3,:), 'b');

title('linearized grayscale Y to RGB relationship');
xlabel('munki gray Ys');
ylabel('linearized camera gray RGBs (RSs)');

%% step 8

% visualize the original camera RGBs
pix = permute([cam_rgbs fliplr(cam_gray_rgbs)], [3 2 1]);
pix = reshape(pix, [6 4 3]);
pix = imrotate(pix, -90);
pix = flipdim(pix,2);
figure;
image(pix);
title('original camera patch RGB');

% visualize the linearized camera RGBs
pix = permute([cam_rss fliplr(cam_gray_rss)], [3 2 1]);
pix = reshape(pix, [6 4 3]);
pix = imrotate(pix, -90);
pix = flipdim(pix,2);
figure;
image(pix);
title('linearized camera patch RGBs');

%% step 9

% use the munki-measured ColorChecker XYZs and camera-captured RGB RSs to
% derive a 3x3 matrix that can be used to estimate XYZs from camera RGBs
cam_matrix3x3 = munki_xyzs * pinv([cam_rss fliplr(cam_gray_rss)]);

disp(cam_matrix3x3);

%% step 10

% estimate the ColorChecker XYZs from the linearized camera rgbs using
% the 3x3 camera matrix
cam_xyzs = cam_matrix3x3 * [cam_rss fliplr(cam_gray_rss)];

disp(cam_xyzs);

%% step 11

% use XYZ2Lab function to calculate Lab values from the estimated XYZ 
% values 
cie.cmf2deg = load("CIE_2Deg_380-780-5nm.txt");  
cie.cmf2deg = cie.cmf2deg(:,2:4);
cie.illD50 = load("CIE_IllD50_380-780-5nm.txt");
cie.illD50 = cie.illD50(:,2);
cie.illE = ones(81,1);

XYZn = ref2XYZ(cie.illE,cie.cmf2deg,cie.illD50);
cam_labs = XYZ2Lab(cam_xyzs,XYZn);

% calculate DeltaEab color differences between these estimated Lab values 
% and the measured Lab values in the “munki_Labs” variable
delta_eab = deltaEab(cam_labs, munki_labs);

% call print_camera_model_table function supplied in the resources to print 
% a table
print_camera_model_table(munki_labs, cam_labs, delta_eab);

%% step 12

% split the radiometric scalars (cam_RSs) into r,g,b vectors
rsrgbs = [cam_rss fliplr(cam_gray_rss)];
rsrs = rsrgbs(1,:);
rsgs = rsrgbs(2,:);
rsbs = rsrgbs(3,:);

% create vectors of these RSs with multiplicative terms to
% represent interactions and square terms to represent non-linearities in
% the RGB-to-XYZ relationship
rsrgbs_extd = [rsrgbs; rsrs.*rsgs; rsrs.*rsbs; rsgs.*rsbs; rsrs.*rsgs.*rsbs; ...
rsrs.^2; rsgs.^2; rsbs.^2; ones(1,size(rsrgbs,2))];

% find the extended (3x11) matrix that relates the RS and XYZ datasets
cam_matrix3x11 = munki_xyzs * pinv(rsrgbs_extd);

disp(cam_matrix3x11);

%% step 13

cam_extd_xyzs = cam_matrix3x11 * rsrgbs_extd;

disp(cam_extd_xyzs);

%% step 14

% use the XYZ2Lab function to calculate Lab values from the estimated XYZ 
% values  
cam_extd_labs = XYZ2Lab(cam_extd_xyzs,XYZn);

% calculate DeltaE color differences between these estimated Lab values and 
% the measured Lab values provided in the file “munki_CC_XYZs_Labs.txt”
extd_delta_eab = deltaEab(cam_extd_labs, munki_labs);

% use the print_extended_camera_model_table function provided in the 
% resources to print a table like the one shown below. The min, max, and 
% mean differences should all be smaller than the ones you calculated in 
% step 11
print_extended_camera_model_table(munki_labs, cam_extd_labs, extd_delta_eab);

%% step 15

% save the (extended) camera model for use in later projects
save('cam_model.mat', 'cam_polys', 'cam_matrix3x11');

%% step 16

% <include>camRGB2XYZ.m</include>

cam_XYZs = camRGB2XYZ('cam_model.mat', [cam_rgbs fliplr(cam_gray_rgbs)]);

disp(cam_XYZs);


%% step 17

XYZ_D50 = XYZn;

cie.illD65 = load("CIE_IllD65_380-780-5nm.txt");
cie.illD65 = cie.illD65(:,2);
XYZ_D65 = ref2XYZ(cie.illE,cie.cmf2deg,cie.illD65);

% visualize the munki-measured XYZs as an sRGB image
munki_XYZs_D65 = catBradford(munki_xyzs, XYZ_D50, XYZ_D65);
munki_XYZs_sRGBs = XYZ2sRGB(munki_XYZs_D65);
pix = reshape(munki_XYZs_sRGBs', [6 4 3]);
pix = uint8(pix*255);
pix = imrotate(pix, -90);
pix = flipdim(pix,2);
figure;
image(pix);
title('munki XYZs chromatically adapted and visualized in sRGB');

% visualize the camera-estimated XYZs as an sRGB image
cam_XYZs_D65 = catBradford(cam_xyzs, XYZ_D50, XYZ_D65);
cam_XYZs_sRGBs = XYZ2sRGB(cam_XYZs_D65);
pix = reshape(cam_XYZs_sRGBs', [6 4 3]);
pix = uint8(pix*255);
pix = imrotate(pix, -90);
pix = flipdim(pix,2);
figure;
image(pix);
title('estimated XYZs chromatically adapted and visualized in sRGB');

%% step 18
%
% who did what parts of the project:
%
% * step 3 - Kevin
% * step 4 - Kevin
% * step 5 - Kevin
% * step 6 - Kevin
% * step 7 - Kevin
% * step 8 - Kevin
% * step 9 - Kevin
% * step 10 - Kevin
% * step 11 - Molly
% * step 12 - Kevin
% * step 13 - Kevin
% * step 14 - Molly
% * step 15 - Kevin
% * step 16 - Molly
% * step 17 - Molly
% * step 18 - Kevin and Molly
%
% any problems you had with the project:
%
% 
%
% any parts of the project you thought were valuable:
%
%  
%
% any improvements you’d like to see:
%
%  
%