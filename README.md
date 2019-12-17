# Face Recognition using Principal Component Analysis

This repository is for face recognition based on [this paper](https://sites.cs.ucsb.edu/~mturk/Papers/mturk-CVPR91.pdf), which shows how to use Principal Component Analysis (PCA) for Face Recognition.

The paper puts forward a simple yet effective idea of using eigenfaces (obtained via PCA) to perform unsupervised face recognition. Read and understand the basic principle, and then conduct the following numerical experiments to implement and test the eigenface-based face recognition algorithm.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

This repository is based on MATLAB, so you should have MATLAB installed before running this repo.

## Code organization

    .
    ├── images                  # Images for training and testing
    ├── result                  # Folder contains my analysis and reconstructed images
    ├── src                     # MATLAB scripts
    │   ├── main.m              # Main MATLAB file
    │   ├── meanSquareError.m   # Calculate mean square error between original and reconstructed image
    │   ├── natsort.m           # Tools to read files sequentially
    │   ├── natsortfiles.m      # Tools to read files sequentially
    │   └── reconstruct.m       # Reconstruct an image
    ├── implementation.pdf      # The detailed implementations of this project
    └── README.md

## Running the tests

### Steps

1. Just run `main.m` and the resulting images will display.

## Implementations

* See this [file](https://github.com/arthur960304/face-recognition-using-pca/blob/master/implementation.pdf) for detailed implementations.

## Experiments

Here I have conducted 6 experiments

1. Compute the principal components (PCs) using first 190 individuals’ neutral expression image (* a.jpg), and plot the singular value of the data matrix.
2. Reconstruct one of 190 individuals’ neutral expression image using different number of PCs, and plot the MSE of reconstruction versus the number of principal components.
3. Reconstruct one of 190 individuals’ smiling expression image using different number of PCs, and plot the MSE of reconstruction versus the number of principal components.
4. Reconstruct one of the other 10 individuals’ neutral expression image using different number of PCs, and plot the MSE of reconstruction versus the number of principal components.
5. Use any other non-human image and try to reconstruct it using all the PCs.
6. Rotate one of 190 individuals’ neutral expression image with different degrees and try to reconstruct it using all PCs.

## Results

* Here is the one of the reconstructed result ![reconstructed neutral img](https://github.com/arthur960304/face-recognition-using-pca/blob/master/result/reconstruct_neutral_testimg.jpg)

* Here is the MSE example for above reconstructed result ![MSE of reconstruction vs PCs](https://github.com/arthur960304/face-recognition-using-pca/blob/master/result/mse_neutral_testimg.jpg)

* Here is the result for trying to reconstruct a non-human image ![car](https://github.com/arthur960304/face-recognition-using-pca/blob/master/result/car.jpg)


## Authors

* **Arthur Hsieh** - *Initial work* - [arthur960304](https://github.com/arthur960304)

## References
[1] - [M. A Turk and A. P. Pentland, “Face Recognition Using Eigenfaces", Proceedings of IEEE CVPR 1991](https://sites.cs.ucsb.edu/~mturk/Papers/mturk-CVPR91.pdf)
