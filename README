COPYRIGHT 2021 DINU ION-IRINEL
===============================================================================

                    Interpolare aplicata pe imagini

===============================================================================


===============================================================================

1. Nearest-Neighbour

Functii implementate:
.
├── nn_2x2
- am definit coordonatele intermediare si matricea finala 
- am calculat cel mai apropiat vecin pentru fiecare pixel folosind functia round
- am determinat valoarea pixelul-ui din imaginea finala

├── nn_2x2_RGB
- am extras fiecare canal al imaginii RGB
- am aplicat pentru fiecare canal functia nn_2x2
- am calculat matricea rezultata

└── nn_resize 
- am determinat factorii de scalare
- am definit matricea de transformare si am calculat inversa acesteia
- am calculat x_p, y_p si am determinat cel mai apropiat vecin pentru fiecare
- am calculat valoarea pixelul-ui din imaginea finala

└── nn_resize_RGB
- similar functiei nn_2x2_RGB am extras canale si am aplicat functia de
resize pentru fiecare dintre acestea

===============================================================================

2. Bilinear

Functii implementate:
.
├── bilinear_coef
- am initializat matricea A formata din punctele 1, x si y
- am initializat vectorul b care contine punctele din f
- am rezolvat sistemul pentru a calcula coeficientii de interpolare

├── bilinear_2x2
- am determinat coeficientii de interpolare pe baza celor 4 puncte 
incadratoare si apoi pentru fiecare am calculat cel mai apropiat vecin
- am calculat valoarea pixelul-ui final folosind fiecare coeficient obtinut

├── bilinear_resize
- am determinat factorii de scalare
- am calculat pixelii x_p si y_p si punctele care le incojoara
- in final am calculat coeficientii de interpolare si valoarea pixelul-ui 
final pe baza acestora

├── bilinear_rotate
- in cadrul functiei am determinat matricea de transformare formata din 
valorile cos si sin si am calculat inversa acesteia
- am calculat in mod similar x_p si y_p
- in cazul in care este depasita dimensiunea imaginii am pus un pixel 
negru in imaginea finala,adica valorea 0
- am calculat coeficientii si valoarea pixelul-ui din imaginea finala

├── bilinear_resize_RGB / ├── bilinear_rotate_RGB / - ca si in cadrul 
functiilor din nearest neighbour am extras fiecare canal si am aplicat
functia corespunzatoare pe acesta obtinand apoi imaginea finala.

===============================================================================

3. Bicubic

Functii implementate:
.
├── f_x, f_y, f_xy
- am verificat daca derivata se afla pe marginea matricii si in caz afirmativ
aceasta a fost intializata cu 0
- am calculat fiecare derivata dupa formula specifica, folosind diferente finite

├── precalc_d
- am parcurs dimensiuniile imaginii si pentru fiecare pixel am calculat
derivata acestuia in raport cu x, y si respectiv xy obtinand astfel 
matricile derivate

├── bicubic_coef
- am initializat cele doua matrici intermediare cat si matricea ce contine
derivatele pixelilor
- am convertit toate cele trei matrici la double
- am obtinuta matricea coeficientilor inmultinand cele trei matrici intermediare

├── bicubic_resize
- am determinat factorii de scalare
- am calcuat matricea de transformare si matricile de derivare
- am calculat x_p si y_p si coeficientii de interpolare
- am obtinut fiecare pixel din imaginea finala prin inmultirea vectorului 
ce contine 1 si x_p cu matricea de coeficienti si cu vectorul ce cotine 1 si y_p

├── bicubic_resize_RGB 
- pentru fiecare canal extras din imaginea RGB am aplicat functia de  
bicubic_resize enuntata mai sus

===============================================================================
4. Mentiuni
-am lasat o parte din comentariile prezente in schelet deoarece erau
foarte intuitive
- am folosit functiile built-in din Octave deoarece sunt mai rapide si astfel
am economisit timp la rularea checkerul-ui

===============================================================================
5. Feedback
- o tema interesanta, mi-a placut ideea, felicitari!
- extrem de folositoare todo-uri si structurarea scheletului
- existenta formulelor din enuntul temei a ajutat foarte mult
- o mica sugestie: in cazul in care checker-ul nu ofera punctele ar ajuta
mult sa se afiseze si erorile care cauzeaza acest lucru

===============================================================================
