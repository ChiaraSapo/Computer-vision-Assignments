%% Aurora Bertino S4399133
%% Chiara Saporetti S4798994

addpath('Functions');
addpath('Input');

close all
clear all



%%%%%%%%%%%%% NCC

%% From previous Lab
centerCoordinatesRed = [730, 386];
centerCoordinatesDark = [596, 390];

%% Initial dimensions of the template
dimDark=[50,30];

%% Read first image
ImgGray1=rgb2gray(imread('ur_c_s_03a_01_L_0376.png'));

%% Cycle for different template sizes
for i=1:3
    
    %% Create red template
    if i==1
        TemplateRed=ImgGray1(centerCoordinatesRed(2)-45:centerCoordinatesRed(2)+45,centerCoordinatesRed(1)-45:centerCoordinatesRed(1)+45);
        figure,imshow(TemplateRed), title(['Template red with dimension=' num2str(90) 'x' num2str(90)]);
    end
    
    %% Create dark template
    TemplateDark=ImgGray1(centerCoordinatesDark(2)-dimDark(2):centerCoordinatesDark(2)+dimDark(2),centerCoordinatesDark(1)-dimDark(1):centerCoordinatesDark(1)+dimDark(1));
    figure,imshow(TemplateDark), title(['Template dark with dimension=' num2str(dimDark(1)) 'x' num2str(dimDark(2))]);
    
    %% Save template size
    pixels(i)=size(TemplateDark,1)*size(TemplateDark,2);
    
    %% Cycle to apply NCC to all images
    figure
    for j=1:6
        
        %% Create unified image
        name = strcat('ur_c_s_03a_01_L_0', num2str(375+j),'.png');
        ImgRGB(:,:,:,j) = imread(name);
        ImgGray(:,:,j) = rgb2gray(ImgRGB(:,:,:,j));    
        
        %% Look for red template
        if i==1
            [xCornerMin, yCornerMin, width, height]=applyTemplate(ImgGray(:,:,j),TemplateRed);
        end
        
        %% Look for dark template and save computational time
        tic
        [xCornerMin2, yCornerMin2, width2, height2]=applyTemplate(ImgGray(:,:,j),TemplateDark);
        timePassedTemp(j)=toc;
        
        %% Show rectangles on images
        subplot(2,3,j),imshow(ImgGray(:,:,j))
        hold on, rectangle('Position',[xCornerMin, yCornerMin, width, height],'EdgeColor','r');
        hold on, rectangle('Position',[xCornerMin2, yCornerMin2, width2, height2],'EdgeColor','b');
        
        %% Show the maxima
        hold on, plot(xCornerMin+width/2,yCornerMin+height/2,'x','Color','r');    
        hold on, plot(xCornerMin2+width2/2,yCornerMin2+height2/2,'x','Color','b');
        
        %% Show maxima computed in Lab04
%         hold on, plot(centerCoordinatesRed(1),centerCoordinatesRed(2),'x','Color','g');    
%         hold on, plot(centerCoordinatesDark(1),centerCoordinatesDark(2),'x','Color','g');
        
    end
    
    %% Take mean of computational time
    timePassed(i)= mean(timePassedTemp);

    %% Increment dimensions of the template
    dimDark=dimDark*1.2;
    
end

%% Plot time wrt size of the template
%figure,plot(pixels/1000,timePassed),xlabel('Pixels'),ylabel('Time in sec')%,axis([7, 20, 0, 1.5])




%%%%%%%%%%%% Harris corner detection

%% Harris corner detector
tmp=imread('i235.png','png');
I=double(tmp);

%% Apply Harris corner detector
[max]=Harris_detector_value_max(I);

%% Apply Harris corner detector by also setting threshold
[edge_img,flat_img,corner_img,R_image]=Harris_detector_threshold(I,max);

%% Show results
figure,imagesc(edge_img.*I),colormap gray,title('edge regions')
figure,imagesc(R_image),colormap jet,title('R map')

%% Compute and show corner regions
BW=bwlabel(corner_img.*I);
props = regionprops(BW,'centroid');
figure,imagesc(I),colormap gray,title('corner regions')
hold on;

for  k = 1 : length(props)
    % Get x and y centroid of the k-th blob.
    xc = props(k).Centroid(1);
    yc = props(k).Centroid(2);
    plot(xc,yc,'*r')
end
