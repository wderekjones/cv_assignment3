function Q_e = get_camera_rotation_matrix(M_estimate)
    [R_e, Q_e] = rq(M_estimate);
    Q_e = Q_e(:,1:3);
end