%% In the name of Allah

clc
clear all
close all

%%
run_time = 2000;
init = [0 -1.8 3.5 0];

global I_ext

param_min = 3;
resul = 0.001;
%%برای زودتر جواب گرفتن کد این عدد رو می‌تونین بزرگ کنین. رزولوشن در واقع 
%%تعداد پارامترهایی که شما حلقه رو به ازای اون محاسبه می‌کنید نشون میده. 
%%پس به طور خطی هرچی این عدد کوچیکتر بشه زمان اجرای کد زیادتر میشه. همیشه 
%%اول کد رو بها رزولوشن پایین ران کنین تا یه جواب اولیه ازش بگیرین. اگه
%%منطقی بود با رزولوشن‌های بالا بذارین ران بشه که وقتتون هدر ندره یه موقع

param_max = 3.8;

param = param_min : resul : param_max;

deltaT = 0.01;
p = 0.9;
LT = ceil((run_time / deltaT) * (1 - p) + 1);

ploti_x = nan(LT,length(param));
ploti_y = nan(LT,length(param));
ploti_z = nan(LT,length(param));
ploti_phi = nan(LT,length(param));

kk = 0;
tic
for param_mat = param_min : resul : param_max
    kk = kk + 1;
    I_ext = param_mat
    [T , M] = rk4(@MHRN , 0 , run_time , deltaT , init);
    x = M(: , 1);
    y = M(: , 2);
    z = M(: , 3);
    phi = M(: , 4);
    
    sizi = length(x);
    x = x(floor(sizi * p) + 1 : end, 1);
    y = y(floor(sizi * p) + 1 : end, 1);
    z = z(floor(sizi * p) + 1 : end, 1);
    phi = phi(floor(sizi * p) + 1 : end, 1);
    T = T(floor(sizi * p) + 1 : end, 1);
    
    init = [x(end) y(end) z(end) phi(end)];
    
    X = findpeaks(x);
    ploti_x(1 : length(X), kk) = X;
    Y = findpeaks(y);
    ploti_y(1 : length(Y), kk) = Y;
    Z = findpeaks(z);
    ploti_z(1 : length(Z), kk) = Z;
    Phi = findpeaks(phi);
    ploti_phi(1 : length(Phi), kk) = Phi;

end

toc

save param param
save ploti_x ploti_x
save ploti_y ploti_y
save ploti_z ploti_z
save ploti_phi ploti_phi
%%
load param
load ploti_x
load ploti_y
load ploti_z
load ploti_phi
%%
mm = 0.5;

figure
plot(param, ploti_y', 'ob', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b', 'MarkerSize', mm)
grid on
xlim([param(1) param(end)])
xlabel('I_e_x_t(mV)','FontName','Times New Roman','fontsize',32)
ylabel('y_m_a_x','FontName','Times New Roman','fontsize',32)
set(gca, 'FontSize' , 15)
    
    
    
    
    