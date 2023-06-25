%For non transparent images

RGB = imread('c_brown.jpg'); % read image, color image

R = RGB(:, :, 1);
G = RGB(:, :, 2);
B = RGB(:, :, 3);

% Merge RGB values
mergedRGB = cat(3, R, G, B);

% Reshape the merged RGB values into a 2D matrix
mergedRGB = reshape(mergedRGB, [], 3);

% Convert mergedRGB to double
RGB = double(mergedRGB);
%%
X = RGB;
k = 1;

%options = statset('MaxIter',2);     ,'Options',options

gmfit = fitgmdist(X,k );

disp('Mean points are: ');
disp(gmfit.mu);
mean = gmfit.mu;

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
xlim([0, 255]);
ylim([0, 255]);
zlim([0, 255]);

%% 

point = mean;
clusterIndexNewPoint = cluster(gmmModelBaseColours, point) % 

% Compare clusterIndexNewPoint with clusterIndexBaseColours to retrieve the
% colour of the input image
