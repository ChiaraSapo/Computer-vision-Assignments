%% Aurora Bertino S4399133
%% Chiara Saporetti S4798994
%% linearFilters: applies the moving average filter to the input image
    % input: Img: original image
    %        kSize: size of the kernel
    % output: transfImg1: image filtered with K1
    %         K1: first filter
    %         transfImg2: image filtered with K2
    %         K2: second filter
    %         transfImg3: image filtered with K3
    %         K3: third filter
    %         detail: middles step in the third filtering

function [transfImg,K] = movingAverageFilter(Img,kSize)
    
    % Adds a border to the image
    % B = padarray(A,padsize,padval) pads array A where padval specifies 
    % a constant value to use for padded elements or a method to replicate
    % array elements.
    paddedImg = padarray(Img,[kSize kSize],1);

    % Applies the filter to the padded image
    K=ones(kSize)/((kSize)^2);
    tempTransfImg=conv2(paddedImg,K,'same');
    
    % Cuts again the image
    transfImg=tempTransfImg((kSize:end-kSize),(kSize:end-kSize));
    
end