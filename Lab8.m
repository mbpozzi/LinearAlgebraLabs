load('temp_data.mat');
figure(1);
plot(daily_temp);
B = 7;
n_days_sum = sum(ndays(1:16));
daily_temp_15 = daily_temp(1:n_days_sum);
[A, b] = func(daily_temp_15, B);
Beta = zeros(B, 1);
Aprime = A' * A;
Aip = inv(Aprime);
bprime = A' * b;
Beta = Aip * bprime;
pred = A * Beta;
error = pred - b;

figure(2);
plot(b);
figure(3);
plot(A * Beta);
figure(4);
plot(error);

%% Problem 5 
C_2016 = daily_temp(n_days_sum:sum(ndays));
[C, d] = func(C_2016, B);
Beta_2 = zeros(B, 1);
Cprime = C' * C;
Cip = inv(Cprime);
dprime = C' * d;
Beta = Cip * dprime;
pred_2 = C * Beta;

figure(5);
plot(d);
figure(6);
plot(pred_2);
figure(7);
plot(pred_2 - d);

%% Problem 6 
% 1 
B_vec = [1:10];
Error_vec = zeros(10,1);
for n = 1:10
    [A, b] = func(daily_temp_15, B_vec(n));
    Beta = zeros(B, 1);
    Aprime = A' * A;
    Aip = inv(Aprime);
    bprime = A' * b;
    Beta = Aip * bprime;
    Pred = A*Beta - b;
    Error_vec(n) = Pred' * Pred / (length(daily_temp_15) - B_vec(n));
end 
figure(8);
plot(B_vec, Error_vec);
% 2 
Error_vec2 = zeros(10,1);
for n = 1:10
    [C, d] = func(C_2016, B_vec(n));
    Cprime = C' * C;
    Cip = inv(Cprime);
    dprime = C' * d;
    Beta = Cip * dprime;
    err1 = C * Beta - d;
    Error_vec2(n) = err1' * err1 / (366);
end 
figure(9);
plot(B_vec, Error_vec2);