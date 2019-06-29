data.frame(x = seq(-5, 5, by = 0.1)) %>%
  mutate(y = pnorm(x, 0, 1)) %>%
  ggplot(aes(x, y))+
  geom_path()+
  geom_point(x = 1, y = pnorm(1, 0, 1), size = 3)+
  geom_segment(x = 1, xend = 1, 
               y =  pnorm(1, 0, 1), yend = 0,
               linetype = 3)+
  geom_segment(x = -5, xend = 1, 
               y =  pnorm(1, 0, 1), yend = pnorm(1, 0, 1),
               linetype = 3)+
  theme_classic(base_family = "HiraKakuPro-W3")+
  theme(axis.title.x = element_text(size = 15),
        axis.title.y = element_blank(),
        title = element_text(size = 21))+
  xlab("実現値x")

ggsave("fig/fig4.png", width = 7, height = 4.5)