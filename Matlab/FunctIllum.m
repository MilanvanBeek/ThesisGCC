% #1
% Function to apply gray world algorithm to all images in a folder

% Specify the folder path
folderPath = 'C:\Users\USER\Documents\MATLAB\images';

% Get a list of all image files in the folder
fileList = dir(fullfile(folderPath, '*.jpg')); % Change the extension as per your image format

% Loop through each image file
for i = 1:numel(fileList)
    % Get the file name
    fileName = fileList(i).name;
    
    % Read the image
    [image, ~, alpha] = imread(fullfile(folderPath, fileName));
    [image, ~, alpha] = imread(fullfile(folderPath, fileName));

    img_lin = rgb2lin(image);

    %mshow(img_lin)
    
    percentiles = 10;
    illuminant = illumgray(img_lin,percentiles);
    
    IM_lin = chromadapt(img_lin,illuminant,ColorSpace="linear-rgb");
    
    Fin = lin2rgb(IM_lin);
     
    % Perform any required processing on the image here
    
    % Modify the image (e.g., add "ill" to the file name)
    newFileName = [fileName(1:end-4) 'ill.jpg']; % Update the extension if needed
    
    % Write the modified image with the new file name
    newImagePath = fullfile(folderPath, newFileName);
    imwrite(Fin, newImagePath);
end


