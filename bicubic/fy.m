% 315CA Dinu Ion-Irinel
function r = fy (f, x, y)
     % =============================================== =======================
     % Approximation of the derivative to y of f at point (x, y).
     % =============================================== =======================

     % if y is on the edge of the derived image is considered 0
     [m n] = size (f);
     if y == 1 || y == m
         r = 0;
     else
         % otherwise we calculate the derivative using the specific formula
         f_y = (f (y + 1, x) - f (y - 1, x)) / 2;
         r = f_y;
     endif

endfunction
