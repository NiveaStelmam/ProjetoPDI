close all
clear all

for (cont = 1: 2)% usar as 255 imagens do banco
  im = imread(strcat ('C:\Users\Adriano\Pictures\FotosPDI\BancoDeFoto\img (', int2str(cont),').jpg'));


%im = rgb2gray(im);
im = im(:,:,1) - im(:,:,2);
imMed = im;
for i=7:size(imMed,1) - 6
  for j=7:size(imMed,2) - 6
    px = im(i-6:i+6,j-6:j+6);
    V2=sort(px);
  imMed(i,j) = V2(84);
  end
end

figure(1);
imshow(imMed);

minValue = min(min(imMed));
maxValue = max(max(imMed));
imAlarg = uint8((double(imMed-minValue)./double(maxValue-minValue))*255);

figure(2);
imshow(imAlarg);

im = imread(strcat ('C:\Users\Adriano\Pictures\FotosPDI\BancoDeFoto\img (', int2str(cont), ').jpg'));
clear imwrite(im, 'C:\Users\Adriano\Pictures\FotosPDI\BancoDeFoto');
end

