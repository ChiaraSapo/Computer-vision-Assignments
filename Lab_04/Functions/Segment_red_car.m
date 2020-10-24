%% Segment the red car in the 6 images by thresholding the Hue component
    % input:  inputImg: input image         
    % output: outputImg: red car in the image segmented by thresholding

function [outputImg]=Segment_red_car(inputImg)

    inputImg_hsv=rgb2hsv(inputImg);
    inputImg_hsv=inputImg_hsv(:,:,1);                %Take H component
    [rr,cc,pp]=size(inputImg_hsv);
    seg=zeros(rr,cc);     
    
    mask=inputImg_hsv > 0.97  &  inputImg_hsv < 1;    % we put 1 as superior extreme beacuse (m+s)=1.11, so it's > 1
    seg=seg+mask;
    
    imshow(seg,[]);
    title('red car by thresholding ');
    outputImg=seg;
    
    
end