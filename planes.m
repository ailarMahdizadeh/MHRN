function final
a=1;b=3;k=1;c=1;d=5;r=0.006;s=4;k1=0.1;k2=0.5;alpha=0.1;
beta=0.06;Iext=3.5;f=0.01;
tspan = [0 2000] ;
t0=[0.5 -2 4 0.1];
[t,x] = ode45(@odefun,tspan,t0);
%to plot each of phase portraits,I change index of x
%plot(x(:,1),x(:,2))
plot(t,x(:,2))

function dt=odefun(t,x)

n=4;
dt = zeros(n,1);
pho=alpha+3*beta*(x(4)^2);
dt(1)=x(2)-a*((x(1))^3)+b*((x(1)^2))-x(3)-(k*x(1)*pho)+Iext;
dt(2)=c-d*((x(1)^2))-x(2);
dt(3)=r*(s*(x(1)+1.6)-x(3));
dt(4)=k1*x(1)-k2*x(4)+100*cos(2*pi*f*t);
%+1*cos(2*pi*f*t)
end
end