% 315CA Dinu Ion-Irinel
function out = nn_2x2 (f, STEP = 0.1)
    % =============================================== =======================
    % Applying the nearest-neighbor interpolation to the 2x2 f dotted image
    % equidistant intermediate.
    % f has known values in points (1, 1), (1, 2), (2, 1) and (2, 2).
    %
    % Parameters:
    % - f = the image to be interpolated
    % - STEP = distance between two successive points
    % =============================================== =======================
    
    % definition of x and y coordinates of intermediate points
    x_int = 1: STEP: 2;
    y_int = 1: STEP: 2;
    
    % determination of the number of points
    n = length (x_int);
    % nxn matrix initialization full of zeros
    matrix = zeros (n, n);
    % scrolling through each pixel in the final image
    for i = 1: n
        for j = 1: n
            % find the nearest neighbor using the round function
            % x_p and y_p will be approximated
            x_p = round ([x_int (i)]);
            y_p = round ([y_int (j)]);
            % determination and calculation of the pixel in the resulting image
            matrix (i, j) = f (x_p, y_p);
        endfor
    endfor
    out = matrix;
endfunction
