function hough_lines_draw(img, peaks, rho, theta)

    figure();
    imshow(img);
    hold on;
    for i = 1 : size(peaks,1)
       r_i = rho(peaks(i,1));
       t_i = theta(peaks(i,2)) * pi / 180;
       if t_i == 0
           x1 = r_i;
           x2 = r_i;
           if r_i > 0
               y1 = 1;
               y2 = size(img,1);
               plot([x1,x2],[y1,y2],'r','LineWidth',2);title("window Line"); 
           end           
       else
           x1 = 1;
           x2 = size(img, 2);
           y1 = (r_i - x1 * cos(t_i)) / sin(t_i);
           y2 = (r_i - x2 * cos(t_i)) / sin(t_i);
           plot([x1,x2],[y1,y2],'r','LineWidth',2);title("window Line");  
       end
             
    end
end