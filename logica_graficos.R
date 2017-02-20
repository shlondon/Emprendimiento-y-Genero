

bd <- read.csv("base_datos_sin_NA.csv")
bd <- bd[bd$country=="Colombia",]


m1 <- glm(SUBOANW ~ gender*age + gender*GEMEDUC + gender*GEMWORK3 + gender*GEMHHINC +
            gender*opport + gender*suskill + gender*fearfail + gender*nbgoodc + 
            gender*nbstatus +  gender*knowent + gender*nbmedia, 
          family = "binomial",
          data = bd)
summary(m1)

library(ggplot2)


g0 <- ggplot(bdu3[bdu3$country=="Colombia",], aes(x=SUBOANW,fill=SUBOANW))
g0 + geom_bar()

g1 <- ggplot(bdu3[bdu3$country=="Colombia",], aes(x=SUBOANW, fill=SUBOANW)) + geom_bar() 
g1 + geom_bar() + facet_grid(~ gender)

g2 <- ggplot(bdu3[bdu3$country=="Colombia",], aes(x=gender, fill=gender))
g2 + geom_bar() + facet_grid(~ SUBOANW)

g2 <- ggplot(bdu3[bdu3$country=="Colombia",], aes(y=age,x=SUBOANW,fill=SUBOANW))
g2 + geom_boxplot() + coord_flip() + facet_wrap(~gender, ncol = 5)

