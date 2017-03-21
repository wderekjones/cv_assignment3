function inliers = compute_F_inliers(F,epsilon,points_1,points_2)
inlier_count = 0;
inliers =[];
X = euclid_2_homogenous_cords(points_1);
% compute the epipolar line(s)
E_p = X*F;
% normalize the epipolar line(s)
E_p = normalize_epi_line(E_p);

j=0;
for i = 1:size(points_1,1)
    for j = 1:size(points_2,1)
        x2 = points_2(j,:);
        x2 = euclid_2_homogenous_cords(x2);
        %d = dot(E_p(i,:),x2);%
        d = dot(x2,E_p(i,:));
        if abs(d) < epsilon
            if ~max(ismember([points_1(i,:) points_2(j,:)],inliers))
                inlier_count = inlier_count + 1;
                inliers(inlier_count,:) = [points_1(i,:) points_2(j,:)]; % preallocate to the size of the number of points, then have another function that removes any nil entries
            end
        end
    end
    j = 0;
    
    
end
end