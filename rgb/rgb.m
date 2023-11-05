clc
clear
RGB = reshape(ones(200, 1)*reshape(jet(200), 1,600), [200, 200, 3]);
imshow(RGB);
title('Original RGB Image');
[R, G, B] = imsplit(RGB);
subplot(2, 2, 1); imshow(R);      title('Red Channel');
subplot(2, 2, 2); imshow(G);      title('green Channel');
subplot(2, 2, 3); imshow(B);      title('blue Channel');
subplot(2, 2, 4); imshow(RGB);    title('original Channel');
