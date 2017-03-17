function F = compute_fundamental_matrix(points_1, points_2)
A = get_part2_A(points_1,points_2);
[U, S, V] = svd(A);
f = V(:,size(V,2));
F = reshape(f,[3 3])';

[U,S,V] = svd(F);
S(3,3) = 0;
F = U*S*V';
end