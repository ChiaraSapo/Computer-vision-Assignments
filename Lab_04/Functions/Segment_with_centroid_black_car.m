%% Segment the dark car in all the 6 images with centroid and bounding box     

    % input:  inputImg: input image
    % output: outputImg: Segmented dark car in the image with centroid
    
    
function [outputImg]=Segment_with_centroid_black_car(inputImg)

    inputImg=imread('ur_c_s_03a_01_L_0380.png');
    inputImg_hsv=rgb2hsv(inputImg);
    inputImg_hsv=inputImg_hsv(:,:,1);                                          %Take H component
    [rr,cc,pp]=size(inputImg_hsv);
    seg=zeros(rr,cc);                                 
    
    mask=inputImg_hsv > 0.4 &  inputImg_hsv < 0.9; 
    seg=seg+mask;
    
    BW2 = bwareaopen(seg,550);                                                 %Labeled image
    xc=600;
    yc=390;
    
    imagesc(BW2),colormap gray,title('black car with centroid')
    hold on
    plot(xc,yc,'*r')
    rectangle('Position',[555,360,90,60],'EdgeColor',[1,0,0])
    outputImg=BW2;
    
end