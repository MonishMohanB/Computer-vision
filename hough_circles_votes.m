function H5 = hough_circles_votes(edge_image, radius)
    
    H5 = zeros(size(edge_image));
    for x = 1 : size(edge_image, 2)
        for y = 1 : size(edge_image, 1)
            if (edge_image(y,x))
                for theta = linspace(0, 2 * pi, 360)
                    a = round(x + radius * cos(theta));                
                    b = round(y + radius * sin(theta));
                    if (a > 0 && a <= size(H5, 2) && b > 0 && b <= size(H5,1))
                        H5(b,a) = H5(b,a) + 1;
                    end
                end
            end
        end
    end
end