%% Select the red area in the image 'ur_c_s_03a_01_L_0376.png'and compute mean and standard deviation
    % input:  inputImg: input image
    % output: outputImg: Selected red car in the image 
    %         s: standard deviation computed on the selected area
    %         m: mean computed on the selected area

function [outputImg,m,s] = Select_area_red(inputImg)

         inputImg_hsv=rgb2hsv(inputImg);
         inputImg_hsv=inputImg_hsv(:,:,1);                                  %Take H component
         subplot(2,1,1),imshow(inputImg_hsv, []);
         title('Detected red car in Hue Image - H channel');
         hold on;
         axis on;
         
         rectangle('Position',[690,360,80,65],'EdgeColor', 'r');
         ret=imcrop(inputImg_hsv,[690,360,80,65]);                          %Cropped image 
         whos ret;
         whos inputImg_hsv;
         fprintf('Max=%f, min=%f\n', max(ret(:)), min(ret(:)));
         subplot(2,1,2),imshow(ret, []),title(['Cropped image']);
         
         m=mean2(ret);                                                      %Mean of all elements in the cropped image
         s=std2(ret);                                                      %Computes the standard deviation 
         outputImg=inputImg_hsv;
end