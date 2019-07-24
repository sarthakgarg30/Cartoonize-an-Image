I=imread('emma2.jpg');

% There are many edge detection methods such as canny,sobel,roberts etc 
Ie=edge(rgb2gray(I),'roberts');
Ie=~Ie;
Ie=double(Ie);
figure,imshow(I);
In=I;

Id=double(I);
data=zeros(size(Id,1)*size(Id,2),5);
k=1;
for i=1:size(I,1)a
        data(k,:)=[Id(i,j,1),Id(i,j,2),Id(i,j,3),i,j];
        k=k+1;
    end
end

% Here km are the number of clusters to be formed.These need to be manually
% adjusted for images.
km=15;
[l,cc]=kmeans(data(:,1:3),km);

cc=round(cc);

%For loop for changing the pixel values by acquiring indexs from data and
%rgb from clusters
for i=1:size(I,1)*size(I,2)
    In(data(i,4),data(i,5),1)=cc(l(i),1);
    In(data(i,4),data(i,5),2)=cc(l(i),2);
    In(data(i,4),data(i,5),3)=cc(l(i),3);
end

Img=In;

sz=3;
Ic=double(Img);
filter=ones(sz,sz)/(sz*sz);
Img=imfilter(Ic,filter);
% Mask to check that the pixel on the image is close to black(used to tell whether edge or not) 
mask=Ie<0.2;

I2=cat(3,mask,mask,mask);
Img(I2)=0;
I2=uint8(I2);
figure,imshow(Img/255);
It=Img/255;
imwrite(It,'image_n.jpg');

