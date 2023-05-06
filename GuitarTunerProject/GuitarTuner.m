% --- Guitar Tuner --- %

% Prompt
%
prompt = "What string would you like to tune? (E, A, D, G, B, e)";
txt = input(prompt,"s");

% Perform operation based on selected string
%
switch txt
    case 'E'
        % Get the output (most-prominent frequency from record_transform
        % function.
        %
        signal_freq = record_transform;

        % Compare to the in tune frequency
        %
        if signal_freq > 82
            disp('String is sharp, tune down.')
        elseif signal_freq < 82
            disp('String is flat, tune up.')
        else
            disp('String is in tune.')
        end

    case 'A'
        signal_freq = record_transform;
        if signal_freq > 110
            disp('String is sharp, tune down.')
        elseif signal_freq < 110
            disp('String is flat, tune up.')
        else
            disp('String is in tune.')
        end

    case 'D'
        signal_freq = record_transform;
        if signal_freq > 147
            disp('String is sharp, tune down.')
        elseif signal_freq < 147
            disp('String is flat, tune up.')
        else
            disp('String is in tune.')
        end

    case 'B'
        signal_freq = record_transform;
        if signal_freq > 247
            disp('String is sharp, tune down.')
        elseif signal_freq < 247
            disp('String is flat, tune up.')
        else
            disp('String is in tune.')
        end

    case 'e'
        signal_freq = record_transform;
        if signal_freq > 330
            disp('String is sharp, tune down.')
        elseif signal_freq < 330
            disp('String is flat, tune up.')
        else
            disp('String is in tune.')
        end

    otherwise
        disp('Choose a string listed above.')
end


% Play back recorded audio
%
%play(recObj);



% fprintf('Maximum occurs at %2.3f Hz\n',freq(index))


function [signal_freq]=record_transform
% Global Varibales
%
Fs = 44100;

% Record Audio for 1 second, sampling frequency 44100, bit-rate = 68kBps
%
%
recObj = audiorecorder(44100,24,1);
recDuration = 1;
disp("Strum Note.")
recordblocking(recObj,recDuration);
disp("End of recording.")
% Retrieve sampled data
%
x = getaudiodata(recObj);
% Plot string sample data
%
plot(x);
xdft = fft(x);

% Calculate frequency range
%
[~,index] = max(abs(xdft(1:length(x)/2+1)));
freq = 0:(Fs/length(x)):Fs/2;
f = 1:1:44100;
% Take fast fourier transform of the recorded data
%
plot(f,abs(xdft));
title('Frequency Response for Original Signal')
xlabel('Hz');
ylabel('Power');

signal_freq = freq(index)
end








