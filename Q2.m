clc
close all
clear all
% System parameters
m1 = 700;       % kg
m2 = 90;        % kg
k1 = 62000;     % N/m
k2 = 570000;    % N/m
b1 = 500;      % N.s/m
b2 = 22500;     % N.s/m

A=[0           1                 0                          0;
    0          0              -k1/m1                     -b1/m1;
    0          0                 0                          1;
    k2/m2   b2/m2       (-(k1+k2)/m2)-(k1)/m1       (-(b1+b2)/m2)-(b1)/m1]
B1=[0 1/m1 0 1/m1+1/m2]'
B2=[0                 0;
    0                 0;
    0                 0;
    -k2/m2         -b2/m2]
C=[0 0 1 0]
D=0
sim('Q2p2')
figure(1)
plot(y)
grid on
%%
Aa=[A zeros(4,1); -C 0]
Ba=[B1 ;0]
Ca=[C 0]
p=[-220 -90 -30 -0.4+0.9*1i -0.4-0.9*1i]
k=acker(Aa,Ba,p)
k1=k(:,1:4)
k2=k(:,5)
%%
phio=ctrb(A',C');
alphaS=[poly([-220 -90 -30 -0.4+0.9*1i -0.4-0.9*1i])];
W=alphaS(1)*(A')^4+alphaS(2)*(A')^3+alphaS(3)*(A')^2+alphaS(4)*(A')+alphaS(5)*eye(4);
L=[0 0 0 1]*inv(phio)*W;
l=L'

sim('Q2part5')
figure(1)
subplot(4,1,1)
plot(xhat1,'b-')
hold on 
plot(x1,'k-')
grid on
ylabel('x1')
legend('estimated state','real state')
subplot(4,1,2)
plot(xhat2,'b-')
hold on 
plot(x2,'k-')
grid on
ylabel('x2')
legend('estimated state','real state')
subplot(4,1,3)
plot(xhat3,'b-')
hold on 
plot(x3,'k-')
grid on
ylabel('x3')
legend('estimated state','real state')
subplot(4,1,4)
plot(xhat4,'b-')
hold on 
plot(x4,'k-')
grid on
ylabel('x4')
legend('estimated state','real state')

