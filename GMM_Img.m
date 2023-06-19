% #3
% Load illuminated version of image

img = imread('1354IllumnGray.jpg');

%% Load Generated colours

cols = readmatrix('coloursGaussian.xlsx')

%% Load segmented version of image

[~, ~, alpha] = imread('1354.jpg'); % read image, colour & alpha value
[~, ~, alpha] = imread('1354.jpg'); % read image, colour & alpha value

%% Get relevant pixels of illuminated colours and original mask
R = double(img(:, :, 1));
G = double(img(:, :, 2));
B = double(img(:, :, 3));

% Create logical mask where alpha values are not 0
mask = alpha ~= 0;

% Apply the mask to the RGB channels
R_masked = R .* mask;
G_masked = G .* mask;
B_masked = B .* mask;

R = R_masked(mask);
G = G_masked(mask);
B = B_masked(mask);

%Dataset with RGB-values
RGB = horzcat(R, G, B);
%% Fit Gaussian mixture model to data X and components k
X = RGB;
k = 1;

gmfit = fitgmdist(X,k);

disp('Mean point is: ');
disp(gmfit.mu);
mean = gmfit.mu;
numIter = gmfit.NumIterations;

clusterind = cluster(gmfit,X);

%% Set-up visualisation
x = RGB(:,1); % x = R
y = RGB(:,2); % y = G
z = RGB(:,3); % x = B


% Create point sizes of 3 for scatterplot
size = 3 * ones(size(x,1), 1);


Scaled_RGB = RGB/255;

%% Visualise pixels

scatter3(x,y,z, size, Scaled_RGB, 'filled')
%Rescaled_RGB   clusterind  Scaled_RGB
xlabel('Red');
ylabel('Green');
zlabel('Blue');

%%

point = mean;
clusterIndexNewPoint = cluster(gmmModelBaseColours, point); % 

% Compare clusterIndexNewPoint with clusterIndexBaseColours to retrieve the
% colour of the input image

