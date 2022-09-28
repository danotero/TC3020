X = [1 0 0;1 0 1;1 1 0;1 1 1];
Xt = X';
y = [0,1,1,1]';
w = randn(3,1);
alpha = 0.3;
m = 1000; 
n = 4;
costo = zeros(m,1);

for i = 1:m
    w = w - alpha*(Xt*(sigmoid(X*w)-y));
    costo(i) = cost(n,w,X,y);
end

x1 = -1:0.1:2;
x2 = -w(1)/w(3)-(w(2)/w(3))*x1;
close all;
figure;
subplot 121, plot(1:m,costo), axis tight;
subplot 122, hold on, scatter(X(:,2),X(:,3)), plot(x1,x2), ...
    axis tight, xlabel('x_1'), ylabel('x_2');


function c = cost(n,w,X,y)

c = -(1/n)*(y'*log(sigmoid(X*w))+(1-y)'*log(1-sigmoid(X*w)));

end