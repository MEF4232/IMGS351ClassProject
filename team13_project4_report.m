%% Project 4 Report
% Molly Feldmann & Kevin Arnett, Team 13
%
%% Step 2: Modified ref2XYZ Function
%
% <include>ref2XYZ.m</include>
%
%% Step 3: Test Modified ref2XYZ Function
%
%   cie = loadCIEdata;
%   CC_spectra = load('ColorChecker_380-780-5nm.txt');
%   CC_XYZs = ref2XYZ(CC_spectra(:,2:25),cie.cmf2deg,cie.illD65)
%
%   CC_XYZs =
%
%   Columns 1 through 7
%
%   11.5145   39.1346   18.3488   11.1492   25.8437   31.7110   37.1457   
%   10.3819   36.5981   19.6332   13.8551   24.3868   43.8600   29.5592  
%    7.1502   27.0564   35.6470    7.4267   45.6142   44.8778    6.5006   
%
%   Columns 8 through 14
%
%   13.8627   29.1328    8.5889   33.9174   46.1864    8.9183   15.0353
%   12.3179   19.8475    6.4569   44.1533   42.4957    6.4177   24.1079
%   39.3093   14.9941   15.4745   11.4297    8.6771   32.2736    9.6379
%
%   Columns 15 through 21
%
%	19.3447   55.8457   29.6768   14.4138   87.8402   57.9621   35.2286   
%   11.3576   58.9726   19.3515   19.9750   92.3781   61.0426   37.0414   
%   5.5526    9.6411    32.2626   39.0008   95.6125   65.4909   40.2256   
%
%   Columns 22 through 24
%
%   19.3492    8.7646    3.2111
%   20.4708    9.2915    3.3763
%   22.1545   10.3188    3.9312
%
%% Step 4: XYZ2Lab Function
%
% <include>XYZ2Lab.m</include>
%
%% Step 5: Test XYZ2Lab Function
%
%   >> print_XYZ2Lab(false)
%
%   ColorChecker XYZ and Lab values (D65 illuminant and 2deg. observer)
% 
%   Patch #    X       Y      Z       L*      a*      b*    Patch Nmae
%      1  11.515  10.382  7.150  38.519  12.410  13.309  Dark Skin
%      2  39.135  36.598  27.056  66.974  14.329  17.320  Light Skin
%      3  18.349  19.633  35.647  51.420  -1.624  -21.603  Blue Sky
%      4  11.149  13.855  7.427  44.024  -13.963  21.774  Foliage
%      5  25.844  24.387  45.614  56.473  11.544  -24.698  Blue Flower
%      6  31.711  43.860  44.878  72.135  -33.101  3.115  Bluish Green
%      7  37.146  29.559  6.501  61.272  32.497  55.059  Orange
%      8  13.863  12.318  39.309  41.717  14.416  -42.900  Purplish Blue
%      9  29.133  19.847  14.994  51.664  45.468  13.382  Moderate Red
%      10  8.589  6.457  15.474  30.537  23.785  -24.136  Purple
%      11  33.917  44.153  11.430  72.331  -26.083  57.948  Yellow Green
%      12  46.186  42.496  8.677  71.211  17.187  64.297  Orange Yellow
%      13  8.918  6.418  32.274  30.443  27.024  -53.277  Blue
%      14  15.035  24.108  9.638  56.196  -40.771  35.342  Green
%      15  19.345  11.358  5.553  40.176  51.976  22.689  Red
%      16  55.846  58.973  9.641  81.277  -0.508  78.575  Yellow
%      17  29.677  19.352  32.263  51.096  50.004  -17.653  Magenta
%      18  14.414  19.975  39.001  51.809  -25.642  -25.126  Cyan
%      19  87.840  92.378  95.613  96.975  0.076  3.262  White
%      20  57.962  61.043  65.491  82.402  -0.133  0.831  Neutral 8
%      21  35.229  37.041  40.226  67.308  0.079  0.125  Neutral  6.5
%      22  19.349  20.471  22.154  52.365  -0.541  0.237  Neutral 5
%      23  8.765  9.291  10.319  36.540  -0.568  -0.600  Neutral 3.5
%      24  3.211  3.376  3.931  21.492  0.035  -1.462  Black
%
%% Step 6: Modified ColorChecker Spectra Function
%
% <include>print_XYZ2Lab.m</include>
%
%% Step 6: Test Modified ColorChecker Spectra
%
%   >> print_XYZ2Lab(true)
%
%   ColorChecker(Dark) XYZ and Lab values (D65 illuminant and 2deg. 
%   observer)
%
%   Patch #   X      Y      Z      L*     a*     b*    Patch Nmae
%      1  0.230  0.208  0.143  1.876  1.350  1.188  Dark Skin
%      2  0.783  0.732  0.541  6.612  3.565  3.659  Light Skin
%      3  0.367  0.393  0.713  3.547  -0.255  -4.082  Blue Sky
%      4  0.223  0.277  0.149  2.503  -1.654  2.191  Foliage
%      5  0.517  0.488  0.912  4.406  2.184  -5.453  Blue Flower
%      6  0.634  0.877  0.898  7.924  -8.173  0.823  Bluish Green
%      7  0.743  0.591  0.130  5.340  7.416  7.347  Orange
%      8  0.277  0.246  0.786  2.225  1.766  -7.409  Purplish Blue
%      9  0.583  0.397  0.300  3.586  8.414  1.893  Moderate Red
%      10  0.172  0.129  0.309  1.166  2.009  -2.416  Purple
%      11  0.678  0.883  0.229  7.977  -6.593  10.483  Yellow Green
%      12  0.924  0.850  0.174  7.677  4.646  10.754  Orange Yellow
%      13  0.178  0.128  0.645  1.159  2.309  -7.234  Blue
%      14  0.301  0.482  0.193  4.355  -6.454  4.752  Green
%      15  0.387  0.227  0.111  2.052  7.005  1.949  Red
%      16  1.117  1.179  0.193  10.405  -0.138  15.181  Yellow
%      17  0.594  0.387  0.645  3.496  9.246  -3.202  Magenta
%      18  0.288  0.399  0.780  3.609  -3.745  -4.935  Cyan
%      19  1.757  1.848  1.912  14.666  0.021  0.885  White
%      20  1.159  1.221  1.310  10.710  -0.036  0.226  Neutral 8
%      21  0.705  0.741  0.805  6.692  0.019  0.030  Neutral  6.5
%      22  0.387  0.409  0.443  3.698  -0.088  0.038  Neutral 5
%      23  0.175  0.186  0.206  1.679  -0.054  -0.058  Neutral 3.5
%      24  0.064  0.068  0.079  0.610  0.002  -0.073  Black
%
%% Step 7: deltaEab Function
%
% <include>deltaEab.m</include>
%
%% Step 8: Test deltaEab Function
%
%   ColorChecker and MetaChecker color differences
%
%   patch #  DEab(D65)  DEab(illA)
%      1       2.597e-07        22.636
%      2       1.136e-07        22.178
%      3       1.056e-07        32.275
%      4       1.905e-07        28.232
%      5       3.980e-07        25.937
%      6       1.326e-07        29.487
%      7       8.581e-08        17.309
%      8       1.454e-07        27.241
%      9       1.665e-07        12.210
%      10       2.907e-07        19.509
%      11       1.561e-07        22.623
%      12       1.305e-07        16.970
%      13       1.083e-07        20.083
%      14       1.193e-07        26.099
%      15       6.708e-08        7.053
%      16       1.330e-07        11.532
%      17       6.468e-09        10.690
%      18       8.581e-08        31.619
%      19       2.661e-07        2.545
%      20       6.948e-08        15.940
%      21       1.846e-07        28.926
%      22       8.337e-08        26.751
%      23       3.668e-07        20.574
%      24       1.022e-07        18.567
%
%% Step 9: Calculate CIELab Values and Color Differences Function
%
% <include>CIELab_patches.m</include>
%
%% Step 9: Test CIELab Values and Color Differences Function
%
%   >> CIELab_patches(true)
%
%   Calculated XYZ, Lab, deltaE values (w.r.t real patches)
%   
%                                     patch 28.1
%          		 X        Y        Z        L        a        b        dEab
%   real	   33.517   37.456   22.373   67.618   -8.855   14.727   
%   imaged	   30.667   33.859   20.052   64.850   -7.190   14.596   3.232
%   matching   40.523   42.502   23.109   71.216   -1.403   19.528   9.567
%   
%                                     patch 28.2
%          		 X        Y        Z        L        a        b        dEab
%   real	   27.578   30.159   20.728   61.791   -5.870   7.935   
%   imaged	   23.509   25.675   17.436   57.728   -5.429   7.999   4.088
%   matching   29.547   31.169   16.721   62.650   -1.914   18.137   10.976
%
%% Step 10: Graphing Color Differences between Real, Imaged, and Matching Patches Function
%
% <include>plot_color_diff.m</include>
%
%% Step 10: Color Differences between Real, Imaged, and Matching Patches Graph
%
% <<plot_color_diff.PNG>>
%
%% Step 11: Feedback
% 
% Who did what parts of the project
%
% * Kevin - Step 2
% * Kevin - Step 3
% * Kevin - Step 4
% * Kevin - Step 5
% * Kevin - Step 6
% * Kevin - Step 7
% * Molly - Step 8
% * Molly - Step 9
% * Molly - Step 10
% * Molly - Step 11
