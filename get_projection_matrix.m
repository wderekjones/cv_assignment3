function M = get_projection_matrix( points_2d, points_3d )
A = get_A(points_2d,points_3d);
[U,S,V] = svd(A);
M = V(:,size(V,2));
M = reshape(M,[],3)';
end

