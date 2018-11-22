function [Color_Diff_Patches] = CIELab_patches(print)
% Use your XYZ2Lab and deltaEab functions to calculate CIELab values and
% color differences for your real, imaged and matching color patches.

XYZ_281 = load("Calculated_Patch_281_Tristimulus_Values.txt");
XYZ_282 = load("Calculated_Patch_282_Tristimulus_Values.txt");

XYZ_281_real = XYZ_281(:,1);
XYZ_281_imaged = XYZ_281(:,2);
XYZ_281_matching = XYZ_281(:,3);

XYZ_282_real = XYZ_282(:,1);
XYZ_282_imaged = XYZ_282(:,2);
XYZ_282_matching = XYZ_282(:,3);

% Calculate the CIELab values of your patches from the XYZ values.
% Reference illuminant XYZn should be D50

cie = loadCIEdata;
XYZn_D50 = ref2XYZ(cie.illE,cie.cmf2deg,cie.illD50);

Lab_281_real = XYZ2Lab(XYZ_281_real,XYZn_D50);
Lab_281_imaged = XYZ2Lab(XYZ_281_imaged,XYZn_D50);
Lab_281_matching = XYZ2Lab(XYZ_281_matching,XYZn_D50);

Lab_282_real = XYZ2Lab(XYZ_282_real,XYZn_D50);
Lab_282_imaged = XYZ2Lab(XYZ_282_imaged,XYZn_D50);
Lab_282_matching = XYZ2Lab(XYZ_282_matching,XYZn_D50);

% Calculate color differences between each of the real patches and their 
% corresponding imaged and matched patches. 

Eab_281_real_v_imaged = deltaEab(Lab_281_real,Lab_281_imaged);
Eab_281_real_v_matching = deltaEab(Lab_281_real,Lab_281_matching);

Eab_282_real_v_imaged = deltaEab(Lab_282_real,Lab_282_imaged);
Eab_282_real_v_matching = deltaEab(Lab_282_real,Lab_282_matching);

% Summarize the calculated XYZ and Lab values for your patches and the 
% ?Eab color differences between the real patches and the corresponding 
% imaged and matched patches.

if(print == true)
    disp("Calculated XYZ, Lab, deltaE values (w.r.t real patches)");

    fprintf("\n                                  patch 28.1");
    fprintf("\n       \t\t %s        %s        %s        %s        %s        %s        %s",...
        "X", "Y", "Z", "L", "a", "b", "dEab");
    fprintf("\n%s\t   %.3f   %.3f   %.3f   %.3f   %.3f   %.3f   %.3f",...
        "real",...
        XYZ_281_real',...
        Lab_281_real'...
        );
    fprintf("\n%s\t   %.3f   %.3f   %.3f   %.3f   %.3f   %.3f   %.3f",...
        "imaged",...
        XYZ_281_imaged',...
        Lab_281_imaged',...
        Eab_281_real_v_imaged...
        );
    fprintf("\n%s   %.3f   %.3f   %.3f   %.3f   %.3f   %.3f   %.3f",...
        "matching",...
        XYZ_281_matching',...
        Lab_281_matching',...
        Eab_281_real_v_matching...
        );


    fprintf("\n\n                                  patch 28.2");
    fprintf("\n       \t\t %s        %s        %s        %s        %s        %s        %s",...
        "X", "Y", "Z", "L", "a", "b", "dEab");
    fprintf("\n%s\t   %.3f   %.3f   %.3f   %.3f   %.3f   %.3f   %.3f",...
        "real",...
        XYZ_282_real',...
        Lab_282_real'...
        );
    fprintf("\n%s\t   %.3f   %.3f   %.3f   %.3f   %.3f   %.3f   %.3f",...
        "imaged",...
        XYZ_282_imaged',...
        Lab_282_imaged',...
        Eab_282_real_v_imaged...
        );
    fprintf("\n%s   %.3f   %.3f   %.3f   %.3f   %.3f   %.3f   %.3f\n\n",...
        "matching",...
        XYZ_282_matching',...
        Lab_282_matching',...
        Eab_282_real_v_matching...
        );

else 
    % return color differences for graph
    Color_Diff_Patches = cat(1, cat(1, cat(2, Lab_281_real', 0), cat(2, Lab_281_imaged', Eab_281_real_v_imaged), cat(2, Lab_281_matching', Eab_281_real_v_matching)), cat(1, cat(2, Lab_282_real', 0), cat(2, Lab_282_imaged', Eab_282_real_v_imaged), cat(2, Lab_282_matching', Eab_282_real_v_matching)));

end
