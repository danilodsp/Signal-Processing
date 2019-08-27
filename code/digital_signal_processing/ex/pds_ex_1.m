T = 16;
T1 = 4;
%Nvec = [ 5, 21, 101, 501];
Nvec = [ 3];

% The time samples at which we evaluate
% the signal.
dt = 1/100;
t = ( -T/2 : dt : +T/2 )';
Nt = length(t);

for N = Nvec

  k = ( -N : 1 : +N );

  % Define the sinc function that makes up the
  % series' weights. We need to catch the case
  % where the denominator is 0 and set it
  % to 1 (L'Hopital's rule).
  zinds = ( k == 0 );
  a = sin( k * 2*pi/T * T1 ) ./ (k*pi);
  a(zinds) = 1;

  % Define the terms in the approximation and sum
  % them. The below will make the kth term in the
  % sum the kth column in a matrix. Then we sum
  % the matrix across the columns.
  x = sum( repmat(a, Nt, 1) .* exp(1j .* repmat(k,Nt,1) .* 2*pi/T .* repmat(t,1,length(k))), 2 );

  % Plot the resulting approximation.
  hold on;
  plot( t, abs( x ), 'Color', [0 0 0] );
  title( sprintf( 'N = %d', N ) );

end