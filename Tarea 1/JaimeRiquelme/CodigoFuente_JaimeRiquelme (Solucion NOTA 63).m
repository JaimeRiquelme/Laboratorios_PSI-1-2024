
% Inicialización de parámetros para la estilización con XDoG
Gamma = 0.98;
Phi = 220;
Epsilon = -0.1;
k = 1.6;
Sigma = 0.9;

% Carga y preparación de la imagen del tigre para procesamiento
im1 = imread('tigre.png');
im1 = rgb2gray(im1);
im1 = im2double(im1);

% Aplicación de los filtros gaussianos y creación de la diferencia gaussiana
Gaus1 = imgaussfilt(im1, Sigma);
Gaus2= imgaussfilt(im1, Sigma * k);

% Calculamos diferencia gaussiana
Diferencia_Gauss = Gaus1 - (Gamma * Gaus2);

% Iniciamos la imagen y calculamos el largo y ancho de la imagen
XDoG_img = zeros(size(Diferencia_Gauss));
x = size(Diferencia_Gauss,1);
y = size(Diferencia_Gauss,2);

% Proceso iterativo para calcular la imagen XDoG del tigre
for i = 1:x
    for j = 1:y
        if Diferencia_Gauss(i, j) < Epsilon
            XDoG_img(i, j) = 1;
        else
            XDoG_img(i, j) = 1 + tanh(Phi * (Diferencia_Gauss(i, j)));
        end
    end
end


% Binarización de la imagen XDoG del tigre
xdog_bin = zeros(size(XDoG_img));
x2 = size(xdog_bin,1);
y2 = size(xdog_bin,2);

for i = 1:x2
    for j = 1:y2
       

        if XDoG_img(i,j) > 1.999 % (Umbral ajustado salida de 1 +tanh)
            xdog_bin(i,j) = 1;
        else
            xdog_bin(i,j) = 0;
        end
    end
end


% Visualización de la imagen XDoG del tigre
figure, imshow(mat2gray(XDoG_img));
figure, imshow(xdog_bin); 


% Inicialización de parámetros para una segunda imagen
Gamma2 = 0.98;
Phi2 = 250;
Epsilon2 = -0.2;
k = 1.6;
Sigma2 = 0.9;

% Carga y preparación de la imagen de la mujer para procesamiento
im2 = imread("mujer.png");
im2 = rgb2gray(im2);
im2 = im2double(im2);


% Aplicación de los filtros gaussianos y creación de la diferencia gaussiana
Gaus3 = imgaussfilt(im2, Sigma2);
Gaus4= imgaussfilt(im2, Sigma2 * k);

% Calculamos diferencia gaussiana
Diferencia_Gauss2 = Gaus3 - (Gamma2 * Gaus4);

% Iniciamos la imagen y calculamos el largo y ancho de la imagen
XDoG_img2 = zeros(size(Diferencia_Gauss2));
x3 = size(Diferencia_Gauss2,1);
y3 = size(Diferencia_Gauss2,2);

% Proceso iterativo para calcular la imagen XDoG 
for i = 1:x3
    for j = 1:y3
        if Diferencia_Gauss2(i, j) < Epsilon2
            XDoG_img2(i, j) = 1;
        else
            XDoG_img2(i, j) = 1 + tanh(Phi2 * (Diferencia_Gauss2(i, j)));
        end
    end
end


% Binarización de la imagen XDoG
xdog_bin2 = mat2gray(XDoG_img2);
x4 = size(xdog_bin2,1);
y4 = size(xdog_bin2,2);

for i = 1:x4
    for j = 1:y4       
        if XDoG_img2(i,j) > 1.99 
            xdog_bin2(i,j) = 1;
        else
            xdog_bin2(i,j) = 0;
        end
    end
end

% Visualización de la imagen XDoG 
figure, imshow(mat2gray(XDoG_img2));
figure, imshow(xdog_bin2); 
