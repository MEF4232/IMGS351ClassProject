function [Lab] = XYZ2Lab(XYZ,XYZn)

    Lab = zeros(size(XYZ));
    [r,c] = size(XYZ);

    for n = 1:c
        Lab(1,n) = 116*fofx(XYZ(2,n)/XYZn(2,1))-16;
        Lab(2,n) = 500*(...
            fofx(XYZ(1,n)/XYZn(1,1)) - ...
            fofx(XYZ(2,n)/XYZn(2,1))...
            );
        Lab(3,n) = 200*(...
            fofx(XYZ(2,n)/XYZn(2,1)) - ...
            fofx(XYZ(3,n)/XYZn(3,1))...
            );
    end 
end

function [f] = fofx(x)
    if (x > 0.008856)
        f = x^(1/3);
    else    
        f = 7.787 * x + 16/116;
    end
end