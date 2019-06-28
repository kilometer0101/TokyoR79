
library(tidyverse)
library(patchwork)

dat_g1 <- data.frame(x = c(1, 2, 3),
                 p = c(1/2, 1/3, 1/6))

g1 <- dat_g1 %>% 
  ggplot(aes(x, p))+
  geom_hline(yintercept = 0)+
  geom_segment(aes(x = x, y = p, xend = x, yend = 0), linetype = 3)+
  geom_point(data = data.frame(x = 1:3, y = 0),
             aes(x, y), shape = 21, fill = "white", size = 3)+
  geom_point(size = 3)+
  theme_classic(base_family = "HiraKakuPro-W3")+
  scale_y_continuous(expand = c(0,0.02), limits = c(0, 1))+
  scale_x_continuous(breaks = c(1:3), limits = c(1, 3))+
  xlab("実現値x")+ylab(expression(f(x)))+
  ggtitle("確率分布")+
  theme(axis.title = element_text(size = 15),
        title = element_text(size = 23))


dat_g2 <- data.frame(x = c(0.8, 1, 2, 3),
                 xend = c(1, 2, 3, 3.2),
                 y = c(0, 1/2, 1/2+1/3, 1))

g2 <- dat_g2 %>% 
  ggplot(aes(x, y))+
  geom_segment(aes(xend = x, yend = 0), linetype = 3)+
  geom_segment(aes(xend = xend, yend = y))+
  geom_point(data = filter(dat_g2, x >= 1),
             aes(x, y), size = 3)+
  geom_point(data = filter(dat_g2, xend <= 3),
             aes(xend, y), shape = 21, fill = "white",size = 3)+
  theme_classic(base_family = "HiraKakuPro-W3")+
  scale_y_continuous(expand = c(0, 0.02), limits = c(0, 1))+
  scale_x_continuous(breaks = c(1:3), limits = c(0.8, 3.2))+
  xlab("実現値x")+ylab(expression(F(x)))+
  ggtitle("確率累積分布")+
  theme(axis.title = element_text(size = 15),
        title = element_text(size = 23))

g <- g1 + g2

ggsave("fig/fig2.png", g, width = 8, height = 4)