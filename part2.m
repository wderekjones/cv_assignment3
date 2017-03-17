notre_dame_F_gt = dlmread('proj3/part2/dataset_1_notre_dame/F_gt.csv');
notre_dame_img_1 = imread('proj3/part2/dataset_1_notre_dame/image_1.jpg');
notre_dame_img_2 = imread('proj3/part2/dataset_1_notre_dame/image_2.jpg');

% remember to convert images to floating point

notre_dame_matches_estimated = dlmread('proj3/part2/dataset_1_notre_dame/matches_estimated.csv');

P1 = notre_dame_matches_estimated(:,1:2);
P2 = notre_dame_matches_estimated(:,3:4);



tp0 = P1(1,:)

gt_0 = P2(1,:)

F = compute_fundamental_matrix(P1,P2)


% estimate the fundamental matrix


