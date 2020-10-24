%% blobDetection: finds the circles inside the input image
    % input:  image: input image
    %         sigma: standard deviation for laplacian of gaussian
    %         n: number of scales
    %         sigma_incr: value used to increment sigma
    % output: row: row coordinate at which the maxima are
    %         col: column coordinate at which the maxima are
    %         val: maxima values
    
function [row,col,val] = blobDetection (img, sigma, n, sigma_incr)
    
    [h,w]=size(img);
    scale_space = zeros(h,w,n);

    %% Build pyramid of scale space
    for ii=1:n
        filt_size =  2*ceil(3*sigma)+1; 
        LoG       =  sigma^2 * fspecial('log', filt_size, sigma); 
        imFiltered = imfilter(img, LoG, 'same', 'replicate');
        scale_space(:,:,ii)=abs(imFiltered);
        radii(ii)=sigma; %dimension
        sigma=sigma*sigma_incr;
    end


    %% Non-maxima suppression in scale-space
    v=2;
    vv=-v:v;
    scale_space_nomax  = zeros(h,w,n);
    
    % Scroll image then loop for non maxima suppression
    for ii=1:n 
        TMP=scale_space(:,:,ii); % fixed scale
        for hh=(1+v):1*v:(h-v)
            for ww=(1+v):1*v:(w-v) 
                tmp=TMP(hh+vv,ww+vv);
                [m,i]=max(tmp(:));
                a=zeros(length(vv));
                if m>55
                    a(i)=m; 
                end
                TMP(hh+vv,ww+vv)=a;
                scale_space_nomax(hh+vv,ww+vv,ii)=a;
            end
        end
        v=2*v;
        vv=-v:v;
    end

    %% Save desired values in blobs matrix
    blobs=zeros(h,w); 
    for ii=1:h
        for jj=1:w
            tmp=scale_space_nomax(ii,jj,:);
            [m,i]=max(tmp);
            if m>55
                blobs(ii,jj)=radii(i);
            end
        end
    end

    [row,col,val] = find(blobs);

end
