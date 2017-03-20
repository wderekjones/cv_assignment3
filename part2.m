inlier_epsilon = 0.125;
num_iterations = 100;
F_gt = dlmread('proj3/part2/dataset_1_notre_dame/F_gt.csv');
notre_dame_img_1 = imread('proj3/part2/dataset_1_notre_dame/image_1.jpg');
notre_dame_img_2 = imread('proj3/part2/dataset_1_notre_dame/image_2.jpg');

% remember to convert images to floating point

notre_dame_matches_estimated = dlmread('proj3/part2/dataset_1_notre_dame/matches_estimated.csv');

P1 = notre_dame_matches_estimated(:,1:2);
P2 = notre_dame_matches_estimated(:,3:4);

F = get_best_fundamental_matrix(notre_dame_img_1,notre_dame_img_2,P1,P2,8,num_iterations,inlier_epsilon);

F_inliers = evaluate_fundamental_matrix(F,inlier_epsilon,P1,P2);


F = compute_fundamental_matrix(F_inliers(:,1:2),F_inliers(:,3:4));

% estimate the fundamental matrix
draw_epipolar_lines(F_gt,notre_dame_img_1,notre_dame_img_2,P1,P2);

% TODO: only plot the matches that are inliers
draw_epipolar_lines(F,notre_dame_img_1,notre_dame_img_2,P1,P2);
