function[X f ABSSS FFF] = autoFFT(tone);
fs=16000;
window=50e-3;
x=tone;
[m,n]=size(x);
dt=1/fs;
t=dt*(0:n-1);

x = x(idx) ;
nfft = length(x); % default assign for number of points wanted in output 
    nfft = max([nfft,2^20]); % default minimum assign
    % Explanation: Assigns nfft to the maximum value of the matrix made 
    % from nfft(default assign) and 2^20 (makes sure aduqut point)

X = fft(x,nfft)/fs; % takes FFT of x 
X = fftshift(X);    % calls and FFT shift function

% Create the frequency value by manipulating fs
f = fs*(0:nfft-1)/nfft - (fs/nfft)*floor(nfft/2);
ABSSS=abs(X(f>=0));
FFF=f(f>=0);
%     plot(f(f>=0),abs(X(f>=0))); 
    plot(FFF(1:70000),ABSSS(1:70000)); 
[A B]=max(ABSSS);
FFF(B)
end