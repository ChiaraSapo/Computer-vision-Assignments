%% Read image
Img = imread('flower.jpg');

figure, imagesc(Img),title('Original flower')

% Parameters used for modifications
shiftX = 30; % shift columns
shiftY = 30; % shift rows
theta = 0; % rotation angle

%% Translation

translatedImg = transformation(Img, shiftX, shiftY, 0);

figure, imagesc(translatedImg),title('Translated flower')

%% Rotation

% For cycle to try different angles
for i=1:3 
    theta=theta+30;
    rotatedImg = transformation(Img, 0, 0, theta);

    figure, imagesc(rotatedImg), title('Rotated flower')
end