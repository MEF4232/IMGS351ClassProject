% import data from project 2 files
L28_XYZ.real = importdata('28_XYZ_Labs_real.txt','\t', 3);
L28_XYZ.imaged = importdata('28_XYZ_Labs_imaged.txt','\t', 3);
L28_XYZ.matching = importdata('28_XYZ_Labs_matching.txt','\t', 3);

%%%%%%%%%%%%%%%%%%%%% parsing data 28.1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% parsing data for 28.1 real
L28_1_XYZ.real = split(L28_XYZ.real(2,:));
L28_1_XYZ.real = L28_1_XYZ.real';
L28_1_XYZ.real = str2double(L28_1_XYZ.real(:,2:4));

% parsing data for 28.1 imaged
L28_1_XYZ.imaged = split(L28_XYZ.imaged(2,:));
L28_1_XYZ.imaged = L28_1_XYZ.imaged';
L28_1_XYZ.imaged = str2double(L28_1_XYZ.imaged(:,2:4));

% parsing data for 28.1 matching
L28_1_XYZ.matching = split(L28_XYZ.matching(2,:));
L28_1_XYZ.matching = L28_1_XYZ.matching';
L28_1_XYZ.matching = str2double(L28_1_XYZ.matching(:,2:4));

%%%%%%%%%%%%%%%%%%%%% parsing data 28.2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% parsing data for 28.2 real
L28_2_XYZ.real = split(L28_XYZ.real(3,:));
L28_2_XYZ.real = L28_2_XYZ.real';
L28_2_XYZ.real = str2double(L28_2_XYZ.real(:,2:4));

% parsing data for 28.2 imaged
L28_2_XYZ.imaged = split(L28_XYZ.imaged(3,:));
L28_2_XYZ.imaged = L28_2_XYZ.imaged';
L28_2_XYZ.imaged = str2double(L28_2_XYZ.imaged(:,2:4));

% parsing data for 28.2 matching
L28_2_XYZ.matching = split(L28_XYZ.matching(3,:));
L28_2_XYZ.matching = L28_2_XYZ.matching';
L28_2_XYZ.matching = str2double(L28_2_XYZ.matching(:,2:4));


%%%%%%%%%%%%%%%%%%%%% calculating data %%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% calculating patch 28.1 data
C28_1_XYZ.real = ref2XYZ(p28_1.interp_real, cie.cmf2deg, cie.illD50);
C28_1_XYZ.imaged = ref2XYZ(p28_1.interp_imaged, cie.cmf2deg, cie.illD50);
C28_1_XYZ.matching = ref2XYZ(p28_1.interp_matching, cie.cmf2deg, cie.illD50);

% calculating patch 28.1 data
C28_2_XYZ.real = ref2XYZ(p28_2.interp_real, cie.cmf2deg, cie.illD50);
C28_2_XYZ.imaged = ref2XYZ(p28_2.interp_imaged, cie.cmf2deg, cie.illD50);
C28_2_XYZ.matching = ref2XYZ(p28_2.interp_matching, cie.cmf2deg, cie.illD50);

fprintf("Measured and calculated tristimulus values\n\n");

fprintf("                               patch 28.1\n");
fprintf("                   measured                 calculated\n");
fprintf("             X        Y        Z        X        Y        Z\n");
fprintf("    real ");	fprintf(" %.4f ", L28_1_XYZ.real);      fprintf(" %.4f ", C28_1_XYZ.real);      fprintf("\n");
fprintf("  imaged ");	fprintf(" %.4f ", L28_1_XYZ.imaged);    fprintf(" %.4f ", C28_1_XYZ.imaged);    fprintf("\n");
fprintf("matching ");   fprintf(" %.4f ", L28_1_XYZ.matching);  fprintf(" %.4f ", C28_1_XYZ.matching);  fprintf("\n");

fprintf("\n");

fprintf("                               patch 28.2\n");
fprintf("                   measured                 calculated\n");
fprintf("             X        Y        Z        X        Y        Z\n");
fprintf("    real ");	fprintf(" %.4f ", L28_2_XYZ.real);      fprintf(" %.4f ", C28_2_XYZ.real);      fprintf("\n");
fprintf("  imaged ");	fprintf(" %.4f ", L28_2_XYZ.imaged);    fprintf(" %.4f ", C28_2_XYZ.imaged);    fprintf("\n");
fprintf("matching ");   fprintf(" %.4f ", L28_2_XYZ.matching);  fprintf(" %.4f ", C28_2_XYZ.matching);  fprintf("\n");

