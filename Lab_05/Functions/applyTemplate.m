%% applyTemplate: applies ncc to input image using the template
    % input:  inputImg: original input image
    %         Template: patch to look for
    % output: xCornerMin: x coordinate of bottom left corner of result
    %         yCornerMin: y coordinate of bottom left corner of result
    %         width of result
    %         height of result

function [xCornerMin, yCornerMin, width, height] = applyTemplate(inputImg,Template)
   
    %% Apply NCC
    c=normxcorr2(Template,inputImg);
    
    %% Find maximum correspondence
    [y, x] = find(c==max(c(:)));

    %% Elements to build rectangle: corners and sizes
    xCornerMin = x-size(Template,2);
    yCornerMin = y-size(Template,1);
    width = size(Template,2);
    height = size(Template,1);
   

end