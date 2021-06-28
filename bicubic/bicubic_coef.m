% 315CA Dinu Ion-Irinel
function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calcularea coeficientiilor de interpolare bicubica pentru 4 puncte alaturate
    % =========================================================================

    % calcularea matricelor intermediare
    matrix1 = [1, 0, 0, 0; 
               0, 0, 1, 0;
              -3, 3,-2,-1;
               2,-2, 1, 1];

    matrix2 = [1, 0, -3, 2;
               0, 0, 3, -2;
               0, 1, -2, 1;
               0, 0, -1, 1];
    
    derived_matrix = [f(y1, x1), f(y2,x1), Iy(y1, x1), Iy(y2, x1);
                      f(y1,x2), f(y2,x2), Iy(y1,x2), Iy(y2,x2);  
                      Ix(y1, x1), Ix(y2, x1), Ixy(y1, x1), Ixy(y2,x1);
                      Ix(y1, x2), Ix(y2, x2), Ixy(y1, x2), Ixy(y2, x2)];
    % convertire matrici intermediare la double
      matrix1 = double(matrix1);
      matrix2 = double(matrix2);
      derived_matrix  = double(derived_matrix );
      
    % obtinerea matricii finale
      A = matrix1 * derived_matrix * matrix2;
      
endfunction