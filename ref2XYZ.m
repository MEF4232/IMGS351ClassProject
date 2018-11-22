function [XYZ] = ref2XYZ(ref,cmfs,ill)
    k = 100./(cmfs(:,2)'*ill);
    XYZ = k.*cmfs'*diag(ill)*ref;
end