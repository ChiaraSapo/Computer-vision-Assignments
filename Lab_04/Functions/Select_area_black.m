%% Select the dark area in the input image and compute mean and standard deviation
    % input:  inputImg: input image
    % output: outputImg: Selected black car in the image 
    %         s: standard deviation computed on the selected area
    %         m: mean computed on the selected area

function [outputImg,m,s] = Select_area_black(inputImg)
         
         inputImg_hsv=rgb2hsv(inputImg);
         inputImg_hsv=inputImg_hsv(:,:,1);                                  %Take H component
         subplot(2,1,1),imshow(inputImg_hsv, []);
         title(' Detected black car in Hue Image - H channel');
         hold on;
         axis on;
         
         rectangle('Position',[555,360,90,60],'EdgeColor', 'r');
         ret=imcrop(inputImg_hsv,[555 360 90 60]);                          %Cropped image 
         whos ret;
         whos inputImg_hsv;
         fprintf('Max=%f, min=%f\n', max(ret(:)), min(ret(:)));
         subplot(2,1,2),imshow(ret, []),title(['Cropped image']);
         
         m=mean2(ret);                                                      %Mean of all elements in the area
         s=std2(ret);                                                       %Standard deviation 
         outputImg=inputImg_hsv;

end
