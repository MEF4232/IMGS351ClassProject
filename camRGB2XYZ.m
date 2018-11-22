function cam_XYZs = camRGB2XYZ(cam_model_file, cam_rgbs)
% Take as input your ‘cam_model.mat’ and ‘cam_RGBs’ a 3xn vector of camera-
% captured RGBs_{0-255} and returns ‘cam_XYZs’ a 3xn vector of 
% model-estimated XYZs. This function can be developed from parts of the 
% code shown in steps 6), 12), and 13). In particular, note that since you 
% are using the extended 3x11 matrix, you will need to do something akin to 
% step 12a) to create an RSrgbs_extd dataset when using the matrix to 
% estimate XYZs.

load(cam_model_file);

% -------------------------------------------------------------------------
% step 6

r = 1; g = 2; b = 3;

% b) use the functions to linearize the camera data
cam_rss(r,:) = polyval(cam_polys(r,:),cam_rgbs(r,:));
cam_rss(g,:) = polyval(cam_polys(g,:),cam_rgbs(g,:));
cam_rss(b,:) = polyval(cam_polys(b,:),cam_rgbs(b,:));

% c) clip out of range values
cam_rss(cam_rss<0) = 0;
cam_rss(cam_rss>1) = 1;

% -------------------------------------------------------------------------
% step 12

% split the radiometric scalars (cam_RSs) into r,g,b vectors
rsrgbs = cam_rss;
rsrs = rsrgbs(1,:);
rsgs = rsrgbs(2,:);
rsbs = rsrgbs(3,:);

% create vectors of these RSs with multiplicative terms to
% represent interactions and square terms to represent non-linearities in
% the RGB-to-XYZ relationship
rsrgbs_extd = [rsrgbs; rsrs.*rsgs; rsrs.*rsbs; rsgs.*rsbs; rsrs.*rsgs.*rsbs; ...
rsrs.^2; rsgs.^2; rsbs.^2; ones(1,size(rsrgbs,2))];

% -------------------------------------------------------------------------
% step 13

cam_XYZs = cam_matrix3x11 * rsrgbs_extd;

end