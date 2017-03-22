function inliers = evaluate_fundamental_matrix(F,epsilon,points_1,points_2)
    inlier_count = 0;
    inliers =[];
    for i = 1:size(points_1,1)
        x = euclid_2_homogenous_cords(points_1(i,:));
        % compute the epipolar line
        e_p = x*F;
        % normalize the epipolar line
        e_p = normalize_epi_line(e_p);
        
        for j = 1:size(points_2,1)
            x2 = points_2(j,:);
            x2 = euclid_2_homogenous_cords(x2);
            d = dot(e_p,x2);
            if abs(d) < epsilon
                if min(ismember([points_1(i,:) points_2(j,:)],inliers)) == 0
                    inlier_count = inlier_count + 1;
                    inliers(inlier_count,:) = [points_1(i,:) points_2(j,:)];
                end
            end
        end
    end
end