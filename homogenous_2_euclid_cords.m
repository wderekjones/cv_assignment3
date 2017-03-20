function x_euc = homogenous_2_euclid_cords(points)
    x_euc = points;
    x_euc(:,1) = points(:,1) ./ points(:,3);
    x_euc(:,2) = points(:,2) ./ points(:,3);
    x_euc = x_euc(:,1:2);
end