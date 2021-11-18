%
%  main.m
%  wm2
%
%  Created by Yuan Leiqi (袁磊祺) on 2021/10/1.
%

clear;clc;close all;

parpool(20)

long = 1e2;
dz = 1e-3;
x = - long:dz:long;
n = floor(2*long/dz);
point = -long;
parfor i = 1:n
    z(i) = point + dz*i;
    y = exp(-abs(x).^0.5).*cos(x*z(i));
    f(i) = trapz(x, y);
end
f = f/(2*pi);

save(strcat(num2str(randN), 'f.mat'), 'f')
save(strcat(num2str(randN), 'z.mat'), 'z')
