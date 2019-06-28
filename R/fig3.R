
theme_fig3 <- function(g, ...){
  g + 
    theme_classic(base_family = "HiraKakuPro-W3")+
    scale_y_continuous(limits = c(0, 1), breaks = c(0:4/4))+
    scale_x_continuous(limits = c(-0.2, 1.2), breaks = c(0, 1), 
                       labels = c(expression(x[min]), expression(x[min])))+
    theme(axis.title = element_text(size = 20),
          axis.text.x = element_text(size = 17),
          title = element_text(size = 25))
}

g1 <- data.frame(x = c(0, 1), y = 0) %>% 
  ggplot(aes(x, y))+
  geom_point(size = 3)+
  geom_path()+
  ylab(expression(italic(f)(x)))+
  ggtitle("確率分布")

g2 <- data.frame(x = c(0, 1), y = c(0, 1)) %>% 
  ggplot(aes(x, y))+
  geom_segment(aes(xend = x, yend = 0), linetype = 3)+
  geom_point(size = 3)+
  geom_path()+
  ylab(expression(F(x)))+
  ggtitle("累積分布")

g3 <- data.frame(x = c(0, 1), y = 0.6) %>% 
  ggplot(aes(x, y))+
  geom_hline(yintercept = 0.6, linetype = 3)+
  geom_segment(aes(xend = x, yend = 0), linetype = 3)+
  geom_point(size = 3)+
  geom_path()+
  ylab(expression(f(x)))+
  ggtitle("確率密度")



g <- map(list(g1, g2, g3),  theme_fig3) %>% 
  wrap_plots()

ggsave("fig/fig3.png", g, width = 10, height = 4)
