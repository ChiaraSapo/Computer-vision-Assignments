%% Aurora Bertino S4399133
%% Chiara Saporetti S4798994
%% gaussianNoise: adds gaussian noise to the input image
    % input: Img: original image
    %        stdDev: standard deviation of the gaussian function
    % output: transfImg: noisy image
    %         hist: histogram of the gaussian function

function [transfImg,hist] = gaussianNoise(Img,stdDev)
    
    % Adds gaussian noise
    % X = randn(n) returns an n-by-n matrix of normally distributed 
    % random numbers
    transfImg=Img+stdDev*randn(size(Img)); 
    
    % Histogram of gaussian function
    hist=randn(1,100000);

end