% load the CIE observer and illuminant data
% define ColorMunki/Argyll/spotread measurement wavelengths
cm_lams = 380:10:730;

% define header offsets for reading the .sp files
cm_h_offset = 19;

% load and normalize the measured spectral data for the patch #1
data = importdata('28.1_real.sp', ' ', cm_h_offset);
p28_1.real = data.data/100;
data = importdata('28.1_imaged.sp', ' ', cm_h_offset);
p28_1.imaged = data.data/100;
data = importdata('28.1_matching.sp', ' ', cm_h_offset);
p28_1.matching = data.data/100;

% repeat the section above for patch #2
data = importdata('28.2_real.sp', ' ', cm_h_offset);
p28_2.real = data.data/100;
data = importdata('28.2_imaged.sp', ' ', cm_h_offset);
p28_2.imaged = data.data/100;
data = importdata('28.2_matching.sp', ' ', cm_h_offset);
p28_2.matching = data.data/100;

% interpolate for patch #1
p28_1.interp_real = interp1(380:10:730,p28_1.real,cie.lambda(:),'linear','extrap');
p28_1.interp_imaged = interp1(380:10:730,p28_1.imaged,cie.lambda(:),'linear','extrap');
p28_1.interp_matching = interp1(380:10:730,p28_1.matching,cie.lambda(:),'linear','extrap');

% repeat the section above for patch #2
p28_2.interp_real = interp1(380:10:730,p28_2.real,cie.lambda(:),'linear','extrap');
p28_2.interp_imaged = interp1(380:10:730,p28_2.imaged,cie.lambda(:),'linear','extrap');
p28_2.interp_matching = interp1(380:10:730,p28_2.matching,cie.lambda(:),'linear','extrap');
