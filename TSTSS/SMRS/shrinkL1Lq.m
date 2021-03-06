function C2 = shrinkL1Lq(C1,lambda,q)

[D,N] = size(C1);
if (q == 1)
    C2 = max(abs(C1)-lambda,0) .* sign(C1);
elseif (q == 2)
    r = zeros(D,1);
    for j = 1:D
        r(j) = max(norm(C1(j,:))-lambda,0);
    end
    C2 = repmat(r./(r+lambda),1,N) .* C1;
elseif(q == inf)
    C2 = zeros(N,N);
    for j = 1:N
        C2(j,:) = L2_Linf_shrink(C1(j,:)',lambda)';
    end
end