%% Compute neutral face
imgFolder = '~/images';
neutral_face_filename = dir(fullfile(imgFolder, '*a.jpg'));
neutral_face_filename = natsortfiles({neutral_face_filename.name});

num_of_pics = 190;
num_of_pixel = 162*193;
A = zeros(num_of_pixel, num_of_pics);
average_neutral_face = zeros(num_of_pixel, 1);

for i = 1 : num_of_pics
    cur_img = imread(fullfile(imgFolder, neutral_face_filename{i}));
    cur_img = reshape(cur_img, [num_of_pixel, 1]);
    A(:, i) = cur_img;
    average_neutral_face = average_neutral_face + double(cur_img);
end

average_neutral_face = average_neutral_face / num_of_pics;
A = A - repmat(average_neutral_face, 1, num_of_pics);


%% (a) Compute the Principal Components for the first 190 neutral expression images
% Find eigenvalues and corresponding eigenvectors
[U, S, V]= svd(A'*A);

% Plot the singular values
s = zeros(190, 1);
for i = 1 : 190
    s(i,1) = S(i,i);
end

figure;
plot(s);
title('Singular Values');
hold on;


%% (b) Reconstruct one of 190 individuals¡¦ neutral expression image using different number of PCs. (choose 1a.jpg)
N = [1, 30, 70, 100, 130, 150, 170, 190];   % Number of PCs

test_img = imread('/Users/arthur/Documents/UCSD/ECE 269/Project/images/1a.jpg');
test_img = reshape(test_img, [num_of_pixel, 1]);
mse = zeros(numel(N), 1);

figure;
for i = 1 : numel(N)
    % Reconstruct the image
    gamma_hat = reconstruct(test_img, A, average_neutral_face, U, N(i));
    
    % Calculate MSE
    mse(i,1) = meanSquareError(gamma_hat, test_img);
    
    % Show the reconstructed images
    subplot(2, 4, i);
    img = reshape(gamma_hat, [193, 162]);
    imagesc(img);
    colormap(gray);
    title(['Num of PCs = ', num2str(N(i))]);
    hold on;
end

figure;
plot(N, mse);
title('Mean Squared Error of neutral face (1a.jpg)');
hold on;


%% (c) Reconstruct one of 190 individuals¡¦ smile expression image using different number of PCs. (choose 1b.jpg)
test_img = imread('/Users/arthur/Documents/UCSD/ECE 269/Project/images/1b.jpg');
test_img = reshape(test_img, [num_of_pixel, 1]);
mse = zeros(numel(N), 1);

figure;
for i = 1 : numel(N)
    % Reconstruct the image
    gamma_hat = reconstruct(test_img, A, average_neutral_face, U, N(i));
    
    % Calculate MSE
    mse(i,1) = meanSquareError(gamma_hat, test_img);
    
    % Show the reconstructed images
    subplot(2, 4, i);
    img = reshape(gamma_hat, [193, 162]);
    imagesc(img);
    colormap(gray);
    title(['Num of PCs = ', num2str(N(i))]);
    hold on;
end

figure;
plot(N, mse);
title('Mean Squared Error of smile face (1b.jpg)');
hold on;


%% (d) Reconstruct one of the other 10 individuals¡¦ neutral expression image using different number of PCs. (choose 191a.jpg)
test_img = imread('/Users/arthur/Documents/UCSD/ECE 269/Project/images/191a.jpg');
test_img = reshape(test_img, [num_of_pixel, 1]);
mse = zeros(numel(N), 1);

figure;
for i = 1 : numel(N)
    % Reconstruct the image
    gamma_hat = reconstruct(test_img, A, average_neutral_face, U, N(i));
    
    % Calculate MSE
    mse(i,1) = meanSquareError(gamma_hat, test_img);
    
    % Show the reconstructed images
    subplot(2, 4, i);
    img = reshape(gamma_hat, [193, 162]);
    imagesc(img);
    colormap(gray);
    title(['Num of PCs = ', num2str(N(i))]);
    hold on;
end

figure;
plot(N, mse);
title('Mean Squared Error of neutral face (191a.jpg)');
hold on;


%% (e) Use any other non-human image and try to reconstruct it using all PCs.
test_img = imread('/Users/arthur/Documents/UCSD/ECE 269/Project/images/audi.jpg');
test_img = rgb2gray(test_img);
test_img = imresize(test_img, [193 162]);
test_img = reshape(test_img, [num_of_pixel, 1]);

figure;
score = zeros(num_of_pixel, 1);

% Reconstruct the image
gamma_hat = reconstruct(test_img, A, average_neutral_face, U, 190);

% Show the original and reconstructed images
subplot(1, 2, 1);
test_img = reshape(test_img, [193, 162]);
imagesc(test_img);
colormap(gray);
title('Original Image');

subplot(1, 2, 2);
img = reshape(gamma_hat, [193, 162]);
imagesc(img);
colormap(gray);
title('Reconstructed Image using All PCs');
hold on;


%% (f) Rotate one of 190 individuals¡¦ neutral expression image with different degrees and try to reconstruct it using all PCs. (choose 1a.jpg)
test_img = imread('/Users/arthur/Documents/UCSD/ECE 269/Project/images/1a.jpg');

figure;
for i = 1 : 6
    % Rotate and display the image
    subplot(2, 6, i);
    angle = 30 * i;
    rotated_img = imrotate(test_img, angle, 'crop');
    imagesc(rotated_img);
    colormap(gray);
    title(['Rotate ', num2str(angle), ' degree']);
    
    % Reconstruct the image
    rotated_img = reshape(rotated_img, [num_of_pixel, 1]);
    gamma_hat = reconstruct(rotated_img, A, average_neutral_face, U, 190);
    
    % Show the reconstructed image
    img = reshape(gamma_hat, [193, 162]);
    subplot(2, 6, i+6);
    imagesc(img);
    colormap(gray);
    title('Reconstructed Image');
end

