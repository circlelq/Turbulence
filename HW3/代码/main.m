%
%  main.m
%  code
%
%  Created by Yuan Leiqi (袁磊祺) on 2021/11/22.
%

clear;clc;close all;
set(0, 'defaultlinelinewidth', 2)
set(0, 'defaultaxeslinewidth', 2);
set(0, 'defaultaxesfontsize', 25);
set(0, 'defaulttextfontsize', 25);
set(0, 'DefaultLineMarkerSize', 10);
set(0, 'Defaultaxesfontname', 'Times New Roman');
%%

data = h5read("slab_xmid.h5", '/q2/T000050');
for i = 1:360
    data(:,i) = data(:,i) - mean(data(:,i));
end
vMid = data(:,140:220);
plot(vMid)
mean(mean(vMid.^3))
%%
f = 0;

up = 140;
down = 220;

long = 60;

for r = 0:long-1
    temp = 0;
    for m = up:down
        for l = 1:360
            temp = temp + data(l,m)*data(mod((l+r-1),360)+1,m);
        end
    end
    f(r+1) = temp / l / (down - up + 1);
end

% f = f/f(1);

x = linspace(0,long/90,long);



plot(x,f/f(1))
xlabel('$r$', 'interpreter', 'latex')
ylabel('$f$', 'interpreter', 'latex')
yticks(-0.2:0.2:1.1)
xlim([0, 1.2])
ylim([-0.2, 1.1])
% saveas(gcf, 'f-r', 'epsc')

% save('f.mat', 'f')

%%
figure;
k = 0;

long = 100;

for r = 0:long-1
    temp = 0;
    for m = up:down
        for l = 1:360
            temp = temp + data(l,m)^2*data(mod((l+r-1),360)+1,m);
        end
    end
    k(r+1) = temp / l / (down - up + 1);
end

k = k/f(1)^(3/2);

x = linspace(0,long/90,long);

plot(x,k)
xlabel('$r$', 'interpreter', 'latex')
ylabel('$k$', 'interpreter', 'latex')

% xlim([0, 1.2])
% ylim([-0.2, 1.2])
% saveas(gcf, 'k-r', 'epsc')

%%
figure;
E = 0;
long = 60;
x = linspace(0,long/90,long) + 1e-7;

for i = 1:14
    E(i) = mean(f.*x.^2*i^2.*(sin(i*x)./(i*x) - cos(i*x)))/pi;
end

plot(E)

xlabel('$k$', 'interpreter', 'latex')
ylabel('$E$', 'interpreter', 'latex')
saveas(gcf, 'E-k', 'epsc')


%%

figure;

phi = 0;

x = linspace(1,long,long);

for i = 15:long
    E(i) = 0;
end
plot(E)

for i = 1:long
    temp = (1 - i^2./x.^2) .*E ./x;
    phi(i) = mean(temp(i:long))/2;
end
plot(phi)

xlim([0, 20])
ylim([-1e-6, 1.6e-5])
xlabel('$k$', 'interpreter', 'latex')
ylabel('$\varphi$', 'interpreter', 'latex')
saveas(gcf, 'phi-k', 'epsc')





