% 315CA Dinu Ion-Irinel
function R = bicubic_resize (I, p, q)
    % =============================================== =======================
    % Image upcaling using the bicubic interpolation algorithm
    % Transforms image I from size m x n to size p x q
    % =============================================== =======================

    [m n nr_colors] = size (I);

    % cast to double for I
    I = double (I);
    % initialization of the final matrix
    R = zeros (p, q);

    % if the image is black and white, we ignore it
    if nr_colors> 1
        R = -1;
        return
    endif
    % determination of scaling factors
    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);

    % definition of the transformation matrix for resizing
    T = [s_x 0; 0 s_y];
    % inverse matrix calculation of the transformation
    T_INV = [1 / s_x, 0; 0, 1 / s_y];
    
    % determination of derivation matrices
     [Ix Iy Ixy] = precalc_d (I);

    % scroll through each pixel in the image
    for y = 0: p - 1
        for x = 0: q - 1
            % determination of x_p and y_p in the initial image space
            point = T_INV * [x; y];
            x_p = point (1);
            y_p = point (2);
            % passed (xp, yp) from the coordinate system from 0 to n - 1 in
            % coordinate system from 1 to n to apply interpolation
            x_p = x_p + 1;
            y_p = y_p + 1;
            % determination of points surrounding the point (xp, yp)
            [x1 y1 x2 y2] = surrounding_points (n, m, x_p, y_p);

            % calculation of interpolation coefficients A
            A = bicubic_coef (I, Ix, Iy, Ixy, x1, y1, x2, y2);
            % passing coordinates (xp, yp) in the unit square
            x_p = x_p - x1;
            y_p = y_p - y1;
            % interpolated pixel value calculation (x, y)
            R (y + 1, x + 1) = [1 x_p x_p ^ 2 x_p ^ 3] * A * [1 y_p y_p ^ 2 y_p ^ 3] ';
        endfor
    endfor

    % result matrix conversion to uint8
    R = uint8 (R);
endfunction
