% 315CA Dinu Ion-Irinel
function [x1 y1 x2 y2] = surrounding_points (n, m, x, y)
     % =============================================== =======================
     % Calculation of the 4 points containing inside (x, y)
     % Also receives the size of an image m x n, to ensure that it is not
     % exits the matrix.
     % =============================================== =======================
    
     % calculate x1, y1, x2, y2
     x1 = floor (x);
     x2 = floor (x) + 1;
     y1 = floor (y);
     y2 = floor (y) + 1;

     % if y1 is on the last line y2 must not exit the matrix
     if y1 == m
       y1 = y1 - 1;
       y2 = y2 - 1;
     endif
     % if x1 is on the last column x2 must not exit the matrix
     if x1 == n
       x1 = x1 - 1;
       x2 = x2 - 1;
     endif
endfunction
