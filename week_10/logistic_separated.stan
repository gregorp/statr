data {
  int<lower=0> N;
  vector[N] x;
  int<lower=0,upper=1> y[N];
}
parameters {
  real beta;
}
model {
  beta ~ normal(0, 3);
  y ~ bernoulli_logit(beta * x);
}
