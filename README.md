##README

#README

In 'Data' the colours per pattern derived from literature (see chapter 4.4) are listed, as well as the original annotations and calculations.


First the FunctIllum.m file is ran to correct the colour scale of the images

Then
1. yolov8_custom_training.ipynb #To train the YOLOv8 model
2. CombinedNotebook_incl_segment.ipynb #To execute the custom YOLOv8 model and the Segment Anything Model


Then in MATLAB;
1. Generate (and visualise) the 'base colours'  by running base_colours.m
2. Run GMM_Img.m to group the colour of a segmented image in either black, brown or white, defined by step 2. (Gmm_nonTransparent.m for non transparent images)



Canny tests have been performed in EdgeDetection-CANNY.ipynb

