%% responseOfSingleFlower: finds the laplacian response of a sunflower and
%%                         its characteristic scale
    % input:  flower: input image
    %         sigma: standard deviation for laplacian of gaussian
    %         n: number of scales
    %         sigma_incr: value used to increment sigma
    % output: radii: set of sigmas used
    %         maxVal: maximum of each filtered image
    %         characteristicScale: characteristic scale 
    
function [radii,maxVal,characteristicScale]=responseOfSingleFlower(flower,sigma,n,sigma_incr)

    figure
    j=1;

    %% Filter cut image with LoG 
    for ii=1:n
        % Set filter size==flower size and apply it
        filt_size = size(flower); 
        LoG = sigma^2 * fspecial('log', filt_size, sigma);
        imFiltered = imfilter(flower, LoG, 'same', 'replicate');

        subplot(5,2,ii),surf(imFiltered),title(['Sigma' num2str(sigma)]);

        % Save max correnspondence in filtered image
        maxVal(ii)=max(abs(imFiltered(:))); 

        % Save current sigma then increment it
        radii(ii)=sigma; 
        sigma=sigma*sigma_incr;
        %sigma=sigma+0.5;
    end

    %% Compute characteristic scale
    [temp,indexMax]=max(maxVal);
    characteristicScale=radii(indexMax);

end