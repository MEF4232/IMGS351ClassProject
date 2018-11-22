L28_1_xyY.real = XYZ2xyY(L28_1_XYZ.real');
L28_1_xyY.imaged = XYZ2xyY(L28_1_XYZ.imaged');
L28_1_xyY.matching = XYZ2xyY(L28_1_XYZ.matching');

L28_2_xyY.real = XYZ2xyY(L28_2_XYZ.real');
L28_2_xyY.imaged = XYZ2xyY(L28_2_XYZ.imaged');
L28_2_xyY.matching = XYZ2xyY(L28_2_XYZ.matching');

C28_1_xyY.real = XYZ2xyY(C28_1_XYZ.real);
C28_1_xyY.imaged = XYZ2xyY(C28_1_XYZ.imaged);
C28_1_xyY.matching = XYZ2xyY(C28_1_XYZ.matching);

C28_2_xyY.real = XYZ2xyY(C28_2_XYZ.real);
C28_2_xyY.imaged = XYZ2xyY(C28_2_XYZ.imaged);
C28_2_xyY.matching = XYZ2xyY(C28_2_XYZ.matching);

fprintf("Measured and calculated chromaticity coordinates\n\n");

fprintf("                           patch 28.1\n");
fprintf("                 measured               calculated\n");
fprintf("            x       y       Y       x       y       Y\n");
fprintf("    real ");	fprintf(" %.4f ", L28_1_xyY.real);      fprintf(" %.4f ", C28_1_xyY.real);      fprintf("\n");
fprintf("  imaged ");	fprintf(" %.4f ", L28_1_xyY.imaged);    fprintf(" %.4f ", C28_1_xyY.imaged);    fprintf("\n");
fprintf("matching ");   fprintf(" %.4f ", L28_1_xyY.matching);  fprintf(" %.4f ", C28_1_xyY.matching);  fprintf("\n");

fprintf("\n");

fprintf("                           patch 28.2\n");
fprintf("                 measured               calculated\n");
fprintf("            x       y       Y       x       y       Y\n");
fprintf("    real ");	fprintf(" %.4f ", L28_2_xyY.real);      fprintf(" %.4f ", C28_2_xyY.real);      fprintf("\n");
fprintf("  imaged ");	fprintf(" %.4f ", L28_2_xyY.imaged);    fprintf(" %.4f ", C28_2_xyY.imaged);    fprintf("\n");
fprintf("matching ");   fprintf(" %.4f ", L28_2_xyY.matching);  fprintf(" %.4f ", C28_2_xyY.matching);  fprintf("\n");

