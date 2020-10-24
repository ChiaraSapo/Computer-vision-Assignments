%% Segment the red car in all the 6 images with centroid and bounding box     

    % input:  inputImg: input image
    % output: outputImg: Segmented red car in the image with centroid
    

function [outputImg]=Segment_with_centroid_red_car(inputImg)

         inputImg_hsv=rgb2hsv(inputImg);
         inputImg_hsv=inputImg_hsv(:,:,1);                                  %Take H component
         [rr,cc,pp]=size(inputImg_hsv);
         seg=zeros(rr,cc);              
         
         mask=inputImg_hsv > 0.97   &  inputImg_hsv < 1; 
         seg=seg+mask;
         
         BW2 = bwareaopen(seg,50);                                          %Labeled image
         prop=regionprops(BW2,'Area','Centroid','BoundingBox');
         
         xc=floor(prop(5).Centroid(1));
         yc=floor(prop(5).Centroid(2));
         ul_corner_width=prop(5).BoundingBox();                             %Maximun area
         
         imagesc(BW2),colormap gray,title('red car with centroid')
         hold on
         plot(xc,yc,'*r')
         rectangle('Position',ul_corner_width,'EdgeColor',[1,0,0])
         outputImg=BW2;    
         
end