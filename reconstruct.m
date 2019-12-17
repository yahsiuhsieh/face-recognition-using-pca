%Input  -> Image, mean subtracted matrix, average matrix, eigen matrix, number of PCs)
%Output -> Reconstructed image

function gamma_hat = reconstruct(gamma, A, mean, eigenvec, M )

[rows, ~] = size(gamma(:,1));
PC_score = zeros(rows,1);

for i = 1 : M
    ui = A * eigenvec(:,i) / norm(A * eigenvec(:,i));
    wi = ui' * ( double(gamma) - mean );
    PC_score = PC_score + wi * ui;
end
gamma_hat = PC_score + mean;

end