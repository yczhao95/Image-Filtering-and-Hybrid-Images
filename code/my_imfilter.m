function output = my_imfilter(image, filter)
% This function is intended to behave like the built in function imfilter()
% See 'help imfilter' or 'help conv2'. While terms like "filtering" and
% "convolution" might be used interchangeably, and they are indeed nearly
% the same thing, there is a difference:
% from 'help filter2'
%    2-D correlation is related to 2-D convolution by a 180 degree rotation
%    of the filter matrix.

% Your function should work for color images. Simply filter each color
% channel independently.

% Your function should work for filters of any width and height
% combination, as long as the width and height are odd (e.g. 1, 7, 9). This
% restriction makes it unambigious which pixel in the filter is the center
% pixel.

% Boundary handling can be tricky. The filter can't be centered on pixels
% at the image boundary without parts of the filter being out of bounds. If
% you look at 'help conv2' and 'help imfilter' you see that they have
% several options to deal with boundaries. You should simply recreate the
% default behavior of imfilter -- pad the input image with zeros, and
% return a filtered image which matches the input resolution. A better
% approach is to mirror the image content over the boundaries for padding.

% % Uncomment if you want to simply call imfilter so you can see the desired
% % behavior. When you write your actual solution, you can't use imfilter,
% % filter2, conv2, etc. Simply loop over all the pixels and do the actual
% % computation. It might be slow.
% output = imfilter(image, filter);


%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%
%%
%testcode
%image = im2single(imread('../data/submarine.bmp'));
%imresize(image, 0.7, 'bilinear'); %resizing to speed up testing
%filter =  [0 0 0; 0 1 0; 0 0 0];
%%
si=size(image);
sf=size(filter);
hf=floor(sf(1)/2);
wf=floor(sf(2)/2);
R=zeros(si(1),si(2));
G=zeros(si(1),si(2));
B=zeros(si(1),si(2));
for i=1:1:si(1)
     sprintf('%2.2f%%', i/si(1)*100) 
    for j=1:1:si(2)
        for i2=-hf:1:hf
            for j2=-wf:1:wf
                 h=i+i2;w=j+j2;
                if h<=0
                    h=2-h;
                end
                if h>si(1)
                    h=2*si(1)-h;
                end
                if w<=0
                    w=2-w;
                end
                if w>si(2)
                    w=2*si(2)-w;
                end
                R(i,j)=R(i,j) + image(h,w,1)*filter(hf+1+i2,wf+1+j2);
                 G(i,j)=G(i,j)+ image(h,w,2)*filter(hf+1+i2,wf+1+j2);
                  B(i,j)=B(i,j)+ image(h,w,3)*filter(hf+1+i2,wf+1+j2);
            end       
        end
    end
end
output(:,:,1)=R;
output(:,:,2)=G;
output(:,:,3)=B;






