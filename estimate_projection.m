function pts = estimate_projection(M_estimate,world_point)
    pts = M_estimate*world_point;
    pts(1,:) = pts(1,:) ./ pts(3,:);
    pts(2,:) = pts(2,:) ./ pts(3,:);
    pts = pts(1:2,:);
end