function parametrica1(a,b,n1,n2,n3,n4)
%parametrica1(-20,20,10,50,100,1000)
t= linspace(a,b,n1);
x=5*cos(t/5)+cos(2*t);
y=5*sin(t/5)+sin(3*t);
subplot(2,2,1);
plot(x,y);
t= linspace(a,b,n2);
x=5*cos(t/5)+cos(2*t);
y=5*sin(t/5)+sin(3*t);
subplot(2,2,2);
plot(x,y);

t= linspace(a,b,n3);
x=5*cos(t/5)+cos(2*t);
y=5*sin(t/5)+sin(3*t);
subplot(2,2,3);
plot(x,y);

t= linspace(a,b,n4);
x=5*cos(t/5)+cos(2*t);
y=5*sin(t/5)+sin(3*t);
subplot(2,2,4);
plot(x,y);
end