%% Segment the red car in the 6 images by thresholding the Hue component, values given
    % input:  inputImg: input image
    %         s: standard deviation computed in Select_area_red
    %         m: mean computed in Select_area_red
    % output: outputImg: red car in the image segmented by thresholding
    

function [outputImg]=Segment_red_car_ms(inputImg,m,s)

    inputImg_hsv=rgb2hsv(inputImg);
    inputImg_hsv=inputImg_hsv(:,:,1);                     %Take H component
    [rr,cc,pp]=size(inputImg_hsv);
    seg=zeros(rr,cc);     
    
    mask=inputImg_hsv > (m-s)  &  inputImg_hsv < (m+s);    % we put 1 as superior extreme beacuse (m+s)=1.11, so it's > 1
    seg=seg+mask;
    
    imshow(seg,[]);
    title('red car by thresholding ms');
    outputImg=seg;
    
    
end