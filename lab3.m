load('network1.mat');
%% Problem 1
u2 = [0 0 1 0 0 0]';
n = 10;
for i = 1:n
    u2 = S_small * u2;
end

u3 = [1 0 0 0 0 0]';
for i = 1:n
    u3 = S_small * u3;
end

u4 = [0 0 0 0 0 1]';
for i = 1:n
    u4 = S_small * u4;
end

%% Problem 2
T = (1/6)*ones(6,6);
u2 = [0 0 1 0 0 0]';
n = 10;
for i = 1:n
    u2 = T * u2;
end

u3 = [1 0 0 0 0 0]';
for i = 1:n
    u3 = T * u3;
end

u4 = [0 0 0 0 0 1]';
for i = 1:n
    u4 = T * u4;
end

%% Problem 3
alpha = .85;
P = alpha*S_small + (1 - alpha)*T;
u2 = [0 0 1 0 0 0]';
n = 10;
for i = 1:n
    u2 = P * u2;
end

u3 = [1 0 0 0 0 0]';
for i = 1:n
    u3 = P * u3;
end

u4 = [0 0 0 0 0 1]';
for i = 1:n
    u4 = P * u4;
end

%% Problem 4 
load('network2.mat');
T = ones(803, 803)/803;
u = zeros(803, 1);
u(1) = 1;
P =(.85) * S + (1-.85) * T;
n = 1000;
for i = 1:n
    u = P * u;
end

A = sort(u, 'descend');
 
t = 10;
top_ten = zeros(10, 1);
for j = 1:t
    top_ten(j) = A(j);
 end
