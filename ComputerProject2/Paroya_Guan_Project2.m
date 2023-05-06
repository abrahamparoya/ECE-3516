%% Abraham Paroya and Jalen Guan - Computer Project 2 %%
%% Signals: Continous and Discrete                  %%



% Read data from .wav into x vector and sampling rate
%
filename   = 'audio_CA2.wav'
[x, fs] = audioread(filename);
data  = x;


% Initialze different output vectors
%
y7 = zeros(length(x),1);
y8 = zeros(length(x),1);
y9 = zeros(length(x),1);

% Set window size
% 
w7 = 7 %N Value
    % Loop for all 18,000 samples
    %   
    for n = 1:length(x)
        % calculate k for each sample
        %
        k = n - w7 + 1;
        % If k<1 remove data of that index from original sample
        %
        if k < 1 
            x(n) = 0;
        else
            % Sum the values of the original data vector of windowed range
            %
            y7(n) = sum(x(k:n));
        end
    end

% Set window size
% 
w8 = 8 %N Value
    % Loop for all 18,000 samples
    %   
    for n = 1:length(x)
        % calculate k for each sample
        %
        k = n - w8 + 1;
        % If k<1 remove data of that index from original sample
        %
        if k < 1 
            x(n) = 0;
        else
            % Sum the values of the original data vector of windowed range
            %
            y8(n) = sum(x(k:n));
        end
    end

% Set window size
% 
w9 = 9 %N Value
    % Loop for all 18,000 samples
    %   
    for n = 1:length(x)
        % calculate k for each sample
        %
        k = n - w9 + 1;
        % If k<1 remove data of that index from original sample
        %
        if k < 1 
            x(n) = 0;
        else
            % Sum the values of the original data vector of windowed range
            %
            y9(n) = sum(x(k:n));
        end
    end

% Taking the fast fourier transform of filtered data
%
fo = fft(x);
f7 = fft(y7);
f8 = fft(y8);
f9 = fft(y9);

% Setting the paramaters of the x axis which will represent the frequencies
%
f = (0:length(x)-1)*fs/length(x);


% Plot response
%
figure(1)

% Plotting frequncies 0-1500 with the power of each filtered signal
%
subplot(4,1,1)
plot(f,abs(fo));
title('Frequency Response for Original Signal')
xlabel('Hz');
ylabel('Power');
xlim([0 1200])


subplot(4,1,2)
plot(f,abs(abs(f7)));
title('Frequency Response for N = 7')
xlabel('Hz');
ylabel('Power');
xlim([0 1200])


subplot(4,1,3)
plot(f,abs(f8));
title('Frequency Response for N = 8')
xlabel('Hz');
ylabel('Power');
xlim([0 1200])


subplot(4,1,4)
plot(f,abs(f9));
title('Frequency Response for N = 9')
xlabel('Hz');
ylabel('Power');
xlim([0 1200])


% Play audio:

soundsc(x)
pause(3)
soundsc(y7)
pause(3)
soundsc(y8)
pause(3)
soundsc(y9)
pause(3)
