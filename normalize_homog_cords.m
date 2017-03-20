function x_hom_norm = normalize_homog_cords(points)
    x_hom_norm = points;
    for i = 1:3
        x_hom_norm(:,i) = points(:,i) ./ points(:,3);
    end
end