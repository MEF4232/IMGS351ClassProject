plot_chrom_diag_skel;

title('chromaticity coordinates of 28.1 and 28.2 patches');

r1 = plot(C28_1_xyY.real(1,:),C28_1_xyY.real(2,:),'sr');
i1 = plot(C28_1_xyY.imaged(1,:),C28_1_xyY.imaged(2,:),'dr');
m1 = plot(C28_1_xyY.matching(1,:),C28_1_xyY.matching(2,:),'+r');
r2 = plot(C28_2_xyY.real(1,:),C28_2_xyY.real(2,:),'sb');
i2 = plot(C28_2_xyY.imaged(1,:),C28_2_xyY.imaged(2,:),'db');
m2 = plot(C28_2_xyY.matching(1,:),C28_2_xyY.matching(2,:),'+b');


legend([r1 i1 m1 r2 i2 m2],{'28.1 real','28.1 imaged','28.1 matching','28.2 real','28.2 imaged','28.2 matching'});