function [x] = mts(A,b)
%x=mts([2 5 -3 1; 0 1 -2 3; 0 0 -2 5;0 0 0 1],[1 -2 0 -1])
[n,n]=size(A); %Matriz Cuadrada
x(n)=b(n)/A(n,n);
for i=n-1:-1:1
    x(i)=(b(i)-A(i,i+1:n)*x(i+1:n)')/A(i,i);
end
x=x';
end