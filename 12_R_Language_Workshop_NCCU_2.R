
# R Language Workshop, May 10, 2017
# https://lucy0222.github.io/2017_NCCU_R/RProgramming.html#1

# 可以使用R指令來下載
url <- "https://lucy0222.github.io/2017_NCCU_R/hsb.csv"
download.file(url, destfile = "hsb.csv") # 把檔案另存成hbs.csv
dat <- read.csv("hsb.csv")
head(dat)

# 讀取自己電腦裡的csv檔
# 方法1. 透過介面選擇檔案所在路徑
path <- file.choose()
dat <- read.csv(path)

# 方法2. 自行輸入檔案所在路徑
path <- "/Volumes/LEEF SURGE/LearnR/hsb.csv"
dat <- read.csv(path)

# 方法3. 自行輸入檔案相對路徑
dat <- read.csv("hsb.csv")

# 利用write.csv將data.frame格式的R物件另存成csv檔
write.csv(dat, "hsb_new.csv", row.names = FALSE, quote = FALSE)

# getwd 查詢目前所在的資料夾路徑 (絕對路徑)
# setwd 設定所在的資料夾路徑 

getwd()
dat <- read.csv("hsb.csv")

# 讀取其他軟體資料集
# install.packages("foreign") # 安裝R套件 foreign
library(foreign) # 載入套件 
cars <- read.spss("data/Cars.sav", to.data.frame = TRUE)
milk <- read.dta("data/p004.dta")
# head(cars)
# head(milk)

# install.packages("sas7bdat")
library(sas7bdat)
airline <- read.sas7bdat("data/airline.sas7bdat")
head(airline)

# readLines, writeLines，是讀取網頁原始碼的好工具
output <- file("output.txt")
writeLines(as.character(1:12), con = output)
input <- readLines(output)
input

# 找出藝人官方身高
web_page <- readLines("http://www.buzzhand.com/post_365903.html")
matches <- gregexpr("[\u4E00-\u9FA5]+官方身高：[0-9]+cm", web_page)
tmp <- regmatches(web_page, matches)
unlist(tmp)

# 找出清心福全台北市南港店的地址
# gregexpr要怎麼用？輸入：?gregexpr
web_page <- readLines("http://www.319papago.idv.tw/lifeinfo/chingshin/chingshin-02.html", encoding = "utf8")
matches <- gregexpr("台北市南港區[\u4E00-\u9FA5|0-9|(|)]+", web_page)
tmp <- regmatches(web_page, matches)
unlist(tmp) # 把 list 轉成 vector

# 找出清心福全台北市門市的電話號碼
web_page <- readLines("http://www.319papago.idv.tw/lifeinfo/chingshin/chingshin-02.html")
matches <- gregexpr("02-[0-9]+", web_page)
tmp <- regmatches(web_page, matches)
unlist(tmp) 

# 條件判斷語句 - if
# 判斷x是否大於2, 如果是，則印出結果
# cat是什麼？輸入：?cat
x <- 4
if (x > 2) {
  cat(x, "is larger than 2")
}

# 判斷x是否大於2, 如果是，則印出結果
x <- 4
if (x > 2) cat(x, "is larger than 2")

y <- 1
if (y > 2) {
  cat(y, "is larger than 2")
} else {
  cat(y, "is smaller than 2")
} 

y <- 1
ifelse(y > 2, "larger than 2", "smaller than 2")

z <- 1:5
ifelse(z > 2, "larger than 2", "smaller than 2")

# 若需要多個判斷分支時，加入else if, …, else
y <- 1
if(y > 2) {
  cat(y, "is larger than 2")
} else if (y < 2) {
  cat(y, "is smaller than 2")
} else {
  cat(y, "is equal to 2")
}

# 自訂函數 - function
foo <- function(x) { # 這個function有一個變數x
  if(x > 2) {
    cat(x, "is larger than 2")
  } else if (x < 2){
    cat(x, "is smaller than 2")
  } else {
    cat(x, "is equal to 2")
  }  
}
foo(1); foo(2); foo(3)

# 循環語句 - for
# 循環語句，可用來重複執行某段程式碼
x <- 0
for(i in 1:10) {
  if(i %% 2 != 0) { # x是否為奇數，
    x <- x + i # 自身累加
  }
}
x

# 檢查
1+3+5+7+9

#雙重循環語句，可用來重複執行某段程式碼
# \t = tab鍵, \n = 空行
x <- 0
k <- 0
for(i in 1:3) {
  for(j in 1:3) {
    cat(paste(i, "*", j,  "=", i*j, ",\t", sep=""))
    k <- k + 1
    x[k] <- i*j
  }
  cat("\n")
}

# 展示movies資料夾下所有的檔案
# dir是什麼？輸入：?dir
fname <- dir("C:/Users/CJY/Desktop/movies")
fname
# 看一下fname的資料類型，class(fname)
class(fname)

# 練習讀一個csv檔 (movies-1995.csv)
path <- paste("C:/Users/CJY/Desktop/movies/", fname[1], sep="")
mov95 <- read.csv(path)
head(mov95)

# 練習讀多個csv檔
mov <- list() # 預設一個名為 mov 的list容器
for(i in 1:length(fname)) {
  path <- paste("C:/Users/CJY/Desktop/movies/", fname[i], sep="")
  mov[[i]] <- read.csv(path)
}
head(mov[[1]])

# 將list用列合併(rbind)整合成data.frame
# do.call是什麼？輸入：?do.call
# df的資料類型？
df <- do.call(rbind, mov) 
head(df)

