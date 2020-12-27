function C = covariance(X)
    [m,n] = size(X);
    mean = 1/n * sum(X,2);
    M = repmat(mean,1,n);
    y = X - M;    
    Y = y * y';
    C = 1/n * Y;

end
    