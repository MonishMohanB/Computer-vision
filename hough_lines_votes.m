function [H, theta, rho] = hough_lines_votes(edge_image,varargin)


    ap = inputParser();
    addParameter(ap, 'RhoResolution', 1);
    addParameter(ap, 'Theta', linspace(-90, 89, 180));
    parse(ap, varargin{:});

    rStep = ap.Results.RhoResolution;
    theta = ap.Results.Theta;

    dMax = sqrt((size(edge_image,1) - 1) ^ 2 + (size(edge_image,2) - 1) ^ 2);
    numRho = 2 * (ceil(dMax / rStep)) + 1;
    d = rStep * ceil(dMax / rStep);
    numTheta = length(theta);
    H = zeros(numRho, numTheta);
    rho = -d : d;
    for i = 1 : size(edge_image,1)
        for j = 1 : size(edge_image,2)
            if (edge_image(i, j))
                for k = 1 : numTheta
                    temp = j * cos(theta(k) * pi / 180) + i * sin(theta(k) * pi / 180);
                    rx = round((temp + d) / rStep) + 1;
                    H(rx, k) = H(rx, k) + 1;                   
                end
            end            
        end
    end    
end