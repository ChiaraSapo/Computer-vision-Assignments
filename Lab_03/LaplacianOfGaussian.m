%% LaplacianOfGaussian: computes the laplacian of a Gaussian, given the stdDev
    % input:  sigma: standard deviation of the Gaussian function
    % output: laplacian: laplacian of the function
    
function [laplacianFctn,kSize]=LaplacianOfGaussian(stdDev) 

    %% Create grid
    kSize=ceil(stdDev*3); 
    [X,Y]=meshgrid(-kSize:kSize);

    %% Compute LoG:
    laplacianFctn=(1/(2*pi*stdDev^2))*((X.^2+Y.^2 -2*stdDev^2)/stdDev^4).*exp(-(X.^2+Y.^2)/(2*stdDev^2));

end