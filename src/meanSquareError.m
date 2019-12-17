function error = meanSquareError (gamma_hat, gamma)

m = size(gamma_hat,1);
error = 0;
for i = 1 : m
   error = error + ( gamma_hat(i) - double(gamma(i)) ) ^ 2;
end
error = error / m;

end