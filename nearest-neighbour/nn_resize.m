% 315CA Dinu Ion-Irinel
function R = nn_resize (I, p, q)
    % =============================================== =======================
    % Image upscaling using the nearest-neighbor interpolation algorithm
    % Transforms image I from size m x n to size p x q
    % =============================================== =======================
    
    [m n nr_colors] = size (I);

    % convert the input image to black and white if necessary
    if nr_colors> 1
        R = -1;
        return
    endif
    
    % cast to double for I
    I = double (I);
    % final matrix initialization
    R = zeros (p, q);
    % determination of scaling factors
    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);
   
    % definition of the transformation matrix for resizing
    T = [s_x, 0; 0, s_y];
    % inverse matrix calculation of the transformation
    T_INV = [1 / s_x, 0; 0, 1 / s_y];
    
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
            % calculation of the nearest neighbor using the round function
            x_f = round ([x_p]);
            y_f = round ([y_p]);
            % calculating the pixel value in the final image
            R (y + 1, x + 1) = I (y_f, x_f);
        endfor
    endfor
    % result matrix conversion to uint8
    R = uint8 (R);

endfunction
