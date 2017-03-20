function A_2 = get_part2_A(image_points_1,image_points_2)
for n = 1:size(image_points_1,1)
   u = image_points_1(n,1);
   v = image_points_1(n,2);
   u_p = image_points_2(n,1);
   v_p = image_points_2(n,2);
   A_2(n,:) = [u*u_p u*v_p u v*u_p v*v_p v u_p v_p 1];
end
end