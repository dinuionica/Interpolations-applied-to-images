% 315CA Dinu Ion-Irinel
function a = bilinear_coef(f, x1, y1, x2, y2)
    % =========================================================================
    % Calcularea coeficientiilor a pentru interpolarea biliniara intre punctele
    % (x1, y1), (x1, y2), (x2, y1) si (x2, y2)
    % =========================================================================
    % determinarea matricii A
    A = [1, x1, y1, x1 * y1;
         1, x1 , y2, x1 * y2;
         1, x2, y1, x2 * y1;
         1, x2, y2, x2 * y2];
    % determinarea vectorului b
    b = [f(y1, x1); f(y2, x1); f(y1, x2); f(y2, x2)];
    % convertirea vectorului b la double
    b = double(b);
      
    % calcularea coeficientiilor
    coef = A \ b;
    a = coef;

endfunction
