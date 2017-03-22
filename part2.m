%CS 636: Assignment 3 Part 2
%by Derek Jones

%This script loads a set of image pairs and precomputed match pairs between
%the images. For each pair of images, a fundamental matrix is estimated
%using the RANSAC algorithm by iteratively guessing 8 random matches from
%which to compute the fundamental matrix. Then the matrix is evaluated to
%understand how many inliers agree with the matrix, this is compared to the
%best result, and the process continues until a maximum number of
%iterations have been used or a minimum number of inliers have been found. 

img1 = imread('proj3/part2/dataset_1_notre_dame/image_1.jpg');
img2 = imread('proj3/part2/dataset_1_notre_dame/image_2.jpg');
img1_img2_matches = dlmread('proj3/part2/dataset_1_notre_dame/matches_estimated.csv');


img3 = imread('proj3/part2/dataset_2_episcopal_gaudi/image_1.jpg');
img4 = imread('proj3/part2/dataset_2_episcopal_gaudi/image_2.jpg');
img3_img4_matches = dlmread('proj3/part2/dataset_2_episcopal_gaudi/matches_estimated.csv');

img5 = imread('proj3/part2/dataset_3_mount_rushmore/image_1.jpg');
img6 = imread('proj3/part2/dataset_3_mount_rushmore/image_2.jpg');
img5_img6_matches = dlmread('proj3/part2/dataset_3_mount_rushmore/matches_estimated.csv');

epsilon = 1e-1; %5e-1
num_iterations = 5000;  %1000
min_inliers = 300;

epsilon_1_2 = 1e-1;
F1 = p2_driver(img1,img2,img1_img2_matches,epsilon_1_2,num_iterations,min_inliers);
csvwrite('proj3/part2/dataset_1_notre_dame/F.csv',F1);

epsilon_3_4 = 1e0;
F2 = p2_driver(img3,img4,img3_img4_matches,epsilon_3_4,num_iterations,40);
csvwrite('proj3/part2/dataset_2_episcopal_gaudi/F.csv',F2);

epsilon_5_6 = 1e-1;
F3 = p2_driver(img5,img6,img5_img6_matches,epsilon_5_6,num_iterations,min_inliers);
csvwrite('proj3/part2/dataset_3_mount_rushmore/F.csv',F3);