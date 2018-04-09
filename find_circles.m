function [centers, radii] = find_circles(edge_image, radius_range)
    
    r_min = radius_range(1);
    r_max = radius_range(2);
    r_num = 20;
    numpeaks = 6;
    centers = zeros(r_num * numpeaks, 2);
    radii = zeros(size(centers,1),1);
    row_num = 0;
    for r = linspace(r_min, r_max, 5)
        H = hough_circles_votes(edge_image, r);
        temp_centers = hough_peaks(H, numpeaks, 'Threshold', 0.8 * max(H(:)));
        if (size(temp_centers,1) > 0)
            row_num_new = row_num + size(temp_centers,1);
            centers(row_num + 1:row_num_new,:) = temp_centers;
            radii(row_num + 1:row_num_new) = r;
            row_num = row_num_new;       
        end
    end
    centers = centers(1:row_num,:);
    radii = radii(1:row_num);
end