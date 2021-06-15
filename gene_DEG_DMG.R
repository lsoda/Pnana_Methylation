library(ggplot2)
library(extrafont)
library(scales)
library(grid)
library(RColorBrewer)
library(data.table)

setwd("D:/Lab/OA/Pn_OA/wgbs_202008")
tb <- read.table("GO/gene_hsp90.txt", sep = '\t', header = T)
summary(tb)
max_ratio <- max(tb$DEG)/max(tb$DMG)
max_ratio <- 1
colors <- c("DMG" = "blue", "DEG" = "red")

ylim.prim <- c(-2.5, 2.5)   # in this example, precipitation
ylim.sec <- c(0, 5)    # in this example, temperature
b <- diff(ylim.prim)/diff(ylim.sec)
a <- b*(ylim.prim[1] - ylim.sec[1])

ggplot(tb, aes(x=factor(Pn003_5050),y=DEG, group=1)) +
  geom_line(color = "red", size = 1)+
  geom_line(aes(y = a + DMG*b), color = "blue", size = 1) + # Divide by 10 to get the same range than the temperature
  scale_y_continuous(
    breaks = c(-2,-1,0,1,2),
    limits=c(-2.5, 2.5),
    # Features of the first axis
    name = "log(Fold Change)",
    # Add a second axis and specify its features
    sec.axis = sec_axis(~(.-a)/b, name="Methylation Ratio"))+
  theme_bw()+
  theme(axis.title.y = element_text(family = "serif", size=22, colour = "black"))+
  theme(axis.title.x =element_blank()) +
  theme(axis.text.x = element_text(family = "serif", size = 16, colour = "black")) +
  theme(axis.text.y = element_text(family = "serif", size = 14, colour = "black")) + 
  theme(strip.text.y = element_text(size=14, family= "serif", face="bold"))


tb2 <- read.table("GO/gene_hsp70.txt", sep = '\t', header = T)
summary(tb2)
max_ratio <- max(tb2$DEG)/max(tb2$DMG)
max_ratio <- 1
colors <- c("DMG" = "blue", "DEG" = "red")

ggplot(tb2, aes(x=factor(Pn004_6340),y=DEG, group=1)) +
  geom_line(color = "red", size = 1)+
  geom_line(aes(y = a + DMG*b), color = "blue", size = 1) + # Divide by 10 to get the same range than the temperature
  scale_y_continuous(
    breaks = c(-2,-1,0,1,2),
    limits=c(-2.5, 2.5),
    # Features of the first axis
    name = "log(Fold Change)",
    # Add a second axis and specify its features
    sec.axis = sec_axis(~(.-a)/b, name="Methylation Ratio"))+
  theme_bw()+
  theme(axis.title.y = element_text(family = "serif", size=22, colour = "black"))+
  theme(axis.title.x =element_blank()) +
  theme(axis.text.x = element_text(family = "serif", size = 16, colour = "black")) +
  theme(axis.text.y = element_text(family = "serif", size = 14, colour = "black")) + 
  theme(strip.text.y = element_text(size=14, family= "serif", face="bold"))

tb3 <- read.table("GO/gene_cult.txt", sep = '\t', header = T)
summary(tb3)
max_ratio <- max(tb3$DEG)/max(tb3$DMG)
max_ratio <- 1
colors <- c("DMG" = "blue", "DEG" = "red")

ggplot(tb3, aes(x=factor(Pn001_3980),y=DEG, group=1)) +
  geom_line(color = "red", size = 1)+
  geom_line(aes(y = a + DMG*b), color = "blue", size = 1) + # Divide by 10 to get the same range than the temperature
  scale_y_continuous(
    breaks = c(-2,-1,0,1,2),
    limits=c(-2.5, 2.5),
    # Features of the first axis
    name = "log(Fold Change)",
    # Add a second axis and specify its features
    sec.axis = sec_axis(~(.-a)/b, name="Methylation Ratio"))+
  theme_bw()+
  theme(axis.title.y = element_text(family = "serif", size=22, colour = "black"))+
  theme(axis.title.x =element_blank()) +
  theme(axis.text.x = element_text(family = "serif", size = 16, colour = "black")) +
  theme(axis.text.y = element_text(family = "serif", size = 14, colour = "black")) + 
  theme(strip.text.y = element_text(size=14, family= "serif", face="bold"))

tb4 <- read.table("GO/gene_rab32.txt", sep = '\t', header = T)
summary(tb4)
max_ratio <- max(tb4$DEG)/max(tb4$DMG)
max_ratio <- 1
colors <- c("DMG" = "blue", "DEG" = "red")

ggplot(tb4, aes(x=factor(Pn009_0740), y=DEG, group=1)) +
  geom_line(color = "red", size = 1)+
  geom_line(aes(y = a + DMG*b), color = "blue", size = 1) + # Divide by 10 to get the same range than the temperature
  scale_y_continuous(
    breaks = c(-2,-1,0,1,2),
    limits=c(-2.5, 2.5),
    # Features of the first axis
    name = "log(Fold Change)",
    # Add a second axis and specify its features
    sec.axis = sec_axis(~(.-a)/b, name="Methylation Ratio"))+
  theme_bw()+
  theme(axis.title.y = element_text(family = "serif", size=22, colour = "black"))+
  theme(axis.title.x =element_blank()) +
  theme(axis.text.x = element_text(family = "serif", size = 16, colour = "black")) +
  theme(axis.text.y = element_text(family = "serif", size = 14, colour = "black")) + 
  theme(strip.text.y = element_text(size=14, family= "serif", face="bold"))


