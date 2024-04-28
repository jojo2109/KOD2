clc;
clear;


% Load the data from the .mat file
data = load('Results\EPFL_Palais_du_Luxembourg.mat');

% Access the multi-plane image data from the 'LF' field
LF = data.LF;

% Get the dimensions of the light field
[height, width, channels, num_views] = size(LF);

% Visualize individual views (assuming RGB channels)
for view_idx = 1:num_views
    % Extract the view
    view_data = LF(:, :, :, view_idx);
    
    % Display each channel separately
    for channel_idx = 1:channels
        subplot(num_views, channels, (view_idx-1)*channels + channel_idx);
        imshow(view_data(:, :, channel_idx));
        title(['View ', num2str(view_idx), ', Channel ', num2str(channel_idx)]);
    end
end
