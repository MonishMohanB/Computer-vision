%%%%%%%%%%%%%%%%%  1.image files and Storing  %%%%%%%%%%%%%%%%%%%%%%%%%

img = imread('window.png');
[BW,threshOut] = edge(img,'Sobel');
window_edge = edge(img,'Canny',threshOut);

subplot(1,2,1), imshow(img),title('Original image');
subplot(1,2,2), imshow(window_edge),title('Edge using Canny');

%%%%%%%%%%%%%%%%%       2.Hough Transform     %%%%%%%%%%%%%%%%%%%%%%%%%

%a
 [H, theta, rho]= hough_lines_votes(window_edge);
 [H1,theta1,rho1] = hough(window_edge);
 k = H==H1 ;   % get the equal elements 
iwant = sum(k(:));   % total number of equal elements
percentage = iwant/(723*180)*100;
g= uint8(H);
h= uint8(H1);
subplot(1,2,1), imshow(g),title('My H image');
subplot(1,2,2), imshow(h),title('Using inbuit function');

%b
Threshold=0.5 * max(H(:));
NHoodSize= (floor(size(H) / 100.0) * 2 + 1);
peaks = hough_peaks(H,10);
peaks1 = houghpeaks(H,10);

imshow(H,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(theta(peaks(:,2)),rho(peaks(:,1)),'s','color','white');

%c
 hough_lines_draw(img, peaks, rho, theta);

%%%%%%%%%%%%%%%%%     3.Window image with noise %%%%%%%%%%%%%%%%%%%%%%%%%
%a
img_noise= imread('window_w_noise.png');
Iblur1 = imgaussfilt(img_noise,4);
Iblur2 = imgaussfilt(img_noise,6);
subplot(1,3,1), imshow(img_noise),title('original image');
subplot(1,3,2), imshow(Iblur1),title('Gaussian with sigma 4');
subplot(1,3,3), imshow(Iblur2),title('Gaussian with sigma 6');
%b
[BW1,threshOut1] = edge(img_noise,'Sobel');
[BW2,threshOut2] = edge(Iblur1,'Sobel');
[BW3,threshOut3] = edge(Iblur2,'Sobel');
window_edge1 = edge(img_noise,'Canny',threshOut1);
window_edge2 = edge(Iblur1,'Canny',threshOut2);
window_edge3 = edge(Iblur2,'Canny',threshOut3);
subplot(1,3,1), imshow(window_edge1),title('original image edge');
subplot(1,3,2), imshow(window_edge2),title('Gaussian with sigma 4 edge');
subplot(1,3,3), imshow(window_edge3),title('Gaussian with sigma 6 edge');
%c

 [H3, theta3, rho3]= hough_lines_votes(window_edge3);
 [H4,theta4,rho4] = hough(window_edge3);
g1= uint8(H3);
h1= uint8(H4);
subplot(1,2,1), imshow(g1),title('My smoothened H image');
subplot(1,2,2), imshow(h1),title('Smoothened Using inbuit function');

Threshold1=0.5 * max(H3(:));
NHoodSize1= (floor(size(H3) / 100.0) * 2 + 1);
peaks3 = hough_peaks(H3,10);
peaks4 = houghpeaks(H3,10);

imshow(H3,[],'XData',theta3,'YData',rho3,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(theta3(peaks3(:,2)),rho3(peaks3(:,1)),'s','color','white');

 hough_lines_draw(img_noise, peaks3, rho3, theta3);

%%%%%%%%%%%%%%%%%  4. Coins and pens %%%%%%%%%%%%%%%%%%%%%%%%%

i = imread('coins_and_pens.png');
j = rgb2gray(i);

blur1 = imgaussfilt(j,2);
blur2 = imgaussfilt(j,5);
subplot(1,3,1), imshow(j),title('original grey scale image');
subplot(1,3,2), imshow(blur1),title('Gaussian with sigma 4');
subplot(1,3,3), imshow(blur2),title('Gaussian with sigma 6');
%b
[BW4,threshOut4] = edge(j,'Sobel');
[BW5,threshOut5] = edge(blur1,'Sobel');
[BW6,threshOut6] = edge(blur2,'Sobel');

window_edge4 = edge(j,'Canny',threshOut4);
window_edge5 = edge(blur1,'Canny',threshOut5);
window_edge6 = edge(blur2,'Canny',threshOut6);

subplot(1,3,1), imshow(window_edge4),title('original image edge');
subplot(1,3,2), imshow(window_edge5),title('Gaussian with sigma 4 edge');
subplot(1,3,3), imshow(window_edge6),title('Gaussian with sigma 6 edge');
%c

 [H5, theta5, rho5]= hough_lines_votes(window_edge6);
 [H6,theta6,rho6] = hough(window_edge6);
g2= uint8(H5);
h2= uint8(H6);
subplot(1,2,1), imshow(g2),title('My smoothened H image');
subplot(1,2,2), imshow(h2),title('Smoothened Using inbuit function');

Threshold2=0.5 * max(H6(:));
NHoodSize2= (floor(size(H6) / 100.0) * 2 + 1);
peaks5 = hough_peaks(H6,10);
peaks6 = houghpeaks(H6,10);

imshow(H6,[],'XData',theta6,'YData',rho6,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(theta6(peaks6(:,2)),rho6(peaks6(:,1)),'s','color','white');

 hough_lines_draw(j, peaks6, rho6, theta6);

 
%%%%%%%%%%%%%%%%%%%%%%%%%% 5. CIRCLES ##########################
%a
radius=20;
H7 = hough_circles_votes(window_edge6, radius);
t1= uint8(H7);
figure(); imshow(t1),title('coins and pens H');


peaks7 = hough_peaks(H7,10);

hough_circles_draw(j,peaks7, 20);

%b
[centers, radii] = find_circles(window_edge6, [20,20]);





