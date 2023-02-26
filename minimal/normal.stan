data {
  int<lower=1> n;
  int<lower=1> p;
  int<lower=1> d;
  matrix[n, d] y;
  matrix[n, p] x;
}

parameters {
  matrix[p, d] beta;
  vector<lower=0>[d] sigmas;
}

model {
  // likelihood
  for (i in 1:n) {
    y[i] ~ multi_normal(beta' * to_vector(x[i]), diag_matrix(sigmas));
  }
}
