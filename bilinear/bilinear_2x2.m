% 315CA Dinu Ion-Irinel
function out = bilinear_2x2 (f, STEP = 0.1)
    % ======================================================================
    % Apply bilinear interpolation to the 2x2 f image with intermediate points
    % equidistant.
    % f has known values ​​in points (1, 1), (1, 2), (2, 1) and (2, 2).
    %
    % Parameters:
    % - f = the image to be interpolated
    % - STEP = distance between two successive points
    % ======================================================================
    
    % definition of x and y coordinates of intermediate points
    x_int = 1: STEP: 2;
    y_int = 1: STEP: 2;
    % find the number of points
    n = length (x_int);

    % determination of the 4 framing points
    x1 = y1 = 1;
    x2 = y2 = 2;
    % calculation of bilinear interpolation coefficients using bilinear_coef
    coef = bilinear_coef (f, x1, y1, x2, y2);
    % initializing the result with an n x n matrix full of zero
    matrix = zeros (n, n);
    % scrolling through each pixel in the final image
    for i = 1: n
        for j = 1: n
            % pixel value calculation
            matrix (j, i) = coef (1) + coef (2) * x_int (i) + coef (3) * y_int (j) + coef (4) * x_int (i) * y_int (j);
        endfor
    endfor

    % convert the result to uint8 to remain an image
    matrix = uint8 (matrix);
    out = matrix;
    
endfunction
