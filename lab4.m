clear all; clc; close all;

%% Original Audio Signal

% Read Audio Signal
audio = audioread('Counting-16-44p1-mono-15secs.wav');
Fs = 44100; % Signal Sampling Rate
%soundsc(audio,Fs); % Audio Output: Listen


%% Loading Audio Signal
% Read Audio Signal
audio = audioread('Counting-16-44p1-mono-15secs.wav');

% Select 0.5 seconds
audio = audio(30000:49999);

% Downsample the signal
sample_rate = 10;
audio = downsample(audio, sample_rate);

Fs = 44100/sample_rate; % Signal Sampling Rate
%soundsc(audio,Fs); % Audio Output: Listen

%% Problem 1:

%%%%%%%%%%%%%%%%%%%%%%% TODO: Problem 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 2000;
audio_vec = audio(1:N);
st_basis = eye(N);
aug = [st_basis, audio_vec];
aug_rref = rref(aug);
rep = aug_rref(:,(N+1));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Problem 2:

%%%%%%%%%%%%%%%%%%%%%%% TODO: Problem 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 100;
D = dctmtx(N);
D_rref = rref(D);
rank = rank(D);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Problem 3:

%%%%%%%%%%%%%%%%%%%%%%% TODO: Problem 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 2000;
D = dctmtx(N);
for i = 1:N
    D_vec = D(:,i);
    %soundsc(D_vec,Fs);
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Problem 4:

%%%%%%%%%%%%%%%%%%%%%%% TODO: Problem 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rep = zeros(N);
rep = linsolve(D,audio);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Problem 5:

%%%%%%%%%%%%%%%%%%%%%%% TODO: Problem 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%High Frequency Filter
HighFilt = zeros(2000,1);
HighFilt = rep(1:N/2,1);
adjusted1 = D * HighFilt;
soundsc(adjusted1,Fs);

%Low Frequency Filter
LowFilt = zeros(2000,1);
LowFilt = rep(N/2:N,1);
adjusted2 = D * LowFilt;
soundsc(adjusted2,Fs);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%