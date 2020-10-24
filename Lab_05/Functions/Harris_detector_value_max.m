%% Harris_detector_value max
   % This function applies the Harris corner detector algorithm in order to
   % compute the value max.
   % input:  sigma: InputImage
   % output: valore_max

function [valore_max]=Harris_detector_value_max(InputImage)
         
         %compute x and y derivative of the image
         dx=[1 0 -1; 2 0 -2; 1 0 -1];
         dy=[1 2 1; 0  0  0; -1 -2 -1];
         Ix=conv2(InputImage,dx,'same');
         Iy=conv2(InputImage,dy,'same');
         figure,imagesc(Ix),colormap gray,title('Ix')
         figure,imagesc(Iy),colormap gray,title('Iy')
         
         %compute products of derivatives at every pixel
         Ix2=Ix.*Ix; Iy2=Iy.*Iy; Ixy=Ix.*Iy;
         
         %compute the sum of products of  derivatives at each pixel
         g = fspecial('gaussian', 9, 1.2);                                 %we can construct the structure tensor M
         figure,imagesc(g),colormap gray,title('Gaussian')
         Sx2=conv2(Ix2,g,'same'); Sy2=conv2(Iy2,g,'same'); Sxy=conv2(Ixy,g,'same');
         
         %features detection
         [rr,cc]=size(Sx2);
         edge_reg=zeros(rr,cc); corner_reg=zeros(rr,cc); flat_reg=zeros(rr,cc);
         R_map=zeros(rr,cc);
         k=0.05;

        for ii=1:rr
          for jj=1:cc
          %define at each pixel x,y the matrix
          M=[Sx2(ii,jj),Sxy(ii,jj);Sxy(ii,jj),Sy2(ii,jj)];
          %compute the response of the detector at each pixel
          R=det(M) - k*(trace(M).^2);    %R=1.72                %trace(M) is a sum of diagonal elements
          R_map(ii,jj)=R;                                       %R=cornerness, K=constant (0.04 to 0.06)
       
     end
        
  valore_max=max(max(R_map));                                   %maximum value  
  
        end