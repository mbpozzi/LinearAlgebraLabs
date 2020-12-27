function [ PC_out ] = rotate_first_axis( PC, angle_deg )
%this is a matlab function that applies a rotation matrix to a point cloud
%inputs:    PC: 3xn matrix representing a pointcloud
%           angle_deg: rotation angle in degrees
%output:    PC_out, rotated point cloud

angle_rad = angle_deg *pi/180;

R = [1                  0                   0;
     0                  cos(angle_rad)      -sin(angle_rad);
     0                  sin(angle_rad)      cos(angle_rad)];

PC_out = R*PC;


end

