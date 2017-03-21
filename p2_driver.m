function F = p2_driver(image1,image2,matches,inlier_epsilon,num_iterations,min_inliers)
P1 = matches(:,1:2);
P2 = matches(:,3:4);
F = get_best_fundamental_matrix(image1,image2,P1,P2,8,num_iterations,min_inliers,inlier_epsilon);
F_inliers = evaluate_fundamental_matrix(F,inlier_epsilon,P1,P2);
% estimate the fundamental matrix
F = compute_fundamental_matrix(F_inliers(:,1:2),F_inliers(:,3:4));
draw_epipolar_lines(F,image1,image2,P1,P2);
match_plot(image1,image2,F_inliers(:,1:2),F_inliers(:,3:4));
end