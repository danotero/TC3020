[X1,X2] = meshgrid(-1:0.05:2,-1:0.05:2);
H = zeros(size(X1));
[n1,n2] = size(X1);

for i=1:n1
    for j=1:n2
        [~,~,H(i,j)] = forward([1;X1(i,j);X2(i,j)],W);
    end
end

figure, surf(X1,X2,H)
xlabel('x_1'), ylabel('x_2')