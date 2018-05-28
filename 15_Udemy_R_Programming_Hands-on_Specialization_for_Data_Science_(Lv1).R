# Udemy R Programming Hands-on Specialization for Data Science (Lv1)

version

getwd() # How do you check the working directory in R?
getwd
# setwd(C:/Users/CJY/Desktop)

ls()

j = 3
j

m = 2
j + m *2
k = j + m *2
k

source("D:/online courses/Udemy R Programming Hands-on Specialization for Data Science (Lv1)/my_first_script.txt")

# five data type in R
# character
# numeric
# integer
# complex
# logical aka Boolean

is.numeric(87)
class(87)
class(8L)
is.numeric(8L)
is.integer(87)
class(8+3i)

"8" + "9"

"James"
"Bond"
paste("James", "Bond")
paste0("James", "Bond")

substr("2017, Japan", start = 1, stop = 4)
substr("2017, Japan", start = 7, stop = 11)
?substr

# sub(what needs to be replaced, the value to replace, the string where you want the substitution to happen)
sub("Australia", "Romania", "I live in Australia")
sub("-", ",", "-#")

sprintf("I live in %s", "Australia")

name = "james"
sprintf("Hi, welcome %s to our website", name)

p = 2
p == 2
p == 4

K <- as.integer("8")
K
class(K)
K + 2

# [1] NA, Warning message: NAs introduced by coercion 
as.integer("A")

as.integer(TRUE)
class(TRUE)
as.integer(FALSE)
class(FALSE)

as.character(10)
class(as.character(10))
as.character(TRUE)
as.character(FALSE)
as.character(1 + 9i)
as.integer(1 + 9i)

as.logical(100)
as.logical(0)
as.logical("ABC")

my_vector <- c(1, 10, 20, 30, 40)
typeof(my_vector)
class(my_vector)
class(my_vector[2])

char_vector <- c("name", "data science", "lab")
typeof(char_vector)
class(char_vector)

log_vector <- c(TRUE, TRUE, FALSE)
typeof(log_vector)
class(log_vector)

funny_vector <- c(10, "data science", "lab", 100)
funny_vector
funny_vector[1]
class(funny_vector[1])

new_vector <- c(TRUE, FALSE, "data", 100, -100)
new_vector
class(new_vector)

newnew_vector <- c(TRUE, TRUE, 100)
newnew_vector
class(newnew_vector)

vector("integer", length = 10)
vector("character", length = 15)
integer(10)
character(15)
logical(20)
my_logical_variable <- logical(50)
my_logical_variable

seq(5, 15)
seq(0, 50, 3)
J <- seq(50, 10, -3)
J

length(my_vector)
print(my_vector)

my_vector[2:3]
my_vector[-1]

vector2 <- my_vector[-2]
vector2

my_vector[c(1, 3, 5)]
my_vector[c(1, 3, 6)]

my_vector[length(my_vector)]
my_vector[1:length(my_vector)]

v1 <- c(100, c(10, 50, 500), 3, c(200, 40))
v1
length(v1)
v1[4]

weights <- c(A = 85, B = 75, C = 90, D = 86, E = 87, F = 100)
weights[1]
weights["A"]

attr(weights, "info") <- "values represent weight in kg"
weights

v1 <- seq(10, 90, 10)
dim(v1)
dim(v1) <- c(3, 3)
dim(v1)
is.matrix(v1)

v2 <- seq(1, 6)
dim(v2) <- c(2, 3) ; v2
dim(v2) <- c(3, 2) ; v2

m4 <- matrix(1:8, nrow = 4, ncol = 4)
m4
m5 <- matrix(1:8, nrow = 2, ncol = 4)
m5

row1 <- c(10, 20, 30, 40)
row2 <- c(50, 60, 70, 80)

m1 <- rbind(row1, row2)
m1
dimnames(m1)

n1 <- matrix(1:10, nrow = 5, ncol = 2)
dimnames(n1)
dimnames(n1) <- list(c("p1", "p2", "p3", "p4", "p5"), c("w", "h"))
n1 ; dimnames(n1)

m2 <- matrix(1:6, nrow = 2, ncol = 3)
m2
dimnames(m2) <- list(c("1row", "2row"), c("1col", "2col", "3col"))
m2

m2[2, 3]
m2[1, 2]
m2[1, ]
m2[, 2]
m2[1, 1:3]
m2[1, 1] ; m2["1row", "1col"]

x5 <- matrix(1:25, nrow = 5, ncol = 5)
x5[c(1, 3, 5), c(2, 5)]

x5 * 2
x5 + 2
sqrt(x5)

x3 <- x5 * 5
x3 + x5
x3 %*% x5 # R???x?}???k?A???O x3 * x5

first_list <- list(1, 5, 100, -100)
first_list
is.list(first_list)

second_list <- list("ABC", 2000, TRUE, 9+3i)
second_list
class(second_list[[1]])
class(second_list[[2]])

third_list <- list(c(1, 100), c("ABC", "DEF"))
third_list
length(third_list)
third_list[1]
length(third_list[1])
class(third_list[1])
third_list[[1]]
class(third_list[[1]])
length(third_list[[1]])
third_list[[2]][1]

