% INPUT:
% ‘refs’ an (nx1) vector of reflectance factor data
% ‘cmfs’ an (nx3) set of CIE color matching functions
% ‘illum’ an (nx1) spectral power distribution of a light source
%
% OUTPUT:
% ‘XYZ’ a (3x1) vector of CIE XYZ tristimulus values
%
function XYZ = ref2XYZ(refs, cmfs, illum)

% initialize vector (3x1)
XYZ = zeros(3,1);

% calculate k value in equation: k = 100/sum(y_bar * Spectral)dLambda
% use for loop to calculate summation
sum = 0;
for n = 1:length(cmfs)
    sum = sum + (cmfs(n,2)*illum(n));
end
k = 100/sum;

% calculate X value in equation: X = k * sum(x_bar * Spectral * Reflectance)dLambda
% use for loop to calculate summation
sum = 0;
for n = 1:length(cmfs)
    sum = sum + (cmfs(n,1)*illum(n)*refs(n));
end
XYZ(1,1) = k*sum;

% calculate Y value in equation: Y = k * sum(y_bar * Spectral * Reflectance)dLambda
% use for loop to calculate summation
sum = 0;
for n = 1:length(cmfs)
    sum = sum + (cmfs(n,2)*illum(n)*refs(n));
end
XYZ(2,1) = k*sum;

% calculate Z value in equation: Z = k * sum(z_bar * Spectral * Reflectance)dLambda
% use for loop to calculate summation
sum = 0;
for n = 1:length(cmfs)
    sum = sum + (cmfs(n,3)*illum(n)*refs(n));
end
XYZ(3,1) = k*sum;

end