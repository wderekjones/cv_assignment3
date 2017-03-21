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
num_iterations = 100;  %1000
min_inliers = 300;


epsilon_1_2 = 1e-1;
p2_driver(img1,img2,img1_img2_matches,epsilon_1_2,num_iterations,min_inliers);

epsilon_3_4 = 1e-1;
p2_driver(img3,img4,img3_img4_matches,epsilon_3_4,num_iterations,min_inliers);

epsilon_5_6 = 1e-1;
p2_driver(img5,img6,img5_img6_matches,epsilon_5_6,num_iterations,min_inliers);

