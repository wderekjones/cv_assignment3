function cc = compute_camera_center(M)
    m4 = M(:,4);
    Q = M(:,1:3);
    cc = -(inv(Q))*m4;
end