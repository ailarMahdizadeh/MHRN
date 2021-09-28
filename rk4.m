function [t w]=rk4(f,tBegin, run_time, deltaT, init)

m = size(init,1);
if m == 1
   init = init';
end
samples = floor((run_time-tBegin)/deltaT);
t(1) = tBegin;
w(:,1) = init;    

for i = 1:samples
   k1 = deltaT*f(t(i), w(:,i));
   k2 = deltaT*f(t(i)+deltaT/2, w(:,i)+0.5*k1);
   k3 = deltaT*f(t(i)+deltaT/2, w(:,i)+0.5*k2); 
   k4 = deltaT*f(t(i)+deltaT, w(:,i)+k3);
   w(:,i+1) = w(:,i) + (k1 + 2*k2 + 2*k3 + k4)/6;
   t(i+1) = tBegin + i*deltaT;
%    if t(i)/100 == floor(t(i)/100)
%         t(i)
%    end
end

t=t';
w=w';




   