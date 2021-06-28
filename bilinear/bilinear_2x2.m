% 315CA Dinu Ion-Irinel
function out = bilinear_2x2(f, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare biliniara pe imaginea 2x2 f cu puncte intermediare
    % echidistante.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % 
    % Parametrii:
    % - f = imaginea ce se doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================
    
    % definirea coordonatelor x si y ale punctelor intermediare
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;
    % aflarea numarului de puncte
    n = length(x_int);

    % determinarea celor 4 punctele incadratoare
    x1 = y1 = 1;
    x2 = y2 = 2;
    % calcularea coeficientiilor de interpolare biliniara folosind bilinear_coef
    coef = bilinear_coef(f, x1, y1, x2, y2);
    % initializarea rezultatului cu o matrice n x n plina de zero
    matrix = zeros(n, n);
    % parcurgerea fiecarui pixel din imaginea finala
    for i = 1 : n
        for j = 1 : n
            % calcularea valoarii pixelului
            matrix(j, i) = coef(1) + coef(2) * x_int(i) + coef(3) * y_int(j) + coef(4) * x_int(i) * y_int(j);
        endfor
    endfor

    % convertirea rezultatului la uint8 pentru a ramane o imagine
    matrix = uint8(matrix);
    out = matrix;
    
endfunction
