%% Takes an image and warps it with the data contained in XD, YD
    % input: inputImg: original image to warp
    %        Xwarp: values to sum to X
    %        Ywarp: values to sum to Y
    % output: warped image
    
function [transfImg] = warping(inputImg,Xwarp,Ywarp)

    % Create the matrix that will store the new values (initially set 
    % all values to zero)
    temp = zeros(size(inputImg));
    
    % For loop used to apply the transformation to X,Y on the three 
    % different color levels separately
    for i=1:size(inputImg,3)
        
        % meshgrid function returns 2D grid coordinates based on the 
        % coordinates contained in the input vectors x and y
        [rr,cc] = size(inputImg(:,:,i));
        [X,Y] = meshgrid(1:cc,1:rr);
               
        % Shift the center
        Xc = X - floor(cc/2); 
        Yc = Y - floor(rr/2);
        
        % Add the given data
        Xr = Xc + Xwarp;
        Yr = Yc + Ywarp;
        
        % Shift the center back to original position
        Xr=Xr+floor(cc/2);
        Yr=Yr+floor(rr/2);

        % griddata function fits a surface of the form v = f(x,y),
        % here double(inputImg(:,:,i)), to the scattered data in the 
        % vectors (X,Y). It interpolates the surface at the points 
        % specified by (Xr,Yr) and returns the interpolated values
        temp(:,:,i) = griddata(X,Y,double(inputImg(:,:,i)),Xr,Yr,'linear');
    end 
    
    % Unify the three channels with cat function and cast to unit8
    transfImg = uint8(cat(3,  temp(:,:,1),   temp(:,:,2),   temp(:,:,3)));

end