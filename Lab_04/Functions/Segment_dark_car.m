%% Segment the dark car in the 6 images by thresholding the Hue component
    % input:  inputImg: input image
    %         s: standard deviation computed in Select_area_black
    %         m: mean computed in Select_area_black
    % output: outputImg: dark car in the image segmented by thresholding
    
function [outputImg]=Segment_dark_car(inputImg,m,s)

    inputImg_hsv=rgb2hsv(inputImg);
    inputImg_hsv=inputImg_hsv(:,:,1);                   %Take H component
    [rr,cc,pp]=size(inputImg_hsv);
    seg=zeros(rr,cc);             
    
    mask=inputImg_hsv > (m-s)  &  inputImg_hsv < (m+s);  % Create mask
    seg=seg+mask;
    
    imshow(seg,[]);
    title('dark car by thresholding');
    outputImg=seg;

end