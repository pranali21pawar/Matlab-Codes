I=imread('image3.tif');

numOfPixels=size(I,1)*size(I,2);

HImage=uint8(zeros(size(I,1),size(I,2)));

freq=zeros(256,1);

probf=zeros(256,1);

probc=zeros(256,1);

cum=zeros(256,1);

output=zeros(256,1);

for i=1:size(I,1)

    for j=1:size(I,2)

        value=I(i,j);

        freq(value+1)=freq(value+1)+1;

        probf(value+1)=freq(value+1)/numOfPixels;

    end

end

sum=0;

n=255;

for i=1:size(probf)

   sum=sum+freq(i);

   cum(i)=sum;

   probc(i)=cum(i)/numOfPixels;

   output(i)=round(probc(i)*n);

end

for i=1:size(I,1)

    for j=1:size(I,2)

            HImage(i,j)=output(I(i,j)+1);

    end

end

subplot(1,2,1), imshow(I)
subplot(1,2,2), imshow(HImage)

%figure,imshow(I);title('Original Image');figure,imshow(HImage);title('Histogram equalization');
