clc; clear all; close all;
load('bunny.mat')


%% Visualize PC
figure(1);
scatter3(P(1,:), P(2,:), P(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');

%% Problem 1:
S = eye(3);
s = .01;
scaling1 = s*S;
Scaled1 = scaling1 * P;
figure(2);
scatter3(Scaled1(1,:), Scaled1(2,:), Scaled1(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');

s = 5;
scaling2 = s * S;
Scaled2 = scaling2 * P;
figure(3);
scatter3(Scaled2(1,:), Scaled2(2,:), Scaled2(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');

scaling3 = eye(3);
s3 = [0, .2, 5, -1];
for i = 1:1:4;
    scaling3(3,3) = s3(1,i);
    Scaled3 = scaling3 * P;
    figure((i+3));
    scatter3(Scaled3(1,:), Scaled3(2,:), Scaled3(3,:),3,Color,'filled');
    xlabel('x axis');
    ylabel('y axis');
    zlabel('z axis');
end

%% Problem 2:
%1/2
PC = rotate_first_axis(P,90);
figure(8);
scatter3(PC(1,:), PC(2,:), PC(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');

PC = rotate_first_axis(P,180);
figure(9);
scatter3(PC(1,:), PC(2,:), PC(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');

PC = rotate_second_axis(P,90);
figure(10);
scatter3(PC(1,:), PC(2,:), PC(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');

PC = rotate_second_axis(P,180);
figure(11);
scatter3(PC(1,:), PC(2,:), PC(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');

PC = rotate_third_axis(P,90);
figure(12);
scatter3(PC(1,:), PC(2,:), PC(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');

PC = rotate_third_axis(P,180);
figure(13);
scatter3(PC(1,:), PC(2,:), PC(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');

%3
phi = 90;
theta = 180;
PC1 = rotate_first_axis(P,phi);
PC2 = rotate_first_axis(PC1,theta);
PC3 = rotate_first_axis(P, (phi+theta));
figure(14);
scatter3(PC2(1,:), PC2(2,:), PC2(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');
figure(15);
scatter3(PC3(1,:), PC3(2,:), PC3(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');

%4
PC = rotate_second_axis(P,theta);
PC_41 = rotate_first_axis(PC, phi);
PC = rotate_first_axis(P,phi);
PC_42 = rotate_second_axis(PC, theta);
figure(16);
scatter3(PC_41(1,:), PC_41(2,:), PC_41(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');
figure(17);
scatter3(PC_42(1,:), PC_42(2,:), PC_42(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');

%% Problem 3:
PC = pointcloud_modification(P);
figure(19);
scatter3(PC(1,:), PC(2,:), PC(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');

e1 = [1 0 0]';
e2 = [0 1 0]';
e3 = [0 0 1]';

a1 = pointcloud_modification(e1);
a2 = pointcloud_modification(e2);
a3 = pointcloud_modification(e3);
A = [a1, a2, a3];



Z = A * P;
figure(20);
scatter3(Z(1,:), Z(2,:), Z(3,:),3,Color,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');