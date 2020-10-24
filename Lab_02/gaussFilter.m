%% Aurora Bertino S4399133
%% Chiara Saporetti S4798994
%% gaussFilter: applies the gaussian law-pass filter to the input image
    % input: Img: original image
    %        sigma: standard deviation of the Gaussian function
    % output: transfImg: filtered image
    %         h: gaussian filter
    
function [transfImg, h] = gaussFilter(Img, kSize)

    % Given kSize, we set sigma equal to the filter size / 6, since, from
    % theory: filter's half width = 3 sigma
    sigma=kSize/6; 

    % H = fspecial('gaussian',HSIZE,SIGMA) returns a rotationally
    % symmetric Gaussian lowpass filter  of size HSIZE with standard
    % deviation SIGMA (positive)
    h = fspecial('gaussian', kSize, sigma); 

    % Applies the gaussian filter to the image
    transfImg = imfilter(Img, h); 

end