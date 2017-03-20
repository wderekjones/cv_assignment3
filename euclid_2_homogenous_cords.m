function x_hom = euclid_2_homogenous_cords(points)
    x_hom = points;
    x_hom = [x_hom ones(size(x_hom,1),1)];
end