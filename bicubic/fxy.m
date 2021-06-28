% 315CA Dinu Ion-Irinel
function r = fxy (f, x, y)
     % =============================================== =======================
     % Approximation of the derivative with respect to x and y of f at point (x, y).
     % =============================================== =======================
     
     % if x or y is on the edge of the derived image is considered 0
     [m n] = size (f);
     if x == 1 || x == n || y == 1 || y == m
         r = 0;
     else
         % otherwise we calculate the derivative using the specific formula
         f_xy = (f (y - 1, x - 1) + f (y + 1, x + 1) - f (y - 1, x + 1) - f (y + 1, x - 1)) / 4;
         r = f_xy;
     endif
   
endfunction
