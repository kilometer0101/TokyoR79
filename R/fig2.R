
library(tidyverse)
library(patchwork)

g1 <- data.frame(x = c(0, 1, 2, 3),
                 p = c(0, 1/2, 1/3, 1/6)) %>% 
  ggplot(aes(x, p))+
  geom_point(size = 3)+
  geom_segment(aes(x = x, y = p, xend = x, yend = 0), linetype = 3)+
  theme_classic(base_family = "HiraKakuPro-W3")+
  scale_y_continuous(expand = c(0,0.02), limits = c(0, 1))+
  scale_x_continuous(breaks = c(0:3), limits = c(0, 3))+
  xlab("実現値x")+ylab(expression(f(x)))+
  ggtitle("確率分布")+
  theme(axis.title = element_text(size = 15))


g2 <- data.frame(x = c(0, 1, 2, 3),
                 xend = c(1, 2, 3, 3.2),
                 y = c(0, 1/2, 1/2+1/3, 1)) %>% 
  ggplot()+
  geom_segment(aes(x = x, y = y, xend = x, yend = 0), linetype = 3)+
  geom_segment(aes(x = x, y = y, xend = xend, yend = y))+
  geom_point(aes(x, y), size = 3)+
  geom_point(data = data.frame(xend = c(1, 2, 3), y = c(0, 1/2, 1/2+1/3)),
             aes(xend, y), shape = 1, size = 3)+
  theme_classic(base_family = "HiraKakuPro-W3")+
  scale_y_continuous(expand = c(0, 0.02), limits = c(0, 1))+
  xlab("実現値x")+ylab(expression(F(x)))+
  ggtitle("確率密度分布")+
  theme(axis.title = element_text(size = 15))

g <- g1 + g2

ggsave("fig/fig2.png", g, width = 8, height = 4)