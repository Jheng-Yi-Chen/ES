
############################################################
############################################################

library(foreign)
es1 <- read.dta("C:/Users/CJY/Desktop/es/ES-Indicators-Database-.dta")
#tfp <- read.dta("C:/Users/CJY/Desktop/es/Firm Level TFP Estimates and Factor Ratios_February_21_2017.dta")
#attach(es1)
qog1 <- read.dta("C:/Users/CJY/Desktop/es/qog_std_ts_jan17.dta")

############################################################

qog1$cy <- qog1$ccode*qog1$year
es1$cy <- es1$ccode*es1$year

mr1 <- merge(x = es1, y = qog1, by = "cy")

############################################################


# http://www.statmethods.net/management/variables.html
# http://www.cookbook-r.com/Manipulating_data/Recoding_data/

mr1$soe <- NULL
mr1$soe[mr1$car4 >= 1] <- 0
mr1$soe[mr1$car4 < 1] <- 2
table(mr1$soe)

# http://www.statmethods.net/management/subset.html

es2 <- mr1[ which(mr1$car4 >= 1), ]# soe

es2$fh_rol2 <- es2$fh_rol + 1

es4 <- es2[ which(es2$stra_sector=="Manufacturing"), ]# Manufacturing

es3 <- mr1[ which(mr1$region == "EAP"), ]# east asia and pacific

wirte.csv(es2, file = "C:/Users/CJY/Desktop/es/es2.csv")
write.dta(es2, file = "C:/Users/CJY/Desktop/es/es2.dta")
write.dta(mr1, file = "C:/Users/CJY/Desktop/es/mr1.dta")

table(es2$size)
es2$size1 <- NA
es2$size1[size = "small(<20)" ] <- 1
es2$size1[size = "medium(20-99)" ] <- 2
es2$size1[size = "large(100 and over)" ] <- 3
table(es2$size1)

############################################################

table(es2$idstd)# firm id
table(es2$year)# year
table(es2$country2)#country

table(es2$size)# company size
table(es2$exporter)# exporter or now
table(es2$ownership)# domestic or foreign

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

table(es2$fin2)
table(es2$stra_sector)

table(es2$fh_rol)
table(es2$fh_rol2)
table(es2$pwt_hci)
table(es2$polity)

############################################################

library(plyr)

############################################################

table1 <- table(es2$stra_sector, es2$obst8)
table1

table2 <- table

############################################################


############################################################

es1 <- na.omit(es)
table(es$soe)
is.numeric(es$soe)

class(es2$stra_sector)
class(es2$exporter)

############################################################

library(lattice)
library(ggplot2)

comapnyage <- ggplot(es2, aes(es2$car1))+
  geom_bar(aes(color = es2$car1))+
  coord_flip()+
  scale_fill_manual(values = c("es2$car1"))+
  labs(x="company age")
comapnyage
ggsave("C:/Users/CJY/Desktop/es/company_age.png")

comapnysize <- ggplot(es2, aes(es2$size))+
  geom_bar(aes(color = es2$size))+
  coord_flip()+
  scale_fill_manual(values = c("es2$size"))+
  labs(x="company size")
comapnysize
ggsave("C:/Users/CJY/Desktop/es/company size.png")


expper <- qplot(es2$perf1, es2$car6, data = es2, colour = factor(es2$exporter)) + 
  scale_colour_manual(values = c("red","green"))
expper

boxplot(es2$perf1 ~ es2$country2)
boxplot(es3$perf1 ~ es3$country2)
barchart(es3$country2 ~ es3$perf1, data = es3)
plot(es3$perf1, es3$car6)
xyplot(es3$perf1 ~ es3$car6 | es3$country2, data = es3)

perff1 <- ggplot(es3, aes(x = car6, y = perf1)) +
  geom_point(aes(color = country2))
perff1

perff2 <- ggplot(es3, aes(x = country2, y = perf1)) +
  geom_boxplot()
perff2

############################################################

ggplot(es2, aes(x=es2$obst1)) + 
  geom_bar()

ggplot(es2, aes(x = factor(es2$obst1), y=es2$perf1)) +  
  geom_boxplot()

ggplot(es$soe, aes(x=factor(es$soe), y=es$per)) +  
  geom_boxplot() +
  scale_fill_manual(values = c("yellow", "orange")) + 
  ggtitle("SOE and Performance") + 
  theme(axis.text.x = element_text(angle=90, face="bold", colour="black"))

mosaicplot(~obst1 + car1, data = es2, main = "Survival on The Titanic", color= T)

############################################################

library(lme4)

model1 <- lmer(perf1 ~ exporter + size + car6 +
                 factor(obst1) + factor(obst11) +
                 (1|country2), data = es2)
summary(model1)
print(model1)
coef((model1))

model4 <- lmer(perf1 ~ stra_sector + exporter + size +
                 factor(obst1) + factor(obst11) +
                 (1|country2), data = es2)
summary(model4)
print(model4)
coef((model4))

model5 <- lmer(perf1 ~ exporter +
                 exporter:fh_rol2 + exporter:pwt_hci +
                 fh_rol2 + pwt_hci +
                 (1|country2), data = es2)
summary(model5)
print(model5)
coef((model5))


############################################################

summary(es2$exporter)
summary(es2$size)

summary(es2$fh_rol2);length(es2$fh_rol2)
summary(es2$pwt_hci);length(es2$pwt_hci)

table(es2$obst1)
table(es2$obst11)

table(es2$country2)

