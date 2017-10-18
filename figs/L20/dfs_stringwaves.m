function eta = dfs_stringwaves(x,eta0,c,time)
% DFS_STRINGWAVES  Waves on a finite string by discrete Fourier series
%   DFS_STRINGWAVES(x,eta0,c,time) returns the string displacement 
%   after a specified time or times. 
%   INPUT:
%   x  - A vector of positions along the string.  The first entry should be 0
%        and the last entry should equal the length of the string.
%   eta0 - The initial displacement of the string in the y-direction.
%   NOTE: x and eta0 must have an EVEN number of entries!
%   c  - The wave-speed of the string.
%   time - The elapsed time. This may be a vector or a single number.
%   OUTPUT: eta - The displacement of the string at points in the x-direction
%     specified by the input vector x, after specified time.  If time is a 
%     vector of times, then eta will be a matrix, with each column 
%     corresponding to an entry in the time vector.
  
  % ensure that eta0 has an EVEN number of entries.
  N = length(eta0);
  if (mod(N,2)==1 || N==1)
      error('Input vector must have length greater than 1 and EVEN.');
  end

  % ensure that eta0 and x are column vectors, and that time is a row vector.
  eta0 = reshape(eta0,N,1);
  x    = reshape(x,N,1);
  time = reshape(time,1,length(time));
  
  % remove the final entry, which is equal to the the first entry.
  % this is required to make the signal exactly periodic.
  eta0 = eta0(1:end-1); 
  
  % compute coefficients of the sine series representation of eta0.
  % the cosine series is not required because we assume odd symmetry.
  L = x(end)-x(1);
  N = length(eta0);
  for n = 1:(N-1)/2
      a(n) = 2/N*sum(eta0.*sin(pi*n*x(1:N)/L));
  end
  
  % compute array of wavenumbers and frequencies.
  kappa = [1:(N-1)/2]*pi/L;
  omega = c*kappa;
  
  % reconstruct the displacement for all entries in the vector time.
  eta = zeros(N+1,length(time));
  for n = 1:(N-1)/2
    eta = eta + a(n)*sin(kappa(n)*x)*cos(omega(n)*time);
  end
