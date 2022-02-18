library(ggplot2)

setwd("C:/Users/Jamie Walker/OneDrive - Nexus365/biology/Uni/3rd Year/Computer Classes HT 22/git-usage")
# Change to your working directory

sods_data <- read.csv("data/stackoverflow-git-data.csv")
# when you are importing something from a folder that is within your working directory, 
# you need to specify the folder that the file is in

g <- ggplot(
  data = sods_data,
  mapping = aes(x = year, y = percentage)) +
  geom_point() +
  geom_smooth(method = "lm") +
  geom_text(
    aes(x = 2020, y = 82.8, label = "only GitHub"),
    nudge_x = 0.2,
    nudge_y = -4) +
  labs(
    x = "Year",
    y = "Percentage who used git",
    title = "Git usage has increased",
    subtitle = "Data from Stackoverflow Developer Survey")

ggsave(filename = "git-usage.png",
       plot = g,
       height = 7.4,
       width = 10.5,
       units = "cm")

sink(file = "regression-summary.txt")
summary(lm(percentage ~ year, data = sods_data))
sink()
