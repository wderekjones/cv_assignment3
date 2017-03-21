%CS 636: Assignment 3
%by Derek Jones

%This script loads a set of 3 dimenssional world coordinates, then loops to
%iteratively load camera coordinates. For each of the input data from the
%cameras, a camera projection matrix M is found that maps the world coordinates to the
%image coordinates. From M, for each of the cameras, the camera center C is
%computed from the M matrix, the camera intrinsic matrix is also found by
%RQ decomposition of the M matrix.

camera_center_0_gt = csvread('proj3/part1/camera_center_0_gt.csv');
camera_intrinsic_0_gt = csvread('proj3/part1/camera_intrinsic_0_gt.csv');
camera_rotation_0_gt = csvread('proj3/part1/camera_rotation_0_gt.csv');
M_gt = csvread('proj3/part1/projection_0_gt.csv');
points_world = csvread('proj3/part1/points_world.csv');

for i = 0:9
    points_path_2d = strcat('proj3/part1/points_image_',num2str(i),'.csv');
    points_2d = csvread(points_path_2d);
    
    M = get_projection_matrix(points_2d,points_world);
    output_projection_title_i = strcat('proj3/part1/camera_projection_',num2str(i),'_estimation.csv');
    csvwrite(output_projection_title_i,M);

    C = compute_camera_center(M);
    output_camera_center_i = strcat('proj3/part1/camera_center_',num2str(i),'_estimation.csv');
    csvwrite(output_camera_center_i,C);

    K = get_camera_intrinsic_matrix(M);
    output_camera_intrinsic_i = strcat('proj3/part1/camera_intrinsics_',num2str(i),'_estimation.csv');
    csvwrite(output_camera_intrinsic_i,K);    
end