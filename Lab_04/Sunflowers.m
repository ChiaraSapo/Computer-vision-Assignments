addpath('Functions');
addpath('Input');

close all
clear all

%% Read image
img=imread('sunflowers.png');

%% Data
sigma=5;
n=10;
sigma_incr=1.5;

%% Flowers 
% Portion of the image in which the flower is located
flower1=img(340:385,145:190,:);
% Coordinates of center the flower on the image
flower1Coord=[165,362];

flower2=img(340:420,420:500,:);
flower2Coord=[457,386];

%% Flower 1
[radii,maxVal,characteristicScale]=responseOfSingleFlower(flower1,sigma,n,sigma_incr);

% Plot laplacian response
figure,subplot(2,1,1),plot(radii,maxVal), hold on, title(['Laplacian response'])%, axis([5, 11, 40, 60])
xlabel(['Scale']), ylabel(['Laplacian response'])

subplot(2,1,2),plot(radii,maxVal),axis([5, 11, 40, 60]), title(['Characteristic scale=' num2str(characteristicScale)]);
hold on, plot(characteristicScale,max(maxVal),'x');

% Show circle on image with characteristic scale
figure,imshow(img); hold on;
cx1 = flower1Coord(1);
cy1 = flower1Coord(2);
rad1 = characteristicScale;
theta = 0:0.1:(2*pi+0.1);
X = cx1+cos(theta).*rad1;
Y = cy1+sin(theta).*rad1;
hold on, plot(X', Y', 'Color', 'y','LineWidth',1), title(['Characteristic scale=' num2str(characteristicScale)]);


%% Flower 2
%sigma=3;
sigma=11;
n=10;
sigma_incr=1.5;
[radii2,maxVal2,characteristicScale2]=responseOfSingleFlower(flower2,sigma,n,sigma_incr);

% Plot laplacian response
figure,subplot(2,1,1),plot(radii2,maxVal2), hold on, title(['Laplacian response'])%,axis([10.5, 16, 65, 80])
xlabel(['Scale']), ylabel(['Laplacian response'])
subplot(2,1,2),plot(radii2,maxVal2),axis([14, 18, 65, 80]), title(['Characteristic scale=' num2str(characteristicScale2)]);
hold on, plot(characteristicScale2,max(maxVal2),'x');

% Show circle with characteristic scale
figure,imshow(img); hold on;
cx1 = flower2Coord(1);
cy1 = flower2Coord(2);
rad1 = characteristicScale2;
theta = 0:0.1:(2*pi+0.1);
X = cx1+cos(theta).*rad1;
Y = cy1+sin(theta).*rad1;
hold on, plot(X', Y', 'Color', 'y','LineWidth',1), title(['Characteristic scale=' num2str(characteristicScale2)]);
