library(tidyverse)

dat <- data.frame(x = seq(-5, 5, by = 0.01)) %>% 
  mutate(y = x^3)

ggplot(dat, aes(x, y))+
  geom_hline(yintercept = 1, linetype = 3)+
  geom_vline(xintercept = 1, linetype = 3)+
  geom_path()+
  theme_classic()+
  theme(text = element_blank(),
        axis.ticks = element_blank())+
  geom_point(x = 1, y = 1, size = 3)

ggsave("fig/fig1.png", width = 5, height = 4)
