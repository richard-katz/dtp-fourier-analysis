function Y = idfs(F)
% IDSF   INVERSE DISCRETE FOURIER SERIES
% 
% IDSF(F) takes in the ouput of the discrete Fourier series function DSF
% and reconstructs a time series Y. Input F is a structure with the form:
%   F.alpha  = coefficients of cosine terms for k=1:(N-1)/2
%   F.beta   = coefficients of the sine terms for k=1:(N-1)/2
%   F.alpha0 = mean of the time-series (alpha_0)

N = length(F.alpha)*2+1;
n = 0:N-1;
Y = F.alpha0*ones(1,N);

for k = 1:length(F.alpha)
    Y = Y + F.alpha(k)*cos(2*pi*k*n/N);
    Y = Y + F.beta(k) *sin(2*pi*k*n/N);
end
