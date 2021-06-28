% 315CA Dinu Ion-Irinel
function r = fx (f, x, y)
     % =============================================== =======================
     % Approximation of the derivative to x of f at point (x, y).
     % =============================================== =======================

     % if x is on the edge of the derived image is considered 0
     [m n] = size (f);
     if x == 1 || x == n
         r = 0;
     else
         % otherwise we calculate the derivative using the specific formula
         f_x = (f (y, x + 1) - f (y, x - 1)) / 2;
         r = f_x;
     endif

endfunction
