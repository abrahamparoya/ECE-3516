% Abraham Paroya and Luke Dewees - Computer Project 4

clear all
close all
clc
% load in image data
%
load("hw4Data.mat");
%% Part 1
% new subplot-> plot image 1
%
subplot(341)
imagesc(im1);
colormap('gray');
axis equal;
subtitle('Original Image #1');
% new subplot-> plot fourier transform of image 1
%
subplot(342)
Y = fft2(im1);
imagesc(abs(fftshift(Y)));
subtitle('Fourier Transform of Images #1');
% new subplot-> plot image 2
%
subplot(343)
imagesc(im2);
axis equal;
subtitle('Original image2');
% new subplot-> plot fourier transform of image 2
%
subplot(344)
Y = fft2(im2);
imagesc(abs(fftshift(Y)));
subtitle('Fourier Transform2');
% new subplot-> plot image 3
%
subplot(345)
imagesc(im3);
axis equal;
subtitle('Original image3');
% new subplot-> plot fourier transform of image 4
%
subplot(346)
Y = fft2(im3);
imagesc(abs(fftshift(Y)));
subtitle('Fourier Transform3');
% new subplot-> plot image 5
%
subplot(347)
imagesc(im4);
axis equal;
subtitle('Original image4');
% new subplot-> plot fourier transform of image 5
%
subplot(348)
Y = fft2(im4);
imagesc(abs(fftshift(Y)));
subtitle('Fourier Transform4');
% new subplot-> plot image 6
%
subplot(349)
imagesc(im5);
axis equal;
subtitle('Original image5');
% new subplot-> plot fourier transform of image 6
%
subplot(3,4,10)
Y = fft2(im5);
imagesc(abs(fftshift(Y)));
subtitle('Fourier Transform5');
% new subplot-> plot image 7
%
subplot(3,4,11)
imagesc(im6);
axis equal;
subtitle('Original image6');
% new subplot-> plot fourier transform of image 7
%
subplot(3,4,12)
Y = fft2(im6);
X = abs(fftshift(Y));
imagesc(20*log10(X));
% clim([-120 0]);
colorbar;
subtitle('Fourier Transform6')

figure
plot(im1(1,:))

figure
plot(im2(1,:))

%% Part 2
% % new subplot-> plot original moon image
% %
% subplot(321); 
% imagesc(moon); axis equal off; colormap('gray');
% subtitle('Original Image of Moon');
% % new subplot-> plot fourier transform of moon image
% %
% subplot(322);
% myFFT2(moon);
% subtitle('Original Image of Moon Fourier Transform');
% % apply low pass filter on moon image
% %
% h_lpf_1 = ftrans2(fir1(16,0.1));
% moon_low = imfilter(moon,h_lpf_1);
% % new subplot-> plot low pass filtered moon image
% subplot(323);
% imagesc(moon_low); axis equal off; 
% colormap('gray');
% subtitle('Image of Moon With a Filter');
% % new subplot-> plot fourier transform of low pass fitered moon image
% %
% subplot(324);
% myFFT2(moon_low);
% subtitle('Filtered Moon Fourier Transform');
%% Part 3
% % new subplot-> plot original moon image
% %
% subplot(321)
% imagesc(moon); axis equal off; colormap('gray');
% subtitle('Original Moon');
% % new subplot-> plot fourier transform of original moon image
% %
% subplot(322);
% myFFT2(moon);
% subtitle('Original Moon Fourier Transform');
% % apply high pass filter on moon image
% %
% h_lpf_2 = ftrans2(fir1(16,0.2, 'high'));
% subplot(323);
% myFFT2(h_lpf_2);
% subplot(324);
% moon_high = imfilter(moon,h_lpf_2);
% % new subplot-> plot high pass filtered moon image
% %
% imagesc(moon_high); axis equal off;
% subtitle('Filtered Moon');
% % new subplot-> plot fourier transform of high pass filtered moon image
% %
% % subplot(325);
% myFFT2(moon_high);
% subtitle('Filtered Moon Fourier Transform');