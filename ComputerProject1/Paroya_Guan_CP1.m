% ECE 3512 Project 1 - Decompressing 3 Audio Signals
% By: Abraham Paroya and Jalen Guan

clear all;
close all;
clc;

% Load in the audio file
%
load audio_1_no_overlap.mat

% Grab the size of matrices
%
[nWindows, nFreqs] = size(A)

% Variable Declarations
%
window_length = 40e-3; % signals divided into 40 ms windows
samples_per_window = 1764; % 40 ms * sample rate = 1764 samples per window

% Loop continues for number of windows
%
for i = 1:nWindows

    % Takes the rows one by one of the complex number and frequency matrices
    %
    A_exp = A(i,:);
    freq = freqs(i,:);
    
    % Finds the mag of the complex number
    %
    A_mag = abs(A_exp);
    
    % Takes the phase
    %
    Phase = angle(A_exp);
    
    % Time space declared
    %
    t = (0:1:samples_per_window-1)/44100;
    
    % Omega calculated for each frequncy value.
    %
    w = 2*pi*freq;
    
    % Transpose for time multiplication
    %
    w_transpose = w';
    
    % Omega multiplied by time
    %
    omega_t = w_transpose*t;

    % Loops for the number of phase values
    %
        for j = 1:nFreqs
        
        % Computes the values inside the cosine (wt + angle)
        %
        inside_cos(j,:) = omega_t(j,:)+Phase(j);
        end

        % Puts the values in the cosine function  
        for j = 1:nFreqs;
        Cosines(j,:) = A_mag(j)*cos(inside_cos(j,:));
        end

% Finding Sum and st
%
    y(:,i) = sum(Cosines);
end

% Sets the sum of a cosines to a single vector.
%
decompressed_audio = y(:);

% Plays audio
%
soundsc(decompressed_audio,fs);
length(y)
% Graphing reconstructed signal vs the time
%
time = linspace(0,nWindows*window_length,length(decompressed_audio));
plot(time,decompressed_audio);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Audio 3: Amplitude of Uncompressed Signal vs Time');

% Expected Audio length
%
Expected_Reconstructed_Audio_Length = nWindows*window_length;


