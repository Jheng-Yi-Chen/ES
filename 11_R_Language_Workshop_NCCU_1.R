
# May 3, 2017, R languague workshop
# https://ling32342.github.io/2017_NCCU_R/RBasic.html#1

?sum #

# help(sum) # ctrl + shift + c 整段註解
# ??su

dat1 <- data.frame(date = c("11/29", "11/30", "12/01", "12/02", "12/03", "12/04", "12/05"),
                   weekday = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"))
dat1 # print R object

dat1[1, 1] # 取值
dat1[, 1]   
dat1[1:2, ]

dat2 <- data.frame(date = c("11/29", "11/30", "12/01", "12/02", "12/03", "12/04", "12/05"),
                   temp = c(17, 18, 24, 20, 21, 22, 24))
dat2 # print R object

dat2[, 2]
dat2[, 2] * 2   
dat2[, 2] + c(1, 0, -0.5, 2, 3, -2, 0.5) 

dat2[dat2$temp < 20, ]

dat2[grepl("11", dat2$date), ]

cbind(dat1, temp = dat2$temp)[dat2$temp < 20, ]

1;2

# 基礎運算
1 + 2 + 3

x <- 10
y <- 4
(x + y) / 2 # 簡單的公式運算

# basic expression of integer vector
c(1, 2, 3, 4)

# simple expression
1:4
4:1

?seq
seq(1, 4)
seq(1, 9, by = 2) # 間隔為2
seq(2, 5, by = 2)
seq(1, 9, length.out = 5) # 分割長度為5
seq(1, 4, length.out = 5)

seq(1, 10)
1:10
seq(2, 10, by = 2)
seq(1, 10, length.out = 5)

c(1, 2, 3) * c(2, 2, 2)
c(1, 2, 3) * c(2)
c(1, 2, 3) * c(1, 2)

# shorter arguments are recycled
1:3 * 2

height <- c(174, 158, 160, 168, 173)
weight <- c(52, 39, 42, 46, 48)

BMI <- weight/(height/100)^2
BMI

x <- c(174, 158, 160, 168, 173)
x[1]           # 選取第1個位置的元素
x[c(1, 3)]     # 選取第1, 3個位置的元素
x[c(2, 3, 1)]  # 依序取值
x[c(2:5)] ; x[-1]

# 在[ ]中使用負號 (-) 做反向選取
x[-1]
x[-c(1, 3, 4)]
x[-c(1:3)] ; x[c(4:5)]

x > 160

# 使用比較運算子 加上 `which` 函數進行取值
index <- which(x > 160) 
index 

x[index]

# 指令壓縮，將指令寫在 [ ] 中，以達到縮短程式碼的功效
x[which(x > 160)] ; x[x > 160]

# 配合邏輯算子進行多條件的取值
x[which(x > 160 & x < 175)]

# 可以省略 which
x[x > 160 & x < 175]
x[x > 160 | x < 175]

x <- c(174, 158, 160, 168, 173)
x

# 取代特定位置的元素
x[2] <- 158.5 # 取代x物件的第二個元素
x

x[c(1, 5)] <- 175 
x

# 也可以用條件篩選做取代
x[x > 160] <- 170 # 取代大於160的值為170
x

x <- c(174, 158, 160, 168, 173)
x

# 在 [ ] 中新增元素
x[6] <- 168
x

x[8] <- 147
x # 未指定的元素值預設為NA

length(x) # 查看向量物件的長度

x[length(x) + 1] <- 166 # 接續增加新元素
x

help.start()
ab # 輸入`ab`後 按下tab
?abs   # 等同於 help(abs)
??abs 
vignette()
vignette("Introduction", "Matrix")

X <- 1
X < 2
X <= 1

x <- "bubble"
y <- "bobble"

paste(x, y, sep = ",") # 字串的剪接：paste
paste(x, y, sep = ":")
paste(x, y, sep = "")

strsplit(x, "u") # 字串的切割：strsplit

name1 <- "郭雪芙"
?substring
substring(name1, 1, 1) # 截取子字串：substring
substring(name1, 1, 2)
substring(name1, 3, 4)

nchar(name1) # 計算字串長度：nchar # 試著與 length 函數比較

name2 <- "金城武"
substring(name2, 1, 1)
substring(name2, 1, 2)

a <- "2015-12-14"
substring(a, 6, 7) # 取出字串 a <- "2015-12-14" 的月份

tmp <- strsplit(a, "-")
tmp[[1]]
tmp[[1]][2]

x <- c("F","M","F","F")
x

x <- factor(c("F", "M", "F", "F"))
x <- factor(c("F", "M", "F", "F"), levels = c("F", "M"))
x

x <- factor(c("F", "M", "F", "F"), levels = c("F"))
levels(x)

as.integer(x)

#農業社會 男尊女卑
Argri <- factor(c("F", "M", "F", "F"), order = TRUE, levels = c("F", "M"))
Argri

#阿美族 女尊男卑
Amis <- factor(c("F", "M", "F", "F"), order = FALSE, levels = c("F", "M"))
Amis

#應該要用
Amis <- factor(c("F", "M", "F", "F"), order = TRUE, levels = c("M", "F"))
Amis

#舉一個認真的例子 - 班上一號到六號分別拿到A, B, C的級別
rank = factor(c("C", "A", "B", "B", "C", "C"), order = TRUE, level = c("C", "B", "A"))
rank

rank[1] < rank[2]

x <- c(1, 2.0, "3") # Character > Numeric > Integer > Logical
x

as.numeric("2") # 轉換向量型態： as.character, as.numeric, as.logical

x <- c(1, 2.0, "3")
x <- c(1, 2.0, 3)
as.numeric(x)
hist(as.numeric(x))

x <- "23"
x <- as.numeric("23")
x <- as.numeric(y <- "23")
x

y <- c("1", "2", "3", "2", "a")
as.numeric(y)

# 字串轉數字
a1 <- c("89", "91", "102")
as.numeric(a1)

# 布林轉數字
a2 <- c(TRUE, TRUE, FALSE)
as.numeric(a2)

# 數字轉布林
a3 <- c(-2, -1, 0, 1, 2) # 只有0會被轉成FALSE
as.logical(a3)

# 數字轉字串
as.character(a3)

z <- c(1, 2, 3, 2, 3, 2, 1)
as.character(z) # 字串
factor(z) # 轉類別

x1 <- c("林志玲", 174, 52, TRUE)   # 所有元素都被轉換成字串
x1
  
x2 <- list("林志玲", 174, 52, TRUE) # 保留資料型態
str(x2)

x3 <- list(name = c("林志玲", "隋棠", "蔡依林", "無名氏"), height = c(174, 173, 158), weight = c(52, 48, 39), model = c(TRUE, TRUE, FALSE))
x3

x3[[1]]
x3$name
x3[["name"]]

x3[[3]][1]

names(x3)

names(x3) <- c("Name", "Height", "Weight", "Model")
names(x3) <- c("姓名", "身高", "體重", "模特兒")
names(x3)[4] <- "models"

data("iris")
head(iris) # 列出前幾筆資料, 預設6筆
head(iris, 10)
tail(iris)
View(iris)
str(iris)

dim(iris)  # 列出資料表的 rows and columns

iris[2, 3] # 第2列，第3欄
iris[1:6, 1:3]
iris[1:3, 3:5]

iris[2, ] # 第2列

iris$Petal.Length
iris[, 3] # 第3欄
sum(iris[, 3]) # 第3欄加總
hist(iris[, 3]) # 第3欄長條圖

iris[c(1, 51, 101), ]

iris[, 1] # 欄位名稱未知
iris$Sepal.Length # 已知欄位名稱
iris[["Sepal.Length"]] # 已知欄位名稱 

iris[iris$Sepal.Length > 5.5 & iris$Species == "setosa", ]
A1 <- iris[iris$Sepal.Length > 5.5 & iris$Species == "setosa", ]
A1

iris$A2 <- NA
iris$A2[iris$Sepal.Length > 5.5 & iris$Species == "setosa"] <- 1
iris$A2[iris$Sepal.Length <= 5.5 & iris$Species == "setosa"] <- 2
summary(iris$A2)

colnames(iris)[1] <- c("abc")

iris$Sepal.Length > 5
iris[iris$Sepal.Length > 5, ]

# 關鍵字的取代與查找 - gsub
# gsub(pattern, replacement, x)

year <- c("民國99", "民國100", "民國101")
gsub("民國", "", year)

as.numeric(gsub("民國", "", year)) + 1911

# 關鍵字的取代與查找 - grep
# grep(pattern, x, value=FALSE)
# grepl(pattern, x)
# grep(pattern, x, value=TRUE)

title <- c("馬習會前交涉祕辛曝光", "馬說明馬習會：公布逐字稿不可思議的透明", "談22K政策朱立倫：不幸被企業濫用")
grep("馬習會", title)
grep("朱", title)

grepl("馬習會", title)

grep("馬習會", title, value = TRUE)

# 關鍵字的取代與查找 - gregexpr
txt <- c("名模林志玲身高有174公分，體重52公斤", "女神蔡依林身高158公分，體重只有39公斤")
gregexpr("[0-9]+", txt) # 第9位開始
matches <- gregexpr("[0-9]+", txt)
regmatches(txt, matches)

# 取代：gsub
# 查找位置：grep(value = FALSE), grep(value = TRUE), grepl
# 查找結果：grepexpr