vec2 <- seq(1:10)
list2 <- as.list(vec2)
list2
is.list(list2)

un_vec <- unlist(second_list)
un

company <- list(title = c("A", "B", "C", "D"), locaton = c("E", "F", "G", "H"))
length(company)
company
company[1]
company["title"]; company$title
company[[1]][2]; company$title[2]
company[["title"]][2]

company$t
company$ti

var2 <- "title"
company[var2]
company[[var2]]

df1 <- data.frame()
df1

df2 <- data.frame(1:10, rep("Data Science"))
df2

df3 <- data.frame(name = c("A", "B", "C"), title = c("D", "E", "F"))
df3

nrow(df3)
ncol(df3)

str(df3)

head(airquality)
tail(airquality)
names(airquality)

m2
df4 <- as.data.frame(m2)
df4
names(df4) <- c("L", "A", "Y")
df4

summary(airquality)

df9 <- data.frame(df3)
df9

m3 <- matrix(1:10, 2, 5)
m3
df10 <- data.frame(m3)
df10

vec1 <- seq(1:10)
vec1
df11 <- data.frame(vec1)
df11

names(airquality)
airquality["Ozone"]
airquality[1]
airquality[c(1, 2)]
airquality[c("Ozone", "Solar.R")]
airquality$Ozone

class(airquality["Ozone"])
class(airquality$Ozone)
class(airquality[["Ozone"]])

head(airquality)
airquality[1, 2]
airquality[1:10, 1:3]
airquality[1, ]
airquality[, 1]

is.na(airquality$Ozone)
sum(is.na(airquality$Ozone))

sum(c(TRUE, TRUE))
sum(c(FALSE, FALSE))

which(c(FALSE, FALSE, TRUE, FALSE))

which(is.na(airquality$Ozone)) # where is NA

aq <- airquality
aq$Ozone[c(1, 20, 30)]
aq$Ozone[c(1, 20, 30)] <- 0

aq$Ozone[which(is.na(aq$Ozone))]
aq$Ozone[which(is.na(aq$Ozone))] <- 0
aq$Ozone

complete.cases(airquality)

aq2 <- airquality
aq2 <- aq2[complete.cases(aq2), ]
complete.cases(aq2)
nrow(airquality)
nrow(aq2)

mean(airquality$Ozone)
mean(airquality$Ozone, na.rm = TRUE)

aq2[aq2$Ozone > 30, ]
aq2[which(aq2$Ozone > 30), ]
aq2[which(aq2$Ozone > 30 & aq2$Month == 9), ]
aq2[which(aq2$Month == 8 | aq2$Month == 9), ]

# While Loops in R
i <- 1

while(i < 20){
  print(i*2)
  i = i + 1
}

vec = c("Taipei", "Taichung", "Tainan", "Kaohsiung")

for(city in vec) {
  print(city)
}

for(city in vec) {
  print(paste(toupper(city), "has", nchar(city), "characters"))
}

for(num in seq_along(vec)) {
  print(num)
}

gender <- "female"

if (gender == "male") {
  print("its a male")
} else {
  print("its a female")
}

if (gender == "male") {
  print("its a male")
} else if (gender == "female") {
  print("its a female")
} else {
  print("gender unknown")
}

salary <- 109

var2 <- ifelse(salary > 100, "high", "low")

setInternet2(use = TRUE)

my_url <- "https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population"
web_connection <- url(my_url)
html_code <- readLines(web_connection)
head(html_code)
class(html_code)

target_url <- "http://irfanelahi.com/churn_data_set.txt"
url_con <- url(target_url)
churn_data <- readLines(url_con)
is.vector(churn_data)
length(churn_data)

split_list <- strsplit(churn_data, ",")
split_list

churn_data[1:5]
split_list[1:5]

length(split_list[[1]])
tmat <- matrix(ncol = 21)

for (n in seq_along(1:length(split_list))) {
  tmat <- rbind(tmat, split_list[[n]])
}

tmat <- tmat[2:nrow(tmat), ]

my_df <- data.frame(tmat, stringsAsFactors = FALSE)
head(my_df)
str(my_df)
table(my_df[1])
sort(table(my_df[1]))

# to remove whitespaces in your dataframe
trim_please <- function(given_col) {
  pos = 1
  for (each_record in given_col) {
    return(given_col[pos] <- trimws(each_record, "1"))
    pos = pos + 1
  }
}

my_df[21] <- trim_please(my_df[21])
str(my_df)

library(XML)
my_url <- "https://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=laptop"
html_page <- htmlTreeParse(my_url, useInternalNodes = TRUE)
xpathSApply(html_page, "//title", xmlValue)
xpathSApply(html_page, "//title", xmlName)
xpathSApply(html_page, "//title", xmlAttrs)

library(RSelenium)

# launch a selenium server, Java
RSelenium::checkForServer()
RSelenium::startServer()
remdr <- remoteDriver()
remdr$open()
remder$navigate("https://www.amazon.com")

sbox <- remdr$findElement(using = "xpath", "//div//input[@id='twoabsearchtextbox']")
sbox$sendKeysToElement(list("laptops", key = "enter"))




