%% Project 3 Report
% Authors: Molly Feldmann and Kevin Arnett
%
% Team: 13
%
%% Step 2: LoadCIEData - Function
%
% <include>loadCIEdata.m</include>
%
%% Step 3: Blackbody - Function
%
% <include>plot_cie_data.m</include>
%
%% Step 3: Blackbody - Graphs
%
% <<ill.PNG>>
% 
% <<cie.PNG>>
%
%% Step 4: XYZ Trisimulus Values - Function
%
% <include>ref2XYZ.m</include>
%
%% Step 5: ColorChecker Tristimulus Values - Results
%
%   >> for num = 1:24
%   CC_XYZs(:,num)=ref2XYZ(cie.checker(:,num),cie.cmf2deg,cie.illD65);
%   end
%
%   >> CC_XYZs
%
%   CC_XYZs =
%
%       Columns 1 through 7
%
%       11.5145   39.1346   18.3488   11.1492   25.8437   31.7110   37.1457   
%       10.3819   36.5981   19.6332   13.8551   24.3868   43.8600   29.5592   
%       7.1502   27.0564   35.6470    7.4267   45.6142   44.8778    6.5006   
%
%       Columns 8 through 14
%
%       13.8627   29.1328    8.5889   33.9174   46.1864    8.9183   15.0353      
%       12.3179   19.8475    6.4569   44.1533   42.4957    6.4177   24.1079   
%       39.3093   14.9941   15.4745   11.4297    8.6771   32.2736    9.6379    
%
%       Columns 15 through 21
%
%       19.3447   55.8457   29.6768   14.4138   87.8402   57.9621   35.2286   
%       11.3576   58.9726   19.3515   19.9750   92.3781   61.0426   37.0414   
%       5.5526    9.6411   32.2626   39.0008   95.6125   65.4909    40.2256   
%
%       Columns 22 through 24
%
%       19.3492    8.7646    3.2111
%       20.4708    9.2915    3.3763
%       22.1545   10.3188    3.9312
%
%% Step 6: X,Y Chromaticity Coordinates - Function
%
% <include>XYZ2xyY.m</include>
%
%% Step 7: x,y Chromaticity Coordinates for ColorChecker chart - Results
%
%   >> CC_xyYs=XYZ2xyY(CC_XYZs)
%   
%   CC_xyYs =
%   
%       Columns 1 through 7
%
%       0.3964    0.3807    0.2492    0.3438    0.2696    0.2633    0.5074    
%       0.3574    0.3561    0.2667    0.4272    0.2544    0.3641    0.4038    
%       10.3819   36.5981   19.6332   13.8551   24.3868   43.8600   29.5592   
%       
%       Columns 8 through 14
%
%       0.2117    0.4554    0.2814    0.3790    0.4744    0.1873    0.3082    
%       0.1881    0.3102    0.2116    0.4933    0.4365    0.1348    0.4942    
%       12.3179   19.8475    6.4569   44.1533   42.4957    6.4177   24.1079   
%       
%       Columns 15 through 21
%       
%       0.5336    0.4487    0.3651    0.1964    0.3185    0.3142    0.3132
%       0.3133    0.4738    0.2381    0.2722    0.3349    0.3309    0.3293    
%       11.3576   58.9726   19.3515   19.9750   92.3781   61.0426  37.0414   
%       
%       Columns 22 through 24
%       
%       0.3122    0.3089    0.3053
%       0.3303    0.3275    0.3210
%       20.4708    9.2915    3.3763
%
%% Step 8: Interpolated Color Patch Data - Loading Function
%
% <include>loadPatchdata.m</include>
%
%% Step 9: Interpolated Color Patch Data - Plotting Function
%
% <include>plot_patch_data.m</include>
%
%% Step 9: Interpolated Color Patch Data - Graphs
%
% <<patch1.PNG>>
% 
% <<patch2.PNG>>
% 
%% Step 10: Measured and Calculated Tristimulus Values for Color Patch Data - Function
%
% <include>patches_tristimulus_values_table.m</include>
%
%% Step 10: Measured and Calculated Tristimulus Values for Color Patch Data - Results
%
%   Measured and calculated tristimulus values
%   
%                                  patch 28.1
%                      measured                 calculated
%                X        Y        Z        X        Y        Z
%       real  33.5105  37.4668  22.3492  33.5174  37.4558  22.3734 
%     imaged  30.6663  33.8695  20.0319  30.6668  33.8586  20.0524 
%   matching  40.5269  42.5106  23.0918  40.5229  42.5021  23.1087 
%   
%                                  patch 28.2
%                      measured                 calculated
%                X        Y        Z        X        Y        Z
%       real  27.5838  30.1686  20.7248  27.5781  30.1587  20.7281 
%     imaged  23.5066  25.6810  17.4180  23.5086  25.6753  17.4356 
%   matching  29.5487  31.1759  16.7052  29.5469  31.1693  16.7208 
% 
%% Step 11: Measured and Calculated Chromaticity Coordinates for Color Patch Data - Function
%
% <include>patches_chromaticity_coordinates_table.m</include>
%
%% Step 11: Measured and Calculated Chromaticity Coordinates for Color Patch Data - Results
%
%   Measured and calculated chromaticity coordinates
%   
%                              patch 28.1
%                    measured               calculated
%               x       y       Y       x       y       Y
%       real  0.3591  0.4015  37.4668  0.3591  0.4013  37.4558 
%     imaged  0.3626  0.4005  33.8695  0.3626  0.4003  33.8586 
%   matching  0.3819  0.4006  42.5106  0.3818  0.4005  42.5021 
%   
%                              patch 28.2
%                    measured               calculated
%               x       y       Y       x       y       Y
%       real  0.3515  0.3844  30.1686  0.3515  0.3844  30.1587 
%     imaged  0.3529  0.3856  25.6810  0.3529  0.3854  25.6753 
%   matching  0.3816  0.4026  31.1759  0.3816  0.4025  31.1693 
%
%% Step 12: Chromaticity Diagram for Color Patch Data - Function
%
% <include>plot_chrom_diag.m</include>
%
%% Step 12: Chromaticity Diagram for Color Patch Data - Graph
%
% <<patches_chrom_coord.PNG>>
%
%% Step 13: Feedback
%
% Who did what parts of the project:
%
% * Kevin - Step 2
% * Kevin - Step 3
% * Molly - Step 4
% * Kevin - Step 5
% * Molly - Step 6
% * Molly - Step 7
% * Kevin - Step 8
% * Kevin - Step 9
% * Molly - Step 10
% * Molly - Step 11
% * Molly - Step 12
% * Molly - Step 13
% 
% Any problems you had with the project:
%
% * Unclear where certain variables were supposed to come from
% * Not knowing that publishing needed to be a separate file from all the
% other files/steps
% 
% Any parts of the project you thought were valuable:
%
% * Learning how to create and edit graphs
% * Learning how to set up functions and call other functions
 
