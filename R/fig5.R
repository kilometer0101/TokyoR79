library(patchwork)
library(tidyverse)

set.seed(71)

N <- 3000
dat <- data.frame(x = rnorm(N)) %>% 
  rowid_to_column("index")


theme_fig5 <- function(...){
  list(
    theme_classic(base_family = "HiraKakuPro-W3"),
    theme(axis.title = element_text(size = 17),
          title = element_text(size = 25))
  )
}

g1 <- dat %>% 
  ggplot(aes(index, x))+
  geom_point()+
  theme_fig5()


g2 <- dat %>% 
  ggplot(aes(x))+
  geom_histogram()+
  coord_flip()+
  theme_fig5()

g <- wrap_plots(g1, g2, ncol = 2, widths = c(2,1))

ggsave("fig/fig5.png", g, width = 8, height = 3.5)