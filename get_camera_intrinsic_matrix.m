function R_e = get_camera_intrinsic_matrix(M_estimate)
    [R_e, Q_e] = rq(M_estimate);
end