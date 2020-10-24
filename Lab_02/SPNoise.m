%% Aurora Bertino S4399133
%% Chiara Saporetti S4798994
%% SPNoise: adds salt and pepper noise to the input image
    % input: Img: original image
    %        density: density of the salt and pepper noise
    % output: transfImg: noisy image

function [transfImg] = SPNoise(Img,density)

    % Salt and pepper noise
    Img=double(Img);
    [rr,cc]=size(Img);
    maxv=max(max(Img)); % max intensity value of the img
    % R = sprand(m,n,density) is a random, m-by-n, sparse matrix with 
    % approximately density*m*n uniformly distributed nonzero entries 
    % (0 <= density <= 1).
    indices=full(sprand(rr,cc,density));
    
    % Sets mask1 and mask2
    mask1=indices>0 & indices<0.5;
    mask2=indices>=0.5; 
    
    % Applies the masks
    transfImg= Img.*(~mask1) ; 
    transfImg=transfImg.*(~mask2)+maxv*mask2; 

end
