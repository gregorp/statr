# Step-wise regression on mtcars

library(MASS)
mod.full = lm(mpg ~ (disp + qsec + wt + cyl)^2, data = mtcars)
# inside a model formula, squaring added
# terms means "include two-way interactions"
# You can cube for 3-way interactions, etc.

# Starting with a "big" model--lots of terms--we can step backwards
mod.back = stepAIC(object = mod.full, direction = "backward")
# Scroll up and look at the output in the console to see
# the evaluation at each step.

# To go forward, we can start with a simple model,
# this is an intercept-only model
mod.null = lm(mpg ~ 1, data = mtcars)
# We also need to specify the "scope"---how far do we want to (possibly) go?
mod.for = stepAIC(object = mod.null, scope = ~ (disp + qsec + wt + cyl)^2,
                  direction = "forward")

# Notice that our forward and backward models are different.
AIC(mod.for, mod.back)
# Though in terms of AIC, they are indistinguishable

# We could also try a "both" direction
mod.both.full = stepAIC(object = mod.full, scope = ~ (disp + qsec + wt + cyl)^2,
                   direction = "both")
mod.both.null = stepAIC(object = mod.null, scope = ~ (disp + qsec + wt + cyl)^2,
                        direction = "both")
# In this case, we get the mod.back solution, but again, it's indistinguishable
# from the mod.for solution.
# You can also set "upper" and "lower" constraints on the scope. See the examples
# at the bottom of ?stepAIC for details.

# The k argument is the penalty applied per fitted coefficient. The default
# is 2, which corresponds to AIC. If we set k = log(nrow(data)), then we're
# using BIC.
mod.bic = stepAIC(object = mod.full, scope = ~ (disp + qsec + wt + cyl)^2,
                  direction = "both", k = log(nrow(mtcars)))
# Which again gives the same result (in this case).


## Let's try with some bigger data
library(ggplot2)
head(diamonds)
diam.full = lm(price ~ (carat + cut + color + clarity)^2 + depth + 
                   table + I(x * y * z), data = diamonds)
# This will be a little slower than the mtcars example
diam.back = stepAIC(object = diam.full, direction = "backward")

# Let's do it with BIC
diam.back.bic = stepAIC(object = diam.full, direction = "backward",
                        k = log(nrow(diamonds)))

# With much bigger data, there is a much bigger penalty
log(nrow(diamonds)) # 5 times more than the penalty of 2 for AIC

# And, predictably, we fit fewer coefficients under BIC
diam.back.bic$call
diam.back$call
length(coef(diam.back.bic))
length(coef(diam.back))
