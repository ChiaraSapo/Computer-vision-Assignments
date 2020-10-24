%% Aurora Bertino S4399133
%% Chiara Saporetti S4798994
%% Silvana Civiletto S4834458

clear all
close all
clc

%% Add functions and text files
addpath('Functions');
addpath('Data/Rubik');
addpath('Data/Mire');



%% MIRE

%% Read input data
% Read the images
img1 = imread('Mire1.pgm');
img2 = imread('Mire2.pgm');

% Load points
p1 = load('Mire1.points')';
p2 = load('Mire2.points')';

% Define the points in 3D
N = length(p1(1,:)); 
p1 = [p1; ones(1,N)]; 
p2 = [p2; ones(1,N)];

%% Version 1 of the 8 points algorithm: simple
F1 = EightPointsAlgorithm(p1, p2);


%% Version 2 of the 8 points algorithm: with normalization
F2 = EightPointsAlgorithmN(p1, p2);


%% Evaluation of results: check epipolar contraints
res1 = zeros(N, 1);
for i = 1:N
    res1(i) = p2(:,i)' * F1 * p1(:,i);
end
disp("Results for the epipolar constraint with simple Eight Points Algorithm: \n");
disp(res1);

for i = 1:N
    res2(i) = p2(:,i)' * F2 * p1(:,i);
end
disp("Results for the epipolar constraint with Eight Points Algorithm with normalization: \n");
disp(res2);


%% Evaluation of results: show stereo pairs with epipolar lines of the corresponding points 
visualizeEpipolarLines(img1, img2, F1, p1(1:2,:)', p2(1:2,:)')
visualizeEpipolarLines(img1, img2, F2, p1(1:2,:)', p2(1:2,:)')


%% Evaluation of results: compute left and right epipoles
% The (right) null space of S is the columns of V corresponding to
% singular values equal to zero. 
% The left null space of S is the the columns of U corresponding 
% to singular values equal to zero, transposed. 

[U_t, S1, V] = svd(F1);
rightE = U_t(:,end);
leftE = V(:,end);
disp("The left and the right epipoles of the simple algorithm are:\n");
disp(leftE);
disp(rightE);

[U_t, S2, V] = svd(F2);
rightE = U_t(:,end);
leftE = V(:,end); 
disp("The left and the right epipoles of the normalized algorithm are:\n");
disp(leftE);
disp(rightE);



%% RUBIK

%% Read input data
% Read the images
img1 = imread('Rubik1.pgm');
img2 = imread('Rubik2.pgm');

% Load points
p1 = load('Rubik1.points')';
p2 = load('Rubik2.points')';

% Define the points in 3D
N = length(p1(1,:)); 
p1 = [p1; ones(1,N)]; 
p2 = [p2; ones(1,N)];

%% Version 1 of the 8 points algorithm: simple
F1 = EightPointsAlgorithm(p1, p2);


%% Version 2 of the 8 points algorithm: with normalization
F2 = EightPointsAlgorithmN(p1, p2);


%% Evaluation of results: check epipolar contraints
res1 = zeros(N, 1);
for i = 1:N
    res1(i) = p2(:,i)' * F1 * p1(:,i);
end
disp("Results for the epipolar constraint with simple Eight Points Algorithm: \n");
disp(res1);

for i = 1:N
    res2(i) = p2(:,i)' * F2 * p1(:,i);
end
disp("Results for the epipolar constraint with Eight Points Algorithm with normalization: \n");
disp(res2);


%% Evaluation of results: show stereo pairs with epipolar lines of the corresponding points 
visualizeEpipolarLines(img1, img2, F1, p1(1:2,:)', p2(1:2,:)')
visualizeEpipolarLines(img1, img2, F2, p1(1:2,:)', p2(1:2,:)')


%% Evaluation of results: compute left and right epipoles

[U_t, S1, V] = svd(F1);
rightE = U_t(:,end);
leftE = V(:,end);
disp("The left and the right epipoles of the simple algorithm are:\n");
disp(leftE);
disp(rightE);

[U_t, S2, V] = svd(F2);
rightE = U_t(:,end);
leftE = V(:,end); 
disp("The left and the right epipoles of the normalized algorithm are:\n");
disp(leftE);
disp(rightE);
