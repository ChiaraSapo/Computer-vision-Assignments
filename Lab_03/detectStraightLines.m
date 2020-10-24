%% detectStraightLines: by using the hough transform, the function dectes 
%% the straight lines in a given image
    % input:  inputImg: original input image
    %         peaksNumber: number of peaks to look for with houghpeaks() fctn
    %         NHoodSize: neighborhood around each peak that is set to zero 
    %                    after the peak is identified
    % output: straightLines: hough lines found with houghlines() fctn
    
function straightLines=detectStraightLines(inputImg, peaksNumber,NHoodSize,threshold)

    hold on
    inputImg=double(inputImg);
    [rr,cc]=size(inputImg);

    %% Edge detection with sobel operator
    BW = edge(inputImg,'sobel');
    %figure,imshow(BW),title('Edge detection with sobel operator')

    %% Hough transform
    [H,T,R] = hough(BW);
    %figure,imagesc(H),colormap pink,title('Hough transformation matrix') % from here we want to take the maxima
    
    %% Identify peaks in Hough transform
    if NHoodSize==0
        P = houghpeaks(H,peaksNumber);
        subplot(2,1,1),imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit'),title([num2str(peaksNumber),' peaks in hough matrix'])
        colormap pink, xlabel('\theta'), ylabel('\rho'), axis on, axis normal, hold on;
    else
        P = houghpeaks(H,peaksNumber,'NHoodSize',[NHoodSize NHoodSize]); 
        subplot(2,1,1),imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit'),title([num2str(peaksNumber),' peaks in hough matrix, with neighborhood size=', num2str(NHoodSize)])
        colormap pink, xlabel('\theta'), ylabel('\rho'), axis on, axis normal, hold on;
    end
    
    %% Find and plot the peaks
    x = T(P(:,2)); y = R(P(:,1));
    plot(x,y,'s','color','yellow')

    %% Compute and plot the straight lines 
    threshold=70;
    subplot(2,1,2), imshow(BW), 
    title('straight lines on image edges found with sobel'),hold on
    for k=1:length(P)
        if T(P(k,2))>-threshold && T(P(k,2))<threshold
            x1=R(P(k,1))/cos(deg2rad(T(P(k,2)))) - 1*tan(deg2rad(T(P(k,2))));
            x2=R(P(k,1))/cos(deg2rad(T(P(k,2)))) - cc*tan(deg2rad(T(P(k,2))));
            plot([x1,x2],[1 cc],'LineWidth',2,'Color','yellow');
        else
            y1=R(P(k,1))/sin(deg2rad(T(P(k,2)))) - 1/tan(deg2rad(T(P(k,2))));
            y2=R(P(k,1))/sin(deg2rad(T(P(k,2)))) - rr/tan(deg2rad(T(P(k,2))));
            plot([1,rr],[y1 y2],'LineWidth',2,'Color','red');
        end
    end
    
    %% Compute the hough lines segments
    straightLines = houghlines(BW,T,R,P,'FillGap',10,'MinLength',30); 

end
