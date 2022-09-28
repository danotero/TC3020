X = [1 0 0;1 0 1;1 1 0;1 1 1]';
Xt = X';
y = [0,1,1,0];
L = 2;
W = cell(L,1);
W{1} = randn(2,3);
W{2} = randn(1,3);
alpha = 0.8;
m = 2000; 
n = 4;
costo = zeros(m,1);

for i = 1:m
    D = backprop(L,n,X,W,y);
    W{1} = W{1} - alpha*D{1}(2:3,:);
    W{2} = W{2} - alpha*D{2};
    costo(i) = cost(n,X,W,y);
end

close all;
figure;
plot(1:m,costo);

function c = cost(n,X,W,y)

[~,~,hW] = forward(X,W);
c = -(1/n)*(y*log(hW)'+(1-y)*log(1-hW)');

end

function D = backprop(L,n,X,W,y)

D = cell(L,1);

[a1,a2,a3] = forward(X,W);
delta3 = a3-y;
delta2 = (W{2}'*delta3).*a2.*(1-a2);
D{1} = (1/n)*delta2*a1';
D{2} = (1/n)*delta3*a2';

end