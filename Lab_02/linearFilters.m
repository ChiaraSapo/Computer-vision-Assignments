%% Aurora Bertino S4399133
%% Chiara Saporetti S4798994
%% linearFilters: applies three different filters to the input image. 
    % The filters: 1) Impulse f; 2) Shifted impulse f; 3) Sharpening f;
    % input: Img: original image
    %        kSize: size of the kernel
    % output: transfImg1: image filtered with K1
    %         K1: first filter
    %         transfImg2: image filtered with K2
    %         K2: second filter
    %         transfImg3ver1: image filtered with K3, first version from 
    %                         slide 45
    %         transfImg3ver2: image filtered with K3, second version from 
    %                         slide 44   
    %         K3: third filter

function [transfImg1, K1, transfImg2, K2, transfImg3ver1, transfImg3ver2, K3] = linearFilters(Img,kSize)
    
    % Creates the filter kernel 
    K=zeros(kSize);
    % Finds the middle of the kernel matrix
    middleIndex = ceil(kSize/2);
    
    %% Impulse filter 
    
    % Creates matrix
    K1=K;
    K1(middleIndex, middleIndex)=1;
    
    % Applies filter
    % C = conv2(A,B,shape) returns a subsection of the convolution according 
    % to shape. C = conv2(A,B,'same') returns the central part 
    % of the convolution, which is the same size as A.
    transfImg1 = conv2(Img, K1, 'same');
    
    %% Shifted impulse filter
    
    % Creates matrix
    K2=K;
    K2(middleIndex, kSize)=1;
    
    % Applies filter
    transfImg2 = conv2(Img, K2, 'same');
    
    %% Sharpening
    
    % Creates matrix
    K3=K;
    K3(middleIndex, middleIndex)=2;
    K3 = K3 - ones(kSize)/(kSize^2);
    
    % Applies filter K3, version 2
    transfImg3ver1 = conv2(Img, K3, 'same'); % from slide 44
    
    % Applies filter K3 with a=0.1, version 1
    transfImg3ver2 = Img + 0.1*(Img - conv2(Img, K3, 'same')); % from slide 45
    
end
