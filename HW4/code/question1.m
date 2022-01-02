clear;clc;close all;
set(0, 'defaultlinelinewidth', 2)
set(0, 'defaultaxeslinewidth', 2);
set(0, 'defaultaxesfontsize', 25);
set(0, 'defaulttextfontsize', 25);
set(0, 'DefaultLineMarkerSize', 10);
set(0, 'Defaultaxesfontname', 'Times New Roman');

%% 
% 1

num = 1e3;
x = linspace(1e-6,2,num);

y = 0;
ubar = 0.9;

for i = 1:num
   if(x(i)<ubar)
	  y(i) = x(i)^(2/3);
   else
	  y(i) = 1 - (1 - ubar^(2/3))/(1 - tanh(ubar))*(1 - tanh(x(i)));
   end
end

plot(y)


xlabel('$r$', 'interpreter', 'latex')
ylabel('$B_{dd}$', 'interpreter', 'latex')
% yticks(-0.2:0.2:1.1)
% xlim([1e-1, 1e1])
ylim([0, 1.1])
saveas(gcf, 'question1-1', 'epsc')

%%
f = 1 - y;

E = 0;
kmax = 8;
k = linspace(1e-4,kmax,num);
r = x;

for i = 1:num
   E(i) = trapz(r,f*k(i)^2.*r.^2.*(sin(k(i)*r)./(k(i)*r) - cos(k(i)*r)));
end

loglog(k,E*ubar)

xlabel('$k$', 'interpreter', 'latex')
ylabel('$E$', 'interpreter', 'latex')
% yticks(-0.2:0.2:1.1)
xlim([1e-1, 1e1])
ylim([1e-4, 2])
saveas(gcf, 'question1-2', 'epsc')

% save('f.mat', 'f')

%%
% 2

