syms y(t)
syms x(t)
sys = tf(1,1);
Dy = diff(y);
ODE = diff(y, t, 2) + 3*diff(y, t, 1) + 2*y == 5*step(sys);
c1 = (y(0) == 1);
c2 = (Dy(0) == 1);
y_solution(t) = dsolve(ODE, [c1 c2]);
y_simple = simplify(y_solution);
disp(y_simple);

figure;
ts = 0 : 0.1 : 10;
plot(ts, y_simple(ts));
grid on

title('Solution of Differential Equation');
xlabel('Time (t)');
ylabel('Response (y(t))');