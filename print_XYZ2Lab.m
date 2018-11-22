function print_XYZ2Lab(dark)
% load the CIE data into a structure
cie = loadCIEdata;

% compute the XYZ values of D65 for XYZn in XYZ2Lab
CC_spectra = load('ColorChecker_380-780-5nm.txt');

if (dark == true)
    CC_spectra = CC_spectra.*(.02);
end

CC_XYZs = ref2XYZ(CC_spectra(:,2:25),cie.cmf2deg,cie.illD65);

% compute the XYZ values of D65 for XYZn in XYZ2Lab
XYZn_D65 = ref2XYZ(cie.illE,cie.cmf2deg,cie.illD65);

% calculate the Lab values
CC_Labs = XYZ2Lab(CC_XYZs,XYZn_D65);

% read in the names of the ColorChecker patches
names = textread('ColorChecker_names.txt','%s','delimiter','|');

% print the formatted table
% header
if (not(dark))
    fprintf("ColorChecker XYZ and Lab values (D65 illuminant and 2"...
        + "deg. observer)\n");
    fprintf("Patch #    X       Y      Z       "...
        + "L*      a*      b*    Patch Nmae\n");
else
    fprintf("ColorChecker(Dark) XYZ and Lab values (D65 illuminant and 2"...
        + "deg. observer)\n");
    fprintf("Patch #   X      Y      Z      "...
        + "L*     a*     b*    Patch Nmae\n"); 
end 

% loop to print the patch values
for n=1:size(CC_Labs,2)
    fprintf("      %i  %.3f  %.3f  %.3f  %.3f  %.3f  %.3f  %s\n",...
        n,...
        CC_XYZs(1,n),...
        CC_XYZs(2,n),...
        CC_XYZs(3,n),...
        CC_Labs(1,n),...
        CC_Labs(2,n),...
        CC_Labs(3,n),...
        names{n}...
    );
end