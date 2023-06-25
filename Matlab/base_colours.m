
folder = 'imgs'; % Folder containing the images
file_list = dir(fullfile(folder, '*.png')); % List all JPG files in the folder
%%
RGB_cell = cell(numel(file_list), 1);
%%
for i = 1:numel(file_list)
    % Read the image
    filename = fullfile(folder, file_list(i).name);
    img = imread(filename);

    % Extract RGB channels
    R = double(img(:, :, 1));
    G = double(img(:, :, 2));
    B = double(img(:, :, 3));

    % Flatten the channels
    r_list = R(:);
    g_list = G(:);
    b_list = B(:);

    % Stack the lists horizontally
    RGB_cell{i} = horzcat(r_list, g_list, b_list);
end
%%
RGB_stacked = vertcat(RGB_cell{:});

%% Generate Gaussian mixtires

numComponents = 3;  % Specify the desired number of components in the GMM
gmmModelBaseColours = fitgmdist(RGB_stacked, numComponents);

%% Create cluster index

clusterIndexBaseColours = cluster(gmmModelBaseColours, RGB_stacked);

%%
x = RGB_stacked(:,1); % x = R
y = RGB_stacked(:,2); % y = G
z = RGB_stacked(:,3); % x = B


% Create point sizes of 3 for scatterplot
size = 3 * ones(size(x,1), 1);


Scaled_RGB_stacked = RGB_stacked/255;

%% Visualisation of colour clusters

scatter3(x,y,z, size, clusterIndexBaseColours, 'filled')
%Rescaled_RGB   clusterIndexBaseColours  Scaled_RGB_stacked
xlabel('Red');
ylabel('Green');
zlabel('Blue');
xlim([0, 255]);
ylim([0, 255]);
zlim([0, 255]);

