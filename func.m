function [A, b] = func(x, B)
    N = length(x);
    A = zeros(N-B, B);
    c = B;
    for j = 1:B
        for y = 1:(N-B)
            A(y,j) = x(c);
            c = c + 1;
        end 
        c = B - j;
    end
    b = zeros(N-B, 1);
    for i = 1:N-B
        b(i, 1) = x(i+B,1);
    end
end