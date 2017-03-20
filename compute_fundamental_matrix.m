function F = compute_fundamental_matrix(points_1, points_2)

% because finding the fundamental matrix requires solving a system of
% linear equations with 8 degrees of freedom, using more than 8 points to
% compute the fundamental matrix results in an overdetermined linear system
% with more than one possible answer that works well for a subset of the
% set of points. 

A = get_part2_A(points_1,points_2);
[U, S, V] = svd(A);
f = V(:,size(V,2));
F = reshape(f,[3 3])';
[U,S,V] = svd(F);
small_value = 99999999;
small_i = 3;
for i = 1:(size(S,2))
    if (abs(S(i,i)) <= abs(small_value))
        small_value = S(i,i);
        small_i = i;
    end
end
%S(3,3) =0;

F = U*S*V';
end