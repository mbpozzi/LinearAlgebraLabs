syms x1 x2 x3 x4
eq1 = 3*x1 + 2*x2 + 3*x3 - 2*x4 == 1
eq2 = x1 + 2*x2 +x3 == 3 
eq3 = x1 + 2*x2 + x3 - x4 == 2

[A, b] = equationsToMatrix([eq1 eq2 eq3], [x1, x2, x3, x4])
M = [A,b]
rref(M)



%%
syms t u v w x y z; 
eq1 = t - x - w == 100;
eq2 = t - u == 100;
eq3 = w + v - y + z == 0;
eq4 = u + v == 40;
eq5 = t == 100;
eq6 = w + y + z == 100;
eq7 = x + y + z == 240;
[A, b] = equationsToMatrix([eq1 eq2 eq3 eq4 eq5 eq6 eq7], [t, u, v, w, x, y, z]);
X = [A,b]
X1 = rref(X);

%%
syms r s t u v w;
eq1 = t + s - w == 80;
eq2 = u + r - t == -30;
eq3 = v - r + w == 50;
eq4 = -u - s - v == -100;
[A, b] = equationsToMatrix([eq1 eq2 eq3 eq4], [r, s, t, u, v, w]);
Y = [A, b];
Y1 = rref(Y)