# 只讀取1995-1999電影資料
matches <- gregexpr("movies-199[5-9]+.csv", fname)
tmp <- regmatches(fname, matches)
fname90 <- unlist(tmp)
mov90 <- list() # 預設一個名為 mov 的list容器
for(i in 1:length(fname90)) {
  path <- paste("C:/Users/CJY/Desktop/movies/", fname90[i], sep="")
  mov90[[i]] <- read.csv(path)
}
df90 <- do.call(rbind, mov90)
# tail(df90) # 最後6筆

# 練習寫一個批次讀檔函數
myRead <- function(fname, path0 = "C:/Users/CJY/Desktop/movies/") {
  mov <- list()
  for(i in 1:length(fname)) {
    path <- paste(path0, fname[i], sep="")
    mov[[i]] <- read.csv(path)
  }
  do.call(rbind, mov)
}
df <- myRead(fname90, path0 = "C:/Users/CJY/Desktop/movies/")
head(df)

# Pipe Line Coding Style
# https://blog.gtwang.org/r/r-pipes-magrittr-package/

# %>% <- ctrl + shift + m

library(magrittr)
x <- 1:10
mean(x)
x %>% mean

# 利用三角形面積公式說明%>%算子的幾種等價用法
tri_area <- function(a, h = 5) a*h/2 # 大括號省略
a <- 10
tri_area(a)

a %>% tri_area          # 省略括號
a %>% tri_area(h = 5)     # 保留括號
a %>% tri_area(., h = 5)  # 以 "." 來表示欲傳入的變數

# 指令壓縮
plot(density(sample(mtcars$mpg, size = 10000, replace = TRUE), kernel = "gaussian"), col = "red", main = "density of mpg")

# Pipe Line
mtcars$mpg %>% 
  sample(size = 10000, replace = TRUE) %>% 
  density(kernel = "gaussian") %>% 
  plot(col = "red", main = "density of mpg")

# 資料處理
# 資料拉皮 reshape2
# melt: wide format -> long format
# dcast: long format -> wide format

library(reshape2)
WP.melt <- data.frame(WorldPhones)
WP.melt$year <- rownames(WP.melt)  
WP.melt <- melt(WP.melt, id = "year")
head(WP.melt)

WP.cast <- dcast(WP.melt, year ~ variable, value.var = "value") 
head(WP.cast)

# 學習dplyr的官方方式：vignette
# help -> cheatsheets
library(dplyr)
vignette(all = TRUE, package = "dplyr")
vignette("introduction", package = "dplyr")

# arrange 排列
# filter 對列做篩選 (row)
# select 對欄做篩選 (column)
# mutate 更改欄或新增欄
# group_by + summarise 分類

arrange(iris, Petal.Length) %>% head
arrange(iris, Sepal.Length) %>% tail
# 排序預設是由小到大，加上desc可使用遞增排列
arrange(iris, desc(Petal.Length)) %>% head
arrange(iris, -Petal.Length) %>% head
iris %>%
  arrange(desc(Petal.Length)) %>% 
  head
# 排序的項目可以不只一項，只要依序將項目填入後方即可
arrange(iris, desc(Petal.Length), - Sepal.Length ) %>% head

# 移除重複資料
distinct(iris)
# 隨機抽取資料
sample_n(iris, 5)
# 抽取指定列
slice(iris, c(1, 3, 4, 5))

# 對列做篩選 filter
filter(iris, Sepal.Length == 7.7)
filter(iris, Sepal.Length == 7.7, Sepal.Width == 2.8)
filter(iris, Species == "virginica")
filter(iris, Sepal.Length != 7.7)

# 中正區
url <- "https://lucy0222.github.io/2017_NCCU_R/%E8%B2%B7%E8%B3%A3st_A_10109_10109.csv"
dat <- read.csv(url, fileEncoding = "big5")
filter(dat, 鄉鎮市區 == "中正區") %>% View
CK <- filter(dat, 鄉鎮市區 == "中正區") %>% View
table(dat$主要用途)
table(dat$有無管理組織)

# 對行做選取 select
tmp <- select(iris, c(Petal.Width, Species))
head(tmp)
# 用負號-執行反向選取
tmp <- select(iris, c(-Petal.Width, -Species))
head(tmp)

# 新增欄位 mutate
# 如果想要做不同欄位間計算後得到新的欄位該如何處理
# 譬如 Petal.Length * Petal.Width
tmpiris <- mutate(iris, Petal.Vol = Petal.Length * Petal.Width)
head(tmpiris)
new1 <- iris
new1 <- mutate(new1, ne = 5)
head(new1)

# 樞紐分析 group_by + summarise
# 如果想要 Sepal.Length 的 mean、Sepal.Width 的標準差、Petal.Length 的最大值
# 利用summarise
summarise(iris, SL.mean = mean(Sepal.Length), SW.sd = sd(Sepal.Width), PL.max = max(Petal.Length))

# 如果想要 Sepal.Length 的 mean、Sepal.Width 的標準差、Petal.Length 的最大值
# 依照物種類別各自計算
# 利用group_by + summarise
group_by(iris, Species) %>%
  summarise(SL.mean = mean(Sepal.Length), SW.sd = sd(Sepal.Width), PL.max = max(Petal.Length))
WW <- group_by(iris, Species) %>% 
  summarise(SL.mean = mean(Sepal.Length), SW.mean = mean(Sepal.Width), PL.mean = mean(Petal.Length), PW.mean = mean(Petal.Width))
WW

group_by(dat, 鄉鎮市區) %>% 
  summarise(平均 = mean(單價.元.平方公尺., na.rm = T))


