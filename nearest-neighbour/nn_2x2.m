% 315CA Dinu Ion-Irinel
function out = nn_2x2(f, STEP = 0.1)
    % =========================================================================
    % Aplicarea interpolarii nearest-neighbour pe imaginea 2x2 f cu puncte
    % intermediare echidistante.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % 
    % Parametrii:
    % - f = imaginea ce se doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================
    
    % definirea coordonatelor x si y ale punctelor intermediare
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;
    
    % determinarea numarului de puncte
    n = length(x_int);
    % initializare matrice nxn plina cu zerouri
    matrix = zeros(n,n);
    % parcurgerea fiecarui pixel din imaginea finala
    for i = 1 : n
        for j = 1 : n 
            % aflarea celui mai apropiat vecin folosind functia round
            % x_p si y_p vor fi aproximate
            x_p = round([x_int(i)]);
            y_p = round([y_int(j)]); 
            % determinarea si calcularea pixelul-ui din imaginea rezultata
            matrix(i, j) = f(x_p, y_p);
        endfor
    endfor
    out = matrix;
endfunction