tb5 <- read.table("GO/gene_pxt.txt", sep = '\t', header = T)
summary(tb5)
max_ratio <- max(tb5$DEG)/max(tb5$DMG)
max_ratio <- 1
colors <- c("DMG" = "blue", "DEG" = "red")

ggplot(tb5, aes(x=factor(Pn068_0510), y=DEG, group=1)) +
  geom_line(color = "red", size = 1)+
  geom_line(aes(y = a + DMG*b), color = "blue", size = 1) + # Divide by 10 to get the same range than the temperature
  scale_y_continuous(
    breaks = c(-2,-1,0,1,2),
    limits=c(-2.5, 2.5),
    # Features of the first axis
    name = "log(Fold Change)",
    # Add a second axis and specify its features
    sec.axis = sec_axis(~(.-a)/b, name="Methylation Ratio"))+
  theme_bw()+
  theme(axis.title.y = element_text(family = "serif", size=22, colour = "black"))+
  theme(axis.title.x =element_blank()) +
  theme(axis.text.x = element_text(family = "serif", size = 16, colour = "black")) +
  theme(axis.text.y = element_text(family = "serif", size = 14, colour = "black")) + 
  theme(strip.text.y = element_text(size=14, family= "serif", face="bold"))
tb6 <- read.table("GO/gene_mrp1.txt", sep = '\t', header = T)
summary(tb6)
max_ratio <- max(tb6$DEG)/max(tb6$DMG)
max_ratio <- 1
colors <- c("DMG" = "blue", "DEG" = "red")

ggplot(tb6, aes(x=factor(Pn005_6430), y=DEG, group=1)) +
  geom_line(color = "red", size = 1)+
  geom_line(aes(y = a + DMG*b), color = "blue", size = 1) + # Divide by 10 to get the same range than the temperature
  scale_y_continuous(
    breaks = c(-2,-1,0,1,2),
    limits=c(-2.5, 2.5),
    # Features of the first axis
    name = "log(Fold Change)",
    # Add a second axis and specify its features
    sec.axis = sec_axis(~(.-a)/b, name="Methylation Ratio"))+
  theme_bw()+
  theme(axis.title.y = element_text(family = "serif", size=22, colour = "black"))+
  theme(axis.title.x =element_blank()) +
  theme(axis.text.x = element_text(family = "serif", size = 16, colour = "black")) +
  theme(axis.text.y = element_text(family = "serif", size = 14, colour = "black")) + 
  theme(strip.text.y = element_text(size=14, family= "serif", face="bold"))

tb7 <- read.table("GO/gene_mrp1_2.txt", sep = '\t', header = T)
summary(tb7)
max_ratio <- max(tb7$DEG)/max(tb7$DMG)
max_ratio <- 1
colors <- c("DMG" = "blue", "DEG" = "red")

ggplot(tb7, aes(x=factor(Pn019_0800), y=DEG, group=1)) +
  geom_line(color = "red", size = 1)+
  geom_line(aes(y=DMG*max_ratio,group=1), color = "blue", size = 1) + # Divide by 10 to get the same range than the temperature
  scale_y_continuous(
    breaks = c(-2,-1,0,1,2),
    limits=c(-2.5, 2.5),
    # Features of the first axis
    name = "log(Fold Change)",
    # Add a second axis and specify its features
    sec.axis = sec_axis(~.+2, name="Methylation Ratio"))+
  theme_bw()+
  theme(axis.title.y = element_text(family = "serif", size=22, colour = "black"))+
  theme(axis.title.x =element_blank()) +
  theme(axis.text.x = element_text(family = "serif", size = 16, colour = "black")) +
  theme(axis.text.y = element_text(family = "serif", size = 14, colour = "black")) + 
  theme(strip.text.y = element_text(size=14, family= "serif", face="bold"))





















  # #library
# library(latticeExtra)
# 
# # create data
# tb
# 
# # --> construct separate plots for each series
# obj1 <- xyplot(tb$DEG ~ tb$Pn003_5050, tb, type = "l" , lwd=2, col="steelblue")
# obj2 <- xyplot(tb$DMG ~ tb$Pn003_5050, tb, type = "l", lwd=2, col="#69b3a2")
# 
# # --> Make the plot with second y axis:
# doubleYScale(obj1, obj2, use.style=FALSE, text = c("obj1", "obj2") , add.ylab2 = TRUE )

# library(plotly)
# ay <- list(
#   tickfont = list(color = "red"),
#   overlaying = "y",
#   side = "right",
#   title = "second y axis"
# )
# fig <- plot_ly()
# fig <- fig %>% add_lines(x = tb$Pn003_5050, y = tb$DEG, name = "slope of 10")
# fig <- fig %>% add_lines(x = tb$Pn003_5050, y = tb$DEG, name = "slope of 1", yaxis = "y2")
# fig <- fig %>% layout(
#   title = "Double Y Axis", yaxis2 = ay,
#   xaxis = list(title="x")
# )
# 
# fig
