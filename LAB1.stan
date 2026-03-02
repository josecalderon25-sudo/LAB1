data {
  int N;
  vector<lower=0, upper=99>[N] overall;
  vector<lower=0, upper=99>[N] pace;
  vector<lower=0, upper=99>[N] shooting;
  vector<lower=0, upper=99>[N] passing;
}

parameters {
  vector[4] b;
  real<lower=0> sigma;
}

transformed parameters {
  vector[N] mu = b[1] + b[2]*pace[1:N] + b[3]*shooting[1:N]+ b[4]*passing[1:N];
}

model {
  overall[1:N] ~ normal(mu[1:N], sigma);
}

generated quantities {
  array[N] real overallp = normal_rng(mu[1:N], sigma);
}
