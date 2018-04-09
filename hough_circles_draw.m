function hough_circles_draw(monochrome_input, centers, radius)

    figure();
    imshow(monochrome_input);
    hold on;
    for i = 1 : size(centers, 1)
        r = radius;
        center_x = centers(i, 2);
        center_y = centers(i, 1);
        theta = linspace(0, 2 * pi, 360);
        xx = center_x + r * cos(theta);
        yy = center_y + r * sin(theta);
        plot(xx, yy,'r', 'LineWidth', 2);
    end
end