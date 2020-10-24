
%% detectZeroCrossings: finds the edges in a given image with two for cycles
    % input:  inputImg: original input image
    %         threshold: maximum value for the laplacian
    % output: edgeImg: matrix in which the edges of the first image are saved 
    
function edgeImg=detectZeroCrossings(inputImg, threshold)
   
    [rr, cc]=size(inputImg);
    edgeImg=zeros(rr, cc);
    
    %% Scan rows
    for i = 2:rr
        for j= 2:cc-1
            
            % Transition {+,-}
            if (inputImg(i,j) > 0 && inputImg(i, j+1) < 0)
                if (abs(inputImg(i,j)-inputImg(i,j+1))) > threshold
                    edgeImg(i,j)=1;
                end
                
            % Transition {-,+}
            elseif (inputImg(i,j) < 0 && inputImg(i, j+1) > 0)
                if (abs(inputImg(i,j)-inputImg(i,j+1))) > threshold
                    edgeImg(i,j)=1;
                end
                
            elseif(inputImg(i,j)==0)
                
                %Transition{+,0,-}
                if (inputImg(i,j-1) > 0 && inputImg(i, j+1) < 0)
                    if (abs(inputImg(i,j-1)-inputImg(i,j+1))) > threshold
                        edgeImg(i,j)=1;
                    end
                    
                % Transition {-,0,+}
                elseif (inputImg(i,j-1) < 0 && inputImg(i, j+1) > 0)
                    if (abs(inputImg(i,j-1)-inputImg(i,j+1))) > threshold
                        edgeImg(i,j)=1;
                    end
                end
                
            end % else if == 0   
        end % for loop of cc   
    end % for loop of rr
    
    
    %% Scan columns
    for i = 2:rr-1
        for j= 2:cc
            
            % Transition {+,-}
            if (inputImg(i,j) > 0 && inputImg(i+1, j) < 0)
                if (abs(inputImg(i,j)-inputImg(i+1,j))) > threshold
                    edgeImg(i,j)=1;
                end
                
            % Transition {-,+}
            elseif (inputImg(i,j) < 0 && inputImg(i+1, j) > 0)
                if (abs(inputImg(i,j)-inputImg(i+1,j))) > threshold
                    edgeImg(i,j)=1;
                end
                
            elseif(inputImg(i,j)==0)
                
                %Transition{+,0,-}
                if (inputImg(i,j-1) > 0 && inputImg(i+1, j) < 0)
                    if (abs(inputImg(i-1,j)-inputImg(i+1,j))) > 0
                        edgeImg(i,j)=1;
                    end
                    
                % Transition {-,0,+}
                elseif (inputImg(i-1,j) < 0 && inputImg(i+1, j) > 0)
                    if (abs(inputImg(i-1,j)-inputImg(i+1,j))) > threshold
                        edgeImg(i,j)=1;
                    end
                end
            end
            
        end
    end
    
    
end