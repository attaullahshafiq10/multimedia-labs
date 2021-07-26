%%%%%%%%%%%%%%%%
%Hafiz Muhammad Attaullah (2k18/TCT/23)
%Umm e Farwa (2k18/TCT/99)
%%%%%%%%%%%%%%%%

clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
fontSize = 20;
[y, Fs] = audioread('Audiofile.wav');
% sound(y,Fs);
x = fft(y);
figure;
subplot(3, 2, 1)
xr = real(x);
xi = imag(x);
plot(xr, 'b-');
% plot(xr(1:7000), 'b-');
grid on;
title('real(x)', 'FontSize', fontSize);
subplot(3, 2, 3)
plot(xi, 'b-');
% plot(xi(1230:6140), 'b-');
grid on;
xticks(0:10000:120000);
title('imag(x)', 'FontSize', fontSize);
subplot(3, 2, 5)
plot(abs(x), 'b-');
grid on;
title('abs(x)', 'FontSize', fontSize);
% Inverse fft just the imaginary part
% xi([105000:end]) = 0;
y2 = ifft(xi);
% y2 = ifft(xi(1230:6140));
y2r = real(y2);
y2i = imag(y2);
subplot(3, 2, 2)
plot(y2r, 'b-');
grid on;
title('real(y2)', 'FontSize', fontSize);
subplot(3, 2, 4)
plot(y2i, 'b-');
grid on;
xticks(0:10000:120000);
title('imag(y2)', 'FontSize', fontSize);
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.1, 1, 0.7]);
soundsc(y2i, 0.7*Fs);
% soundsc(flipud(y2i), 0.75*Fs); % Play in reverse
%end
