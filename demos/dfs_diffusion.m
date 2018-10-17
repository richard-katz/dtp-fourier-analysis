function Tf = dfs_diffusion(y,Ti,kappa,time)
% DFS_DIFFUSION   1D diffusion calculation by discrete Fourier series
%   DFS_DIFFUSION(y,Ti,kappa,time) returns the temperature distribution 
%   after a specified time or times. 
%   INPUT:
%   y  - A vector of positions corresponding to the temperatures in Ti.
%   Ti - The initial distribution of temperature in the y-direction.
%   NOTE: y and Ti must have an odd number of entries!
%   kappa - The diffusivity.
%   time - The elapsed time of diffusion. This may be a vector or a single number.
%   OUTPUT: Tf - The distribution of temperatures at points in the y-direction
%     specified by the input vector y, after specified time.  If time is a 
%     vector of times, then Tf will be a matrix with each column corresponding
%     to an entry in the time vector.
  
  % Compute the total length of the time-series
  Y = y(end)-y(1);
  
  % Compute the discrete Fourier series
  Fi = dfs(Ti);
  
  % Compute an array of wavelengths and decay constants
  lambda = Y./[1:length(Fi.alpha)];
  wavenumber = 2*pi./lambda;
  
  % For each requested time
  for i=1:length(time)
    
    %compute the amount of decay
    decay_factor = exp(-wavenumber.^2 * kappa * time(i));

    % apply the decay to the Fourier coefficients
    Ff.alpha0 = Fi.alpha0;               % the mean does not decay!
    Ff.alpha  = Fi.alpha .* decay_factor;
    Ff.beta   = Fi.beta  .* decay_factor;
    
    % reconstruct the temperature field by inverting the DFT
    Tf(:,i) = idfs(Ff);
    
  end
