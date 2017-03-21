function F_best = get_best_fundamental_matrix(image_1,image_2, points_1,points_2, sample_size,max_iterations,min_inliers,epsilon)

best_sample_inliers = [];
F_best = compute_fundamental_matrix(points_1,points_2);

for i = 1:max_iterations;
    
    % try randomly generating a set of indices in order to decrease memory
    % usage while simulatenously preventing unnecessary copying of the
    % datapoints
    
    sample_indices = randperm(size(points_1,1))';       % generate a random set of indices, this method generates a vector of all possibilities from 1 to n
    sample_indices = sample_indices(1:sample_size,:);  % then we select the top sample_size elements, since it is assumed that there is a uniform probability of each index appearing in any position.
    
    %sample_points_1 = datasample(points_1,sample_size);
    %sample_points_2 = datasample(points_2,sample_size);

    F_est = compute_fundamental_matrix(points_1(sample_indices,:),points_2(sample_indices,:));
    
    %inliers_F = evaluate_fundamental_matrix(F_est,epsilon,points_1,points_2);
    
    inliers_F = compute_F_inliers(F_est,epsilon,points_1,points_2);
    
    % evaluate fundamental matrix works correctly (transforms each point
    % from points_1 to its estimated value in points_2, then the norm
    % between the estimation and the ground truth is found). What I need to
    % do now is for each estimation of the fundamental matrix, for each
    % point in the set points_1: compute distance between the
    % point and each point in the set points_2, if the error is above a
    % certain threshold then the point in points_2 is considered and
    % outlier, otherwise it is considered to be an inlier. Add the points
    % x1 and x2 to the set of matched points?
    
    if size(inliers_F,1) > size(best_sample_inliers,1)
        F_best = F_est;
        best_sample_inliers = inliers_F;
    end
    if size(inliers_F,1) >= min_inliers
        return 
    end
end
end