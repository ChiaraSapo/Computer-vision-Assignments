%% Transformation: applies a translation and/or rotation to the input image
    % input: inputImg: original image to warp
    %        Xtrans: shift on rows
    %        Ytrans: shift on columns
    %        theta: rotation angle
    % output: warped image
    
function [transfImg] = transformation(inputImg, Xtrans, Ytrans, theta)
    % Transformation matrix composed of a rotation around theta and a
    % translation of v: T = [R(theta)   0
    %                        v          1]
    TransfMatrix=[cosd(theta)     -sind(theta)   0;
                  sind(theta)      cosd(theta)   0;
                    Xtrans          Ytrans       1];
                
    % affine2d function stores information about a 2-D affine geometric 
    % transformation TransfMatrix and enables forward and inverse 
    % transformations. Here it's useful since we'll need the inverse
    % transformation for the backward warping
    T = affine2d(TransfMatrix);

    % Create the matrix that will store the new values (initially set 
    % all values to zero)
    temp = zeros(size(inputImg));

    % For loop used to apply the transformation to X,Y on the three 
    % different color levels separately
    for i=1:size(inputImg,3)
        [row,col] = size(inputImg(:,:,i));
        
        % meshgrid function returns 2D grid coordinates based on the 
        % coordinates contained in the input vectors x and y
        [X,Y] = meshgrid(1:col,1:row);

        % Shift the center
        Xc = X - floor(col/2); 
        Yc = Y - floor(row/2);

        % transformPointsInverse function applies the inverse 
        % transformation of the 2-D geometric transformation 
        % tform (here T) to the points specified by coordinates x and y
        [Xr,Yr] = transformPointsInverse(T,Xc,Yc);

        % Shift the center back to original position
        Xr=Xr+floor(col/2);
        Yr=Yr+floor(row/2);

        % griddata function fits a surface of the form v = f(x,y),
        % here double(inputImg(:,:,i)), to the scattered data in the 
        % vectors (X,Y). It interpolates the surface at the points 
        % specified by (Xr,Yr) and returns the interpolated values
        temp(:,:,i) = griddata(X,Y,double(inputImg(:,:,i)),Xr,Yr,'linear');
    end
    
    % Unify the three channels with cat function and cast to unit8
    transfImg = uint8(cat(3,  temp(:,:,1),   temp(:,:,2),   temp(:,:,3)));
    
end