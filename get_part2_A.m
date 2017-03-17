function A_2 = get_part2_A(image_points_1,image_points_2)
for n = 1:size(image_points_1,1)
   u_n = image_points_1(n,1);
   v_n = image_points_1(n,2);
   u_np = image_points_2(n,1);
   v_np = image_points_2(n,2);
   A_2(n,:) = [u_n*u_np u_n*v_np u_n v_n*u_np v_n*v_np v_n u_np v_np 1];
end
end