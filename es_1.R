
############################################################

library(foreign)
es1 <- read.dta("C:/Users/CJY/Desktop/es/ES-Indicators-Database-.dta")
#tfp <- read.dta("C:/Users/CJY/Desktop/es/Firm Level TFP Estimates and Factor Ratios_February_21_2017.dta")
#attach(es1)

############################################################

############################################################

# http://www.statmethods.net/management/variables.html
# http://www.cookbook-r.com/Manipulating_data/Recoding_data/

es1$soe <- NULL
es1$soe[es1$car4 >= 1] <- 0
es1$soe[es1$car4 < 1] <- 2
table(es1$soe)

# http://www.statmethods.net/management/subset.html

es2 <- es1[ which(es1$soe==0),]
table(es2$soe)
table(es2$size)

wirte.csv(es2, file = "C:/Users/CJY/Desktop/es/es2.csv")
write.dta(es2, file = "C:/Users/CJY/Desktop/es/es2.dta")


table(es2$size)
es2$size1 <- NA
es2$size1[size = "small(<20)" ] <- 1
es2$size1[size = "medium(20-99)" ] <- 2
es2$size1[size = "large(100 and over)" ] <- 3
table(es2$size1)

############################################################

table(es2$idstd)# firm id
table(es2$year)# year

table(es2$size)# company size
table(es2$exporter)# exporter or now

table(es2$secfpct1)# ?

table(es2$car1)# company age
table(es2$car2)# private domestic ownership
table(es2$car3)# private foreign ownership
table(es2$car4)# state ownership
table(es2$car6)# proportion of a firm held by the largest owner

table(es2$perf1)# real annual sales growth
table(es2$perf2)# annual employment growth

table(es2$obst1)# the biggest obstacle, access to finance
table(es2$obst2)# the biggest obstacle, access to land
table(es2$obst3)# the biggest obstacle, business licensing and permits
table(es2$obst4)# the biggest obstacle, corruption
table(es2$obst5)# the biggest obstacle, courts
table(es2$obst6)# the biggest obstacle, crime, theft and disorder
table(es2$obst7)# the biggest obstacle, customs and trade regulations
table(es2$obst8)# the biggest obstacle, electricity
table(es2$obst9)# the biggest obstacle, inadequately educated workforce
table(es2$obst10)# the biggest obstacle, labor regulations
table(es2$obst11)# the biggest obstacle, political instability
table(es2$obst12)# the biggest obstacle, practices of competitors in the informal sector
table(es2$obst13)# the biggest obstacle, tax administration
table(es2$obst14)# the biggest obstacle, tax rates
table(es2$obst15)# the biggest obstacle, transport




############################################################

library(plyr)

############################################################

library(ggplot2)
comapnyage <- ggplot(es2, aes(es2$car1))+
  geom_bar()+
  coord_flip()+
  labs(x="company age")
comapnyage
ggsave("company age.png")

ggplot(es2, aes(x=es2$obst1)) + 
  geom_bar()

table(es2$obst1)
table(es2$perf1)

ggplot(es2, aes(x = factor(es2$obst1), y=es2$perf1)) +  
  geom_boxplot()

ggplot(es$soe, aes(x=factor(es$soe), y=es$per)) +  
  geom_boxplot() +
  scale_fill_manual(values = c("yellow", "orange")) + 
  ggtitle("SOE and Performance") + 
  theme(axis.text.x = element_text(angle=90, face="bold", colour="black"))

es1 <- na.omit(es)
table(es$soe)
is.numeric(es$soe)

mosaicplot(~obst1 + car1, data = es2, main = "Survival on The Titanic", color= T) 



############################################################


model1 <- lm(es2$perf1 ~ es2$size + es2$exporter + es2$car1 + es2$car6 + factor(es2$obst1) + factor(es2$obst2), data = es2)
summary(model1)


############################################################




