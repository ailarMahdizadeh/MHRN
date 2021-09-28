function dM = MHRN(t , M)

global I_ext

a = 1;
b = 3;
k = 1;
c = 1;
d = 5;
r = 0.006;
s = 4;
k1 = 0.1;
k2 = 0.5;
alpha = 0.1;
beta = 0.06;
% f = 0.01;
% I_ext = 3.3;

dM = zeros(4,1); 
x = M(1); 
y = M(2); 
z = M(3); 
phi = M(4);

dM(1) = y - a * x^3 + b * x^2 - z + I_ext - k * x * (alpha + 3 * beta * phi^2);
dM(2) = c - d * x^2 - y;
dM(3) = r * (s * (x + 1.6) - z);
dM(4) = k1 * x - k2 * phi;

  
end

