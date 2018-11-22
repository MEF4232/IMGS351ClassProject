function [DEab] = deltaEab(Lab1,Lab2)

    [r, c] = size(Lab1);
    DEab = zeros(1,c);
    
    for n = 1:c   
        DEab(1,n) = sqrt(...
            (Lab2(1,n) - Lab1(1,n))^(2) +...
            (Lab2(2,n) - Lab1(2,n))^(2) +...
            (Lab2(3,n) - Lab1(3,n))^(2)...
            );
    end

end 