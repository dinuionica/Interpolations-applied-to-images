% 315CA Dinu Ion-Irinel
function R = bilinear_rotate (I, rotation_angle)
    % ======================================================================
    % Rotate the black and white image I of size m x n with the angle
    % rotation_angle, applying bilinear interpolation.
    % rotation_angle is expressed in radians.
    % ======================================================================

    [m n nr_colors] = size (I);

    % cast I double
    I = double (I);
    % if the image is black and white, we ignore it
    if nr_colors> 1
        R = - 1;
        return
    endif

    % calculate cos and sin of rotation_angle
    cos_angle = cos (rotation_angle);
    sin_angle = sin (rotation_angle);
    % final matrix initialization full of zeros
    matrix = zeros (m, n);
    % transformation matrix determination
    T = [cos_angle, -sin_angle; sin_angle, cos_angle];
    % inverse matrix calculation of the transformation
    T_INV = inv (T);

    % scroll through each pixel in the image
    for y = 0: m - 1
        for x = 0: n - 1
            % determination of x_p and y_p in the initial image space
            point = T_INV * [x; y];
            x_p = point (1);
            y_p = point (2);
            % passed (xp, yp) from the coordinate system from 0 to n - 1 in
            % coordinate system from 1 to n to apply interpolation
            x_p = x_p + 1;
            y_p = y_p + 1;
            % if x_p or y_p is outside the image we put a black pixel
            if y_p> m || y_p <1 || x_p> n || x_p <1
                matrix (y + 1, x + 1) = 0;
                continue;
            endif
        
            % determination of points surrounding the point (xp, yp)
            [x1 y1 x2 y2] = surrounding_points (n, m, x_p, y_p);
        
            % calculation of interplacement coefficients a
            coef = bilinear_coef (I, x1, y1, x2, y2);
            
            % interpolated pixel value calculation (x, y)
            matrix (y + 1, x + 1) = coef (1) + coef (2) * x_p + coef (3) * y_p + coef (4) * x_p * y_p;
            
        endfor
    endfor

    % result matrix conversion to uint8
    matrix = uint8 (matrix);
    R = matrix;

endfunction
