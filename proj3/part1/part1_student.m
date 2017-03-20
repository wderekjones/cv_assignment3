% makes random 3D points and projects them into random cameras

rng(0, 'twister')

N = 20;

P3 = randn(3,N);
H3 = [P3; ones(1,size(P3,2))];

for camid = 0:9
    
    % make random projection matrix (I used a different process to generate
    % random parameters, but the rest is the same)
    
    [R,K] = qr(randn(3));
    t = randn(3,1);
    M = K * [R t];
    M = M ./ norm(M,'fro');
    
    % project points
    H2 = M * H3;
    Htmp = H2(end,:); Htmp(Htmp == 0) = 1; % handle points at infinity
    P2 = H2(1:2,:) / Htmp;  % was ./
    
end

