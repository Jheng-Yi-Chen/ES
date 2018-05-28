
# R Language Workshop, May 17, 2017
# https://ling32342.github.io/2017_NCCU_R/RDataVisualization.html#1

library(ggplot2)
# list all geom
ls(pattern = '^geom_', env = as.environment('package:ggplot2'))

# 先定義一個資料表
data <- data.frame(身份 = c("大學部", "研究所", "教授", "講師", "助教"), 人數 = c(20, 15, 5, 2, 3))
# plot
ggplot(data = data, aes(x = 身份, y = 人數)) + 
  geom_bar(stat = "identity") +
  theme_grey(base_family = "STHeiti") 

# install.packages(c("ggplot2", "dplyr", "reshape2"), repos = "http://cran.csie.ntu.edu.tw/")

library(ggplot2)
library(dplyr)
library(reshape2)

############### 絕對路徑 ###############
# 請輸入完整的檔案路徑
data <- read.csv("/Users/hsiaoling/Desktop/data/transaction.csv") #如果你是mac
data <- read.csv("C:\\Users\\transaction.csv") #如果你是windows
data <- read.csv("C:/Users/CJY/Desktop/transaction.csv", fileEncoding = "utf-8")
data <- data[,-1]
data$trac_month <- factor(data$trac_month)

############### 相對路徑 ###############
# 瞭解現在我們所處在的路徑
getwd()
# 設定我們檔案存放的路徑
setwd() 
# 讀檔起手式
data <- read.csv("transaction.csv") 
# 若讀入的是亂碼，試試以下
data <- read.csv("transaction.csv", fileEncoding = "big5")  #如果你是mac
data <- read.csv("transaction.csv", fileEncoding = "utf-8") #如果你是windows

str(data)
summary(data)

# Bar chart
# geom_bar
# 先來看看2013年在各縣市的案件交易量
thm <- function() theme(text = element_text(size = 15, family = "STHeiti")) # 控制字體與大小
# STHeiti是只有Mac才有的字體, 用來解決Mac系統中文顯示錯誤的問題
# Windows系統使用者請忽略 `+ thm()` 指令
data %>% 
  ggplot(aes(x = city)) + geom_bar(stat = "count") + thm()  # stat = "count" 算個數

# Change labels!
data %>% 
  ggplot(aes(x = city)) + geom_bar(stat = "count") + thm() +
  labs(title = "各縣市交易量", x = "縣市", y = "交易量") # lab用來幫圖形的標題、x軸與y軸做命名

# 顏色調整：color vs fill?
data %>% 
  ggplot(aes(x = city)) + geom_bar(stat = "count") + thm() +
  labs(title = "各縣市交易量", x = "縣市", y = "交易量") +
  geom_bar(fill = "red", color = "green")
colors() # see colors() if you're picky

# 看臺北市各行政區的案件交易量
# 資料整理
data %>% 
  filter(city == "臺北市") %>% 
  group_by(district) %>% 
  summarise(amount = n()) -> table # dplyr::n 用來計數

table %>% 
  ggplot(aes(x = district, y = amount)) +
  geom_bar(stat = "identity") + thm() + # stat='identity'以表格的值做為bar的高度
  theme(axis.text.x = element_text(angle = 80, hjust = 1)) # 控制字的方向

# Reoder x
table %>% 
  ggplot(aes(x = reorder(district, -amount), y = amount)) +
  geom_bar(stat = "identity") + thm() +
  labs(titles = "臺北市各行政區交易量", x = "行政區", y = "案件數")

# 計算臺北市&高雄市的各使用分區或編定(use_type)所佔比例
data %>%
  filter(city %in% c("臺北市", "高雄市")) %>%
  group_by(city, use_type) %>% 
  summarise(amount = n()) %>% 
  mutate(rate = round(amount/sum(amount), 2) ) -> table

data %>% 
  filter(city == "臺北市" | city == "高雄市" ) %>% 
  group_by(city, use_type) %>% 
  summarise(amount = n()) %>% 
  mutate(cityamount = )
  mutate(rate = round(amount/sum(amount),2) ) -> table

# Grouping：stack
table %>% 
  ggplot(aes(x = city, y = rate, fill = use_type)) +
  geom_bar(stat = "identity", position = "stack") + thm() # stack類別堆疊

# Grouping：dodge
table %>% 
  ggplot(aes(x = city, y = rate, fill = use_type)) +
  geom_bar(stat = "identity", position = "dodge")  + # dodge類別並排
  thm() + scale_fill_discrete(name  ="使用分區或編定")  # 設定圖例的顯示

test <- data.frame(district = c("大安","北投"), area = c(10,15))

# stat = "count"
test %>% 
  ggplot(aes(x = district)) +
  geom_bar(stat = "count") + thm()

# stat = "identity"
test %>% 
  ggplot(aes(x = district, y = area)) +
  geom_bar(stat = "identity") + thm()

# Line chart
# geom_line
# 各月份交易量
data %>% 
  group_by(trac_month) %>% 
  summarise(amount = n()) -> table
table

table %>% 
  ggplot(aes(x = trac_month, y = amount, group = 1)) +
  geom_line() + thm() + labs(x = "交易月份" , y = "交易數量")

# 各縣市各月份交易量比較
data %>% 
  group_by(city,trac_month) %>% 
  summarise(amount = n()) -> table
table

table %>% 
  ggplot(aes(x = trac_month, y = amount, group = city, color = city)) +
  geom_line() + geom_point() + thm() + 
  labs(x = "交易月份" , y = "交易數量")

# Histogram
# geom_histogram
data %>% 
  ggplot(aes(x = age, y = ..count..)) + 
  geom_histogram()

# aes(y=..count..) vs. aes(y=..density..)
data %>% 
  ggplot(aes(x = age, y = ..density..)) + 
  geom_histogram()

data %>% 
  ggplot(aes(x = age, y = ..density.., fill = ..count..)) + # fill 依指定欄位填色
  geom_histogram() 

data %>% 
  ggplot(aes(x = age, y = ..density.., fill = ..count..)) + # fill 依指定欄位填色
  geom_histogram(binwidth = .5) 

# Histogram + density
# geom_histogram() + geom_density()
data %>% 
  ggplot(aes(x = age, y = ..density..)) + 
  geom_histogram(color = "black", fill = "white") +
  geom_density(alpha = .2, fill = "#FF6666") # alpha設定透明度

# Boxplot
# geom_boxplot
data %>% 
  ggplot(aes(x = city, y = price_unit)) + 
  geom_boxplot() + thm() + 
  labs(x = "縣市" , y = "每平方公尺價格(元)")

# Change limits of axes!
data %>% 
  ggplot(aes(x = city, y = price_unit)) + 
  geom_boxplot() + thm() + 
  labs(x = "縣市" , y = "每平方公尺價格(元)") + 
  coord_cartesian(ylim = c(0, 2000000)) # 設定y軸上下界線

data %>% 
  ggplot(aes(x = city, y = log(price_unit))) + 
  geom_boxplot() + thm() + # geom_boxplot(outlier.shape = NA) outlier不顯示
  labs(x = "縣市" , y = "log(每平方公尺價格(元))")

data %>% 
  ggplot(aes(x = city, y = log(price_unit))) + 
  geom_boxplot(outlier.shape = NA) + thm() + # geom_boxplot(outlier.shape = NA) outlier不顯示
  labs(x = "縣市" , y = "log(每平方公尺價格(元))")

# Scatter plot
# geom_point
iris %>% 
  ggplot(aes(x = Sepal.Length, y = Petal.Length, color = Species)) + 
  geom_point()

iris %>% 
  ggplot(aes(x = Sepal.Length, y = Petal.Length, color = Species)) + 
  geom_point(shape = 1, size = 2) # shape控制圖示；size控制點的大小

# 參數放在aes()函數裡面，表示資料依據指定欄位內容做不同的shape/size變化
iris %>% 
  ggplot(aes(x = Sepal.Length,
             y = Petal.Length, 
             color = Species,
             shape = Species,
             size = Species)) +
  geom_point() +
  scale_shape_manual(values = c(1, 5, 7)) +  # 控制 shape 顯示圖示
  scale_size_manual(values = c(1, 2, 3))   # 控制圖示 size 顯示大小

# Fit regression line
iris %>% 
  ggplot(aes(x = Sepal.Length, y = Petal.Length)) + 
  geom_point() +
  stat_smooth(method = lm, level = .95) # add se = FALSE to disable CI

M1 <- lm(Petal.Length ~ Sepal.Length, data = iris)
summary(M1)

iris %>% 
  ggplot(aes(x = Sepal.Length, y = Petal.Length)) + 
  geom_point() +
  stat_smooth(level = .95) # add 信賴區間(se) = FALSE to disable CI

iris %>% 
  ggplot(aes(x = Sepal.Length, y = Petal.Length)) + 
  geom_point() +
  stat_smooth(method = lm, level = .95, se = FALSE) # add se = FALSE to disable CI

# facet
# 比較各縣市在各月份下的交易量
data %>% 
  group_by(city,trac_month) %>% # 選擇縣市、交易月份作為分群
  summarise(total = n()) -> table # 計算分群下的總數
table %>% 
  ggplot(aes(x = trac_month, y = total ,fill = city))+
  geom_bar(stat = "identity") + thm()

table %>% 
  ggplot(aes(x = trac_month, y = total, fill = city))+
  geom_bar(stat = "identity") + thm() +
  facet_wrap( ~ city , nrow = 2) +
  labs(x = "交易月份", y = "交易量")

# coord_flip()
table %>% 
  ggplot(aes(x = trac_month, y = total ,fill = city))+
  geom_bar(stat = "identity") + thm() +
  facet_wrap( ~ city , nrow = 2) +
  labs(x = "交易月份", y = "交易量") +
  coord_flip() 

ggsave("檔案名稱")
ggsave("plot.pdf", width = 4, height = 4)
ggsave("plot.png", width = 4, height = 4, dpi = 300)

# 互動式視覺化呈現
install.packages("plotly")
library(plotly)

# plot with ggplot2
iris %>% 
  ggplot(aes(Petal.Width, Sepal.Length, colour = Species)) +
  geom_point() -> a
a

# plot with ggplotly
ggplotly(a)

