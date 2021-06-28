% 315CA Dinu Ion-Irinel
function [Ix, Iy, Ixy] = precalc_d (I)
     % =============================================== =======================
     % Processing of matrices Ix, Iy and Ixy containing the derivatives dx, dy, dxy of
     % of image I for each pixel of it
     % =============================================== =======================
    
     % image size determination
     [m n] = size (I);
    
     % convert matrix I to double
       I = double (I);
     % scroll through each pixel in the image
       for y = 1: m
         for x = 1: n
           % matrix determination with derivatives with respect to x Ix
           Ix (y, x) = fx (I, x, y);
           % matrix determination with derivatives with respect to y Iy
           Iy (y, x) = fy (I, x, y);
           % matrix determination with derivatives with respect to xy Ixy
           Ixy (y, x) = fxy (I, x, y);

         endfor
       endfor
      
endfunction
