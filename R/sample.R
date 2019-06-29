
library(tidyverse)
library(patchwork)

set.seed(71)

rnorm(1000, 0, 1)

dnorm(0, 0, 1)

pnorm(0, 0, 1)

y <- function(x, mean = 0, sd = 1){
  (2 * pi * sd)^(-1/2) * exp(-(x - mean)^2/(2*sd))
}

plot(y, -5, 5)
