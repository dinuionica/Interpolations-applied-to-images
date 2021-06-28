% 315CA Dinu Ion-Irinel
function a = bilinear_coef (f, x1, y1, x2, y2)
     % =============================================== =======================
     % Calculation of the coefficients a for bilinear interpolation between points
     % (x1, y1), (x1, y2), (x2, y1) if (x2, y2)
     % =============================================== =======================
     % determination of the matrix A
     A = [1, x1, y1, x1 * y1;
          1, x1, y2, x1 * y2;
          1, x2, y1, x2 * y1;
          1, x2, y2, x2 * y2];
     % determination of the vector b
     b = [f (y1, x1); f (y2, x1); f (y1, x2); f (y2, x2)];
     % convert vector b to double
     b = double (b);
      
     % calculation of coefficients
     coef = A \ b;
     a = coef;

endfunction
