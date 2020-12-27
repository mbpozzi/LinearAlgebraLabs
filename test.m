syms e k n m B
first = n*log(n);
second = ((n/2) + (e/(2*m*B))) * log((n/2) + (e/(2*m*B)));
third = ((n/2) - (e/(2*m*B))) * log((n/2) - (e/(2*m*B)));
S = k * (first - second - third);
Sp = diff(S,e);
k*(log(n/2 - e/(2*B*m))/(2*B*m) - log(n/2 + e/(2*B*m))/(2*B*m))