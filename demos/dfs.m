function F = dfs(Y);
% DFS   Discrete Fourier series 
%   DFS(Y) computes the Discrete Fourier series of an input
%   time-series Y.  Y must be a vector with a length N that 
%   is greater than 1 and odd in number.  F=DFS(Y) returns a
%   structure F as follows:
%     F.alpha0 = mean of the time-series
%     F.alpha  = coefficients of cosine terms for k=1:(N-1)/2
%     F.beta   = coefficients of the sine terms for k=1:(N-1)/2
%     F.power  = normalised power-spectrum of the time-series

  % Check length of time-series.  Must be odd and longer than 1
  N = length(Y);
  if (mod(N,2)==0 || N==1)
      error('Input vector must have length greater than 1 and ODD.');
  end
  
  % Ensure that Y is a column vector
  [rows cols] = size(Y);
  if rows==1; Y = Y'; end
  
  % Create index of time-series entries
  j = 0:N-1;

  % Calculate the coefficients at each frequency
  for k=1:(N-1)/2;
      C = cos(2*pi*j*k/N);
      S = sin(2*pi*j*k/N);
      Z = [C', S'];
      
      G(:,k) = (2/N) * Z' * (Y - mean(Y));
  end
  
  % Assemble structure containing results
  F.alpha0 = mean(Y);
  F.alpha  = G(1,:);
  F.beta   = G(2,:);
  F.power  = 0.5*(F.alpha.^2 + F.beta.^2)/var(Y);  
