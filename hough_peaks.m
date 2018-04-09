function peaks = hough_peaks(H,varargin)
    ap = inputParser;
    addOptional(ap, 'numpeaks', 1, @isnumeric);
    addParameter(ap, 'Threshold', 0.5 * max(H(:)));
    addParameter(ap, 'NHoodSize', floor(size(H) / 100.0) * 2 + 1);  % odd values >= size(H)/50
    parse(ap, varargin{:});

    npeaks = ap.Results.numpeaks;
    t = ap.Results.Threshold;
    nHS = ap.Results.NHoodSize;
    
    peaks = zeros(npeaks, 2);
    num = 0;
    while(num < npeaks)
        maxvalueH = max(H(:));
        if (maxvalueH >= t)
            num = num + 1;
            [row,col] = find(H == maxvalueH);
            peaks(num,:) = [row(1),col(1)];
            rStart = max(1, row - (nHS(1) - 1) / 2);
            rEnd = min(size(H,1), row + (nHS(1) - 1) / 2);
            cStart = max(1, col - (nHS(2) - 1) / 2);
            cEnd = min(size(H,2), col + (nHS(2) - 1) / 2);
            for i = rStart : rEnd
                for j = cStart : cEnd
                        H(i,j) = 0;
                end
            end
        else
            break;          
        end
    end
    peaks = peaks(1:num, :);            
end