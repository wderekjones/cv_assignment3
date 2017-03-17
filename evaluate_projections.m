function e = evaluate_projections(world_points,camera_points,P)
e = 0;
for i = 1:size(world_points,1)
   tp = world_points(i,:);
   tp = [tp 1];
   tp = transpose(tp);
   tp = estimate_projection(P,tp);
   e = e + norm(transpose(tp) - camera_points(i,:));
end
end