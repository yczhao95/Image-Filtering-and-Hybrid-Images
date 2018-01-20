clear;
image2 = im2single(imread('../data/cat.bmp'));
image1 = im2single(imread('../data/dog.bmp'));
for cutoff_frequency = 1:3:10
large_1d_blur_filter = fspecial('Gaussian', [cutoff_frequency*4+1 1], cutoff_frequency*4+1);
low_frequencies = my_imfilter(image1, large_1d_blur_filter);
low_frequencies = my_imfilter(low_frequencies, large_1d_blur_filter'); 

low_frequencies2 = my_imfilter(image2, large_1d_blur_filter);
low_frequencies2 = my_imfilter(low_frequencies2, large_1d_blur_filter');
high_frequencies = image2-low_frequencies2;
hybrid_image = low_frequencies+high_frequencies; 

imwrite(low_frequencies, strcat('low_frequencies',num2str(cutoff_frequency),'.jpg'), 'quality', 95);
imwrite(high_frequencies, strcat('high_frequencies',num2str(cutoff_frequency),'.jpg'), 'quality', 95);
imwrite(hybrid_image, strcat('hybrid_image',num2str(cutoff_frequency),'.jpg'), 'quality', 95);
end