function [a1,a2,a3] = forward(X,W)

n = size(X,2);
a1 = X;
a2 = [ones(1,n);sigmoid(W{1}*a1)];
a3 = sigmoid(W{2}*a2);

end