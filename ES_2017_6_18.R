
##################################################

library(foreign)
library(readstata13)
library(ggplot2)
library(lattice)
library(dplyr)
library(tidyr)
library(plotly)
library(highcharter)
library(maps)
library(ggmap)
library(ggalt)

##################################################

ES1 <- read.dta("C:/Users/CJY/Desktop/eLand/ES-Indicators-Database-.dta")
str(ES1)

table(ES1$t5) # percent of firms having its own website
# ES1$t51 <- as.factor(ES1$t5)
ES1$t51 <- NA
ES1$t51[ES1$t5 == 100 ] <- "WS"
ES1$t51[ES1$t5 == 0 ] <- "NWS"
table(ES1$t51)

table(ES1$t6) # percent of firms using email to communicate with clients/suppliers
# ES1$t61 <- as.factor(ES1$t6)
ES1$t61 <- NA
ES1$t61[ES1$t6 == 100 ] <- "EM"
ES1$t61[ES1$t6 == 0 ] <- "NEM"
table(ES1$t61)

table(ES1$perf1) # real annual sales growth (%)
table(ES1$perf2) # annual employment growth (%)
table(ES1$car1) # company age

table(ES1$wk1) # percent of firms offering formal training
ES1$wk1a <- NA
ES1$wk1a[ES1$wk1 == 100 ] <- "T"
ES1$wk1a[ES1$wk1 == 0 ] <- "NT"
table(ES1$wk1a)

table(ES1$wk8) # years of the top manager's experience working in the firm's sector

ES1 %>% 
  select(idstd, t51, t61, wk1a, wk8, car1, perf1, perf2) %>% 
  na.omit() ->ES2

ES2$WS_EM <- paste(ES2$t51, ES2$t61, sep = "")
table(ES2$WS_EM)

ES2$WS_EM[ES2$WS_EM == "NWSEM"] <- "1"
ES2$WS_EM[ES2$WS_EM == "NWSNEM"] <- "3"
ES2$WS_EM[ES2$WS_EM == "WSNEM"] <- "2"
ES2$WS_EM[ES2$WS_EM == "WSEM"] <- "4"

ES2$WS_EM[ES2$WS_EM == 1] <- "mail"
ES2$WS_EM[ES2$WS_EM == 3] <- "nothing"
ES2$WS_EM[ES2$WS_EM == 2] <- "website"
ES2$WS_EM[ES2$WS_EM == 4] <- "both"

ggplot(ES2, aes(x = ES2$wk1a, y = ES2$perf1, fill = ES2$wk1a)) +
  geom_boxplot()

ggplot(ES2, aes(x = ES2$WS_EM, y = ES2$perf1, fill = ES2$WS_EM)) +
  geom_boxplot()

ggplot(ES2, aes(x = ES2$WS_EM, y = ES2$perf1, fill = ES2$WS_EM)) +
  geom_violin()

ggplot(ES2, aes(x = ES2$WS_EM, y = ES2$perf2, fill = ES2$WS_EM)) +
  geom_boxplot()

ggplot(ES2, aes(x = ES2$WS_EM, y = ES2$car1, fill = ES2$WS_EM)) +
  geom_boxplot()

ggplot(ES2, aes(x = ES2$WS_EM, y = ES2$car1, fill = ES2$WS_EM)) +
  geom_violin()

# if (ES2$t51 == 1 | ES2$t61 == 1) {
#   ES2$SITE_MAIL <- 1 # having website and having email
# } else if (ES2$t51 == 1 | ES2$t61 == 0) {
#   ES2$SITE_MAIL <- 2 # having website and no email
# } else if (ES2$t51 == 0 | ES2$t61 == 1) {
#   ES2$SITE_MAIL <- 3 # no website and having email
# } else { # (ES2$t51 == 0 | ES2$t61 == 0)
#   ES2$SITE_MAIL <- 4 # no website and no email
# } 

##################################################

TFP1 <- read.dta("C:/Users/CJY/Desktop/eLand/Firm Level TFP Estimates and Factor Ratios_May_1_2017.dta")
str(TFP1)

table(TFP1$country_official) # table(TFP1$d2_gdp09)
table(TFP1$year)
table(TFP1$sector_MS) # Sector: Manufacturing or Services

table(TFP1$d2_orig) # table(TFP1$d2_gdp09)
TFP1$d2_orig[TFP1$d2_orig <= 0] <- NA
TFP1$d2_orig1 <- log(TFP1$d2_orig)

table(TFP1$d2_gdp09) # table(TFP1$d2_gdp09)

########################################

TFPES1 <- merge(x = TFP1, y = ES2, by = "idstd")
str(TFPES1)

table(TFPES1$WS_EM)

ggplot(TFPES1, aes(x = TFPES1$wk1a, y = TFPES1$d2_orig1, fill = TFPES1$wk1a)) +
  geom_boxplot()

ggplot(data = TFPES1, aes(x = TFPES1$WS_EM, fill = TFPES1$WS_EM)) +
  geom_bar() +
  guides(fill = FALSE) +
  xlab("Website and Email") + ylab("Count") +
  theme(axis.title.x = element_text(size = 16)) +
  theme(axis.title.y = element_text(size = 16))

ggplot(TFPES1, aes(x = "", fill = factor(TFPES1$WS_EM))) + 
  geom_bar(width = 1) +
  theme(axis.line = element_blank(), plot.title = element_text(hjust = 0.5)) + 
  labs(fill= "Website and Email", 
       x = NULL, y = NULL, title = "Website and Email") +
  coord_polar(theta = "y", start = 0)

ggplot(TFPES1, aes(x = TFPES1$WS_EM, y = TFPES1$d2_orig1, fill = TFPES1$WS_EM)) +
  geom_violin() +
  geom_boxplot(fill = "white") +
  xlab("Website and Email") + ylab("Performance") +
  labs(fill = "Website and Email") +
  theme(axis.title.x = element_text(size = 16)) +
  theme(axis.title.y = element_text(size = 16))

ggplot(TFPES1, aes(x = TFPES1$WS_EM, y = TFPES1$d2_orig, fill = TFPES1$WS_EM)) +
  geom_boxplot() +
  xlab("Website and Email") + ylab("Performance") +
  labs(fill = "Website and Email") +
  theme(axis.title.x = element_text(size = 16)) +
  theme(axis.title.y = element_text(size = 16))

ggplot(TFPES1, aes(x = TFPES1$WS_EM, y = TFPES1$d2_orig1, fill = TFPES1$WS_EM)) +
  geom_boxplot() +
  xlab("Website and Email") + ylab("Performance") +
  labs(fill = "Website and Email") +
  theme(axis.title.x = element_text(size = 16)) +
  theme(axis.title.y = element_text(size = 16))

map1 <- as.data.frame(table(TFPES1$country_official))  
colnames(map1) <- c("Country","Freq")
esmap <- get_map(location = map1$Country)

chennai <-  geocode(TFPES1$country_official)  # get longitude and latitude
esmap <- qmap(TFPES1$country_official, zoom=12, source = "google", maptype="satellite")  

##################################################

file <- url("https://mega.nz/#!F5cA2BbB!h7WZpRrjLNkY0xpVFzOS6cPUB1Eh6mWZl8BdfvXMRLY")
ES1 <- read.dta13(file)

##################################################

table(es2$idstd) # firm id
table(es2$year) # year
table(es2$country2) # country

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

ggplot(es2, aes(x = es2$obst1)) + 
  geom_bar()

ggplot(es2, aes(x = factor(es2$obst1), y = es2$perf1)) +  
  geom_boxplot()

ggplot(es$soe, aes(x = factor(es$soe), y = es$per)) +  
  geom_boxplot() +
  scale_fill_manual(values = c("yellow", "orange")) + 
  ggtitle("SOE and Performance") + 
  theme(axis.text.x = element_text(angle=90, face="bold", colour="black"))

mosaicplot( ~ obst1 + car1, data = es2, main = "Survival on The Titanic", color= T)

##################################################

