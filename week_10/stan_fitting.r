library("rstan")

x = c(-2, -2, 5, -2, -2, 5)
y = c(0, 0, 1, 0, 0, 1)
N = length(x)

rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

fit = stan(file = "logistic_separated.stan")
summary(fit)
stan_dens(fit)

#### Radon example

library(rstanarm)
fit_rad = stan_lmer(y ~ x + (1 | county), data = radon)

summary(fit_rad)
stan_dens(fit_rad)
pp_check(fit_rad)
pp_check(fit_rad, "residuals")
pp_check(fit_rad, "scatter")


## mtcars with priors

fit_mt = stan_glm(mpg ~ wt + disp + factor(cyl), data = mtcars, prior = student_t(df = 2))
pp_check(fit_mt)
pp_check(fit_mt, "residuals")
pp_check(fit_mt, "scatter")
