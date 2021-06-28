====================================================================

                         Interpolation applied to images

====================================================================

====================================================================

1. Nearest-Neighbor

Implemented functions:
.
├── nn_2x2
- we defined the intermediate coordinates and the final matrix
- I calculated the nearest neighbor for each pixel using the round function
- I determined the pixel value in the final image

├── nn_2x2_RGB
- I extracted each channel of the RGB image
- I applied for each channel the function nn_2x2
- I calculated the resulting matrix

└── nn_resize
- I determined the scaling factors
- I defined the transformation matrix and calculated its inverse
- I calculated x_p, y_p and determined the nearest neighbor for each
- I calculated the pixel value of the final image

└── nn_resize_RGB
- similar to the nn_2x2_RGB function I extracted channels and applied the
resize for each of them

============================================================================

2. Bilinear

Implemented functions:
.
├── bilinear_coef
- we initialized the matrix A formed by points 1, x and y
- we initialized the vector b that contains the points in f
- I solved the system to calculate the interpolation coefficients

├── bilinear_2x2
- we determined the interpolation coefficients based on the 4 points
framing and then for each we calculated the nearest neighbor
- I calculated the value of the final pixel using each coefficient obtained

├── bilinear_resize
- I determined the scaling factors
- I calculated the pixels x_p and y_p and the points that surround them
- finally we calculated the interpolation coefficients and the pixel value
final based on them

├── bilinear_rotate
- within the function we determined the transformation matrix consisting of
the values cos and sin and we calculated its inverse
- I calculated x_p and y_p similarly
- if the image size is exceeded, I put a pixel
black in the final image, ie the value 0
- I calculated the coefficients and the value of the pixel in the final image

├── bilinear_resize_RGB / ├── bilinear_rotate_RGB / - as in
to the nearest neighbor functions I extracted each channel and applied
the corresponding function on it then obtaining the final image.

============================================================================

3. Bicubic

Implemented functions:
.
├── f_x, f_y, f_xy
- I checked if the derivative is on the edge of the matrix and if so
this was initialized with 0
- we calculated each derivative according to the specific formula, using finite differences

├── precalc_d
- I went through the dimensions of the image and for each pixel I calculated
its derivative in relation to x, y and xy, respectively, thus obtaining
derived matrices

├── bicubic_coef
- I initialized the two intermediate matrices as well as the matrix containing them
pixel derivatives
- I converted all three matrices to doubles
- we obtained the matrix of coefficients by multiplying the three intermediate matrices

├── bicubic_resize
- I determined the scaling factors
- I calculated the transformation matrix and the derivation matrices
- I calculated x_p and y_p and the interpolation coefficients
- we obtained each pixel from the final image by multiplying the vector
which contains 1 and x_p with the coefficient matrix and with the vector which contains 1 and y_p

├── bicubic_resize_RGB
- for each channel extracted from the RGB image we applied the function of
bicubic_resize stated above

=============================================================================
4. Mentions
-I left some of the comments present in the skeleton because they were
very intuitive
- I used the built-in functions in Octave because they are faster and so on
I saved time running the checker

============================================================================
5. Feedback
- an interesting topic, I liked the idea, congratulations!
- extremely useful totes and skeleton structuring
- the existence of the formulas from the theme statement helped a lot
- a small suggestion: if the checker does not offer points it would help
much to display the errors that cause this

============================================================================
