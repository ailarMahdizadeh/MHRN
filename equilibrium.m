clc
close all
clear all
a=1;b=3;k=1;c=1;d=5;r=0.006;s=4;k1=0.1;k2=0.5;alpha=0.1;
beta=0.06;
for i=1:200;
    Iext=i/10;
%pho=beta+0.5*(alpha-beta)*(sgn(x(4)+1)-sgn(x(4)-1));
pho=beta;
F=@(x)[x(2)-a*((x(1))^3)+b*((x(1)^2))-x(3)+Iext-k*x(1)*(pho);c-d*((x(1)^2))-x(2);r*(s*(x(1)+1.6)-x(3));k1*x(1)-k2*x(4)];
x0=[0.5 -2 4 0.1];
options = optimoptions('fsolve','Display','off');
x=fsolve(F,x0, options);
x_eq=x(1,1);
y_eq=x(1,2);
z_eq=x(1,3);
phi_eq=x(1,4);
disp(x)
%%
syms x y z phi landa real_landa I
rho=beta;
eq1=y-(a*(x.^3))+(b*(x.^2))-z+Iext-(k*x*rho);
eq2=y+c-(d*(x.^2));
eq3=z-(s*(x+1.6));
eq4=x-((k1/k2)*phi);
J=jacobian([eq1,eq2,eq3,eq4],[x,y,z,phi]);
x=x_eq;
J(1,1)= - 3*x^2 + 6*x - 3/50;
J(2,1)=-10*x;
disp(J)
%%eigen value
matrix=(landa*J)-eye(4);
disp(matrix)
determinan=det(matrix);
disp(determinan)
landa_solve=vpasolve(determinan==0, landa);
landa=landa_solve(2,1);
%plot(Iext(:),landa(:),'b-o')
hold on
end
