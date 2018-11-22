% INPUT:
% ‘XYZ’ a (3xn) vector of XYZ tristimulus values
%
% OUTPUT:
% ‘xyY’ a (3xn) vector of chromaticity coordinates (x,y) and luminance factor
%
function xyY = XYZ2xyY(XYZ)

% initialize output to same size as input
xyY = zeros(size(XYZ));
[r,c] = size(XYZ);

for n = 1:c
    % x = X/(X+Y+Z)
    xyY(1,n) = XYZ(1,n)/(XYZ(1,n)+XYZ(2,n)+XYZ(3,n));
    
    % y = Y/(X+Y+Z)
    xyY(2,n) = XYZ(2,n)/(XYZ(1,n)+XYZ(2,n)+XYZ(3,n));
    
    % luminance factor remains the same
    xyY(3,n) = XYZ(2,n);
end

end