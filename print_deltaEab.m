% load the CIE data into a structure
cie = loadCIEdata;

% compute Lab values for ColorChecker and D65
CC_spectra = load('ColorChecker_380-780-5nm.txt');
CC_XYZs = ref2XYZ(CC_spectra(:,2:25),cie.cmf2deg,cie.illD65);
XYZn_D65 = ref2XYZ(cie.illE,cie.cmf2deg,cie.illD65);
CC_Labs_D65 = XYZ2Lab(CC_XYZs,XYZn_D65);

% compute Lab values for ColorChecker and Ill A
CC_spectra = load('ColorChecker_380-780-5nm.txt');
CC_XYZs = ref2XYZ(CC_spectra(:,2:25),cie.cmf2deg,cie.illA);
XYZn_A = ref2XYZ(cie.illE,cie.cmf2deg,cie.illA);
CC_Labs_A = XYZ2Lab(CC_XYZs,XYZn_A);

% compute Lab values for MetaChecker and D65
MC_spectra = load('MetaChecker_380-780-5nm.txt');
MC_XYZs = ref2XYZ(MC_spectra(:,2:25),cie.cmf2deg,cie.illD65);
XYZn_D65 = ref2XYZ(cie.illE,cie.cmf2deg,cie.illD65);
MC_Labs_D65 = XYZ2Lab(MC_XYZs,XYZn_D65);

% compute Lab values for MetaChecker and Ill A
MC_spectra = load('MetaChecker_380-780-5nm.txt');
MC_XYZs = ref2XYZ(MC_spectra(:,2:25),cie.cmf2deg,cie.illA);
XYZn_A = ref2XYZ(cie.illE,cie.cmf2deg,cie.illA);
MC_Labs_A = XYZ2Lab(MC_XYZs,XYZn_A);

% compute ?Eab color differences between files 
% “ColorChecker_380-780-5nm.txt” and “MetaChecker_380-780-5nm.txt”
% under illuminant D65.

DEab_with_D65 = deltaEab(CC_Labs_D65,MC_Labs_D65);

% compute ?Eab color differences between files 
% “ColorChecker_380-780-5nm.txt” and “MetaChecker_380-780-5nm.txt”
% under illuminant A.

DEab_with_ill_A = deltaEab(CC_Labs_A,MC_Labs_A);

disp("ColorChecker and MetaChecker color differences");
fprintf("    %s  %s  %s\n",...
    "patch #",...
    "DEab(D65)",...
    "DEab(illA)"...
    );

% loop to print the patch values
[r, c] = size(CC_Labs_D65);
for n=1:c
    fprintf("      %i       %.3e        %.3f\n",...
        n,...
        DEab_with_D65(1,n),...
        DEab_with_ill_A(1,n)...
    );
end