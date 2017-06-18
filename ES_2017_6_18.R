
##################################################

library(foreign)
library(readstata13)
library(ggplot2)
library(lattice)
library(dplyr)
library(tidyr)
library(plotly)
library(highcharter)

##################################################

ES1 <- read.dta13(url("https://www.dropbox.com/s/i2b4v0wwouot9bo/ES-Indicators-Database-.dta?dl=0"))

##################################################

table(es2$idstd) # firm id
table(es2$year) # year
table(es2$country2) #country

table(es2$size) # company size
table(es2$exporter) # exporter or now
table(es2$ownership) # domestic or foreign

table(es2$secfpct1) # ?

table(es2$car1) # company age
table(es2$car2) # private domestic ownership
table(es2$car3) # private foreign ownership
table(es2$car4) # state ownership
table(es2$car6) # proportion of a firm held by the largest owner

table(es2$perf1) # real annual sales growth
table(es2$perf2) # annual employment growth

table(es2$obst1) # the biggest obstacle, access to finance
table(es2$obst2) # the biggest obstacle, access to land
table(es2$obst3) # the biggest obstacle, business licensing and permits
table(es2$obst4) # the biggest obstacle, corruption
table(es2$obst5) # the biggest obstacle, courts
table(es2$obst6) # the biggest obstacle, crime, theft and disorder
table(es2$obst7) # the biggest obstacle, customs and trade regulations
table(es2$obst8) # the biggest obstacle, electricity
table(es2$obst9) # the biggest obstacle, inadequately educated workforce
table(es2$obst10) # the biggest obstacle, labor regulations
table(es2$obst11) # the biggest obstacle, political instability
table(es2$obst12) # the biggest obstacle, practices of competitors in the informal sector
table(es2$obst13) # the biggest obstacle, tax administration
table(es2$obst14) # the biggest obstacle, tax rates
table(es2$obst15) # the biggest obstacle, transport

table(es2$fin2)
table(es2$stra_sector)


##################################################

table1 <- table(es2$stra_sector, es2$obst8)
table1

table2 <- table

##################################################

es1 <- na.omit(es)
table(es$soe)
is.numeric(es$soe)

class(es2$stra_sector)
class(es2$exporter)

##################################################

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

##################################################

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


##################################################

