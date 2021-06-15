library(ggplot2)
library(extrafont)
library(scales)
library(grid)
loadfonts(device = "win")
setwd("D:/Lab/OA/Pn_OA")

tes <- read.table('./Pn_total_genome_compare_te.txt', header = T, sep = '\t')
head(tes)
tes$te_type
ggplot(tes, aes(reorder(spp, +order), percentage, fill=reorder(te_type, -pos)))+
  geom_bar(stat='identity', width=.4, colour = "#403e3e")+ xlab("") +
  scale_fill_manual(tes$te_type, values = c("#b0b0b0", "#9C3391", "#406BB4", "#09B283", "#FA6658")) +
  scale_y_continuous(name = "Distribution of TEs in genome (%)", expand = expansion(mult = c(0,.6))) +
  theme_classic()+
  theme(axis.title.y = element_text(family = "serif", size=18, colour = "black"))+
  theme(axis.text.x =element_blank()) +
  theme(axis.text.y =element_text(family = "serif", size = 12, colour = "black")) + 
  theme(strip.text.y = element_text(size=14, family= "serif", face="bold")) + 
  theme(legend.title = element_blank()) +
  theme(legend.text = element_text(size=12, family="serif")) + 
  theme(legend.position = c(.9,.85))
ggsave("test.tiff", units="in", width=4, height=4, dpi=600, compression = 'lzw')
