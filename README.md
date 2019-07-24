# Cartoonize-an-Image
When a convert an image to cartoon, the number colours in the images have to be brought down to remove the depth of the image
To accomplish this task, clustering can be used.

In this program K-means clustering algorithm has been used.

The R(red), G(green), B(blue) channel values for a particular pixel as well as the row (i)  and column (j) number of that particular is the stored in the form a matrix as shown below.


R | G | B | i | j 
--- | --- | --- | --- |---
128 | 128 | 128 | 0 | 0
23  | 35  |	31  | 0 | 1
65 | 43 | 51 | 0 | 2
32 | 84 | 46 | 1 | 0
12 | 28 | 64 | 1 | 1
48 | 32 | 48 | 1 | 2

K-means clustering is applied based on the RGB values using the function.

              kmeans(data(:,1:3),k)
              where data(:,1:3) gives us the RGB values from the data table
              and k is the number of clusters of RGB to be made 
             
After this a new image is made using the new RGB valued clusters formed, edges of the original image are then superimposed on this new image to give us the cartoonized image

# Original Image | Cartoonized Image 
<p align="center">
  <img align="left" img width="250" height="300" src="https://user-images.githubusercontent.com/52586921/61807580-72079c80-ae57-11e9-9dc6-a60a21bef059.jpg">
</p>


<p align="center">
  <img align="left" img width="250" height="300" src="https://user-images.githubusercontent.com/52586921/61808138-797b7580-ae58-11e9-9c16-3ee2e849e789.jpg">
</p>











