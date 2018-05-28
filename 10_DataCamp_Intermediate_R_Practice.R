# Intermediate R - Practice, DataCamp

# me, other_199, and previous_4 are available in your workspace

# Merge me and other_199: my_class
my_class <- c(me, other_199)

# cbind() my_class and previous_4: last_5
last_5 <- cbind(my_class, previous_4)

# Name last_5 appropriately
nms <- paste0("year_", 1:5)
colnames(last_5) <- nms

# me, my_class and last_5 are available in your workspace

# Build histogram of my_class
hist(my_class)

# Generate summary of last_5
summary(last_5)

# Build boxplot of last_5
boxplot(last_5)

# me, my_class and last_5 are preloaded

# Is your grade equal to 72?
me == 72

# Which grades in your class are higher than 75?
my_class > 75

# Which grades in the last 5 years are below or equal to 64?
last_5 <= 64

# me, my_class and last_5 are preloaded

# How many grades in your class are higher than 75?
sum(my_class > 75)

# How many students in your class scored strictly higher than you?
sum(my_class > me)

# What's the proportion of grades below or equal to 64 in the last 5 years?
mean(last_5 <= 64)

# me, my_class and last_5 are preloaded

# Is your grade greater than 87 and smaller than or equal to 89?
me >= 87 & me <= 89

# Which grades in your class are below 60 or above 90?
my_class < 60 | my_class > 90

# me, my_class and last_5 are preloaded

# What's the proportion of grades in your class that is average?
mean(my_class >= 70 & my_class <= 85)

# How many students in the last 5 years had a grade of 80 or 90?
sum(last_5 == 80 | last_5 == 90)

if (me > 80) {
  print("Good student!")
} else {
  print("Better luck next year!")
}

# me, my_class and last_5 are preloaded

# Define n_smart
n_smart <- sum(my_class >= 80)

# Code the if-else construct
if (n_smart > 50) {
  print("smart class")
} else {
  print("rather average")
}

if (condition) {
  expr
} else if (condition) {
  expr
} else {
  expr
}

# me, my_class and last_5 are preloaded

# Define prop_less
prop_less <- mean(my_class < me)

# Code the control construct
if (prop_less > 0.9) {
  print("you're among the best 10 percent")
} else if (prop_less > 0.8) {
  print("you're among the best 20 percent")
} else {
  print("need more analysis")
}

# me, my_class and last_5 are preloaded

# Embedded control structure: fix the error
if (mean(my_class) < 75) {
  if (mean(my_class) > me) {
    print("average year, but still smarter than me")
  } else {
    print("average year, but I'm not that bad")
  }
} else {
  if (mean(my_class) > me) {
    print("smart year, even smarter than me")
  } else {
    print("smart year, but I am smarter")
  }
}

# me, my_class and last_5 are preloaded

# Create top_grades
top_grades <- my_class[my_class >= 85]

# Create worst_grades
worst_grades <- my_class[my_class < 65]

# Write conditional statement
if (length(top_grades) > length(worst_grades)) {
  print("top grades prevail")
}

# logs is already available in your workspace

# Print the structure of logs
print(logs)

# Use list subsetting to print the details part of 11th logs entry
str(logs)

# Print the class of the timestamp component of the first entry
print(class(logs[[1]]$timestamp))

# logs is available in your workspace

# Initialize the iterator i to be 1
i <- 1

# Code the while loop
while (logs[[i]]$success) {
  print(i)
  i <- i + 1
}

# logs is available in your workspace

# Adapt the while loop
i <- 1
while (logs[[i]]$success) {
  print(logs[[i]]$details$message)
  i <- i + 1
}

# logs is available in your workspace

# Initialize i and found
i <- 1
found <- FALSE

# Code the while loop
while (found == FALSE) {
  if (logs[[i]]$success == FALSE && logs[[i]]$details$location == "waste") {
    print("found")
    found <- TRUE
  } else {
    print("still looking")
    i <- i + 1
  }
}

vec <- c(2, 3, 5, 7, 11, 13)

# Option 1
for (el in vec) {
  print(el)
}

# Option 2
for (i in 1:length(vec)) {
  print(vec[i])
}

# logs is available in your workspace

# Code a for loop that prints the timestamp of each log
for (log in logs) {
  print(log$timestamp)
}

# logs is available in your workspace

# Make the printout conditional: only if success
for (log in logs) {
  if (log$success)
    print(log$timestamp)  
}

# logs is available in your workspace

# Finish the for loop: add date element for each entry
for (i in 1:length(logs)) {
  logs[[i]]$date <- as.Date(logs[[i]]$timestamp)
}

# Print first 6 elements in logs
head(logs)

# logs is available in your workspace

# Intialize empty list: failures
failures <- list()

# Finish the for loop: add each failure to failures
for (log in logs) {
  if (!log$succes) {
    failures <- c(failures, list(log))
  }
}

# Display the structure of failures
str(failures)

# logs is available in your workspace

# Call max() on timestamps
max(timestamps)

# What is the date of the latest timestamp?
as.Date(max(timestamps))

# A faulty version of timestamps is available in your workspace

# Print out timestamps
print(timestamps)

# Call max() on timestamps, no additional arguments
max(timestamps)

# Call max() on timestamps, specify na.rm
max(timestamps, na.rm = TRUE)

# logs is available in your workspace

# Build a function extract_info(): use for loop, add return statement
extract_info <- function(x) {
  info <- c()
  for (log in x) {
    info <- c(info, log$timestamp)
  }
  return(info)
}

# Call extract_info() on logs
extract_info(logs)

# logs is available in your workspace

# Adapt the extract_info() function.
extract_info <- function(x, property) {
  info <- c()
  for (log in x) {
    info <- c(info, log[[property]])
  }
  return(info)
}

# Call extract_info() on logs, set property to "timestamp"
extract_info(logs, property = "timestamp")

# Call extract_info() on logs, set property to "success"
extract_info(logs, property = "success")

# logs is available in your workspace

# Add default value for property argument
extract_info <- function(x, property = "success") {
  info <- c()
  for (log in x) {
    info <- c(info, log[[property]])
  }
  return(info)
}

# Call extract_info() on logs, don't specify property
extract_info(logs)

# Call extract_info() on logs, set property to "timestamp"
extract_info(logs, property = "timestamp")

# logs is available in your workspace

# Adapt extract_info():
# - add argument with default value
# - change function body
extract_info <- function(x, property = "success", include_all = TRUE) {
  info <- c()
  for (log in x) {
    if (include_all || !log$success) {
      info <- c(info, log[[property]])
    }
  }
  return(info)
}

# Call extract_info() on logs, no additional arguments
extract_info(logs)

# Call extract_info() on logs, set include_all to FALSE
extract_info(logs, include_all = FALSE)

# logs is available in your workspace

# Defition of the extract_info() function
extract_info <- function(x, property = "success", include_all = TRUE) {
  info <- c()
  for (log in x) {
    if (include_all || !log$success) {
      info <- c(info, log[[property]])
    }
  }
  return(info)
}

# Generate vector of messages
extract_info(logs, property = c("details", "message"))

# Generate vector of locations for failed log entries
extract_info(logs, property = c("details", "location"), include_all = FALSE)

# logs is available in your workspace

# Write the function compute_fail_pct
compute_fail_pct <- function(x) {
  fail_count <- 0
  for (log in x) {
    if (!log$success) {
      fail_count <- fail_count + 1
    }
  }
  pct <- fail_count / length(x) * 100
  return(pct)
}

# Call compute_fail_pct on logs
compute_fail_pct(logs)

x <- list("R", "is", "awesome")
lapply(x, nchar)

# logs is available in your workspace

# Call length() on each element of logs
lapply(logs, length)

# Call class() on each element of logs
lapply(logs, class)

# logs is available in your workspace

# Define get_timestamp()
get_timestamp <- function(x) {
  return(x$timestamp)
}

# Apply get_timestamp() over all elements in logs
lapply(logs, get_timestamp)

# logs is available in your workspace

# Define get_timestamp()
get_timestamp <- function(x) {
  return(x[["timestamp"]])
}

# Apply get_timestamp() over all elements in logs
lapply(logs, get_timestamp)

a <- list(3, 2, 5)
lapply(a, function(x) { 2 * x })

# logs is available in your workspace

# Have lapply() use an anonymous function
lapply(logs, function(x) {
  x$timestamp
})

x <- list(a = 1, b = 2, c = 3)
x[["a"]]
`[[`(x, "a")

# logs is available in your workspace

# Replace the anonymous function with `[[` 
lapply(logs, `[[`, "timestamp")

# logs is available in your workspace

# Call length() on each element of logs using sapply()
sapply(logs, length)

# Definition of get_timestamp
get_timestamp <- function(x) {
  x$timestamp
}

# Get vector of log entries' timestamps
sapply(logs, get_timestamp)

# logs is available in your workspace

# Use sapply() to select the success element from each log: results
results <- sapply(logs, `[[`, "success")

# Call mean() on results
mean(results)

# Use sapply() to select the details element from each log
sapply(logs, `[[`, "details")

# logs is available in your workspace

# Implement function get_failure_loc
get_failure_loc <- function(x) {
  if (x$success) {
    return(NULL)
  } else {
    return(x$details$location)
  }
}

# Use sapply() to call get_failure_loc on logs
sapply(logs, get_failure_loc)

# logs is available in your workspace

# Convert the sapply call to vapply
vapply(logs, length, FUN.VALUE = integer(1))

# Convert the sapply call to vapply
vapply(logs, `[[`, "success", FUN.VALUE = logical(1))

# logs is available in your workspace

# Convert the sapply() call to a vapply() or lapply() call
vapply(logs, `[[`, c("details", "message"), FUN.VALUE = character(1))

# Convert the sapply() call to a vapply() or lapply() call
lapply(logs, function(x) { x$details })

# logs is available in your workspace

# Return vector with uppercase version of message elements in log entries
extract_caps <- function(x) {
  toupper(x$details$message)
}

vapply(logs, extract_caps, FUN.VALUE = character(1))

# Import titanic from csv
titanic <- read.csv("titanic.csv")

# Call dim on titanic
dim(titanic)

# Generate histogram of Age column
hist(titanic$Age)

# titanic is available in your workspace

# Print out total value of fares
print(sum(titanic$Fare))

# Print out proportion of passengers that survived
print(mean(titanic$Survived))

# Extract the name column from titanic
pass_names <- titanic$Name

# Create the logical vectror is_man
is_man <- grepl(", Mr\\.", pass_names)

# Count the number of men
sum(is_man)

# Count number of men based on gender
sum(titanic$Sex == "male")

# Extract the name column from titanic
pass_names <- titanic$Name

# Create titles
titles <- gsub("^.*, (.*?)\\..*$", "\\1", pass_names)

# Call unique() on titles
unique(titles)

res <- matrix(nrow = length(pass_names), ncol = length(titles))

for (i in seq_along(titles)) {
  res[, i] <- grepl(titles[i], pass_names)
}

pass_names <- titanic$Name
titles <- paste(",", c("Mr\\.", "Master", "Don", "Rev", "Dr\\.", "Major", "Sir", "Col", "Capt", "Jonkheer"))

# Finish the vapply() command
hits <- vapply(titles,
               FUN = grepl,
               FUN.VALUE = logical(length(pass_names)),
               pass_names)

# Calculate the sum() of hits
sum(hits)

# Count number of men based on gender
sum(titanic$Sex == "male")

# pass_names is available in your workspace

# Finish the convert_name() function
convert_name <- function(name) {
  # women: take name from inside parentheses
  if (grepl("\\(.*?\\)", name)) {
    gsub("^.*?\\((.*?)\\)$", "\\1", name)
    # men: take name before comma and after title
  } else {
    gsub("^(.*?),\\s[a-zA-Z\\.]*?\\s(.*?)$", "\\2 \\1", name)
  }
}

# Call convert_name on name
clean_pass_names <- vapply(pass_names, FUN = convert_name,
                           FUN.VALUE = character(1), USE.NAMES = FALSE)

# Print out clean_pass_names
clean_pass_names

# pass_names is available in your workspace

convert_name <- function(name) {
  # women: take name from inside parentheses
  if (grepl("\\(.*?\\)", name)) {
    gsub("^.*?\\((.*?)\\)$", "\\1", name)
    # men: take name before comma and after title
  } else {
    # Finish the gsub() function
    gsub("^(.*?),\\s[a-zA-Z\\.]*?\\s(.*?)$", "\\2 \\1", name)
  }
}

# Call convert_name on name
clean_pass_names <- vapply(pass_names, FUN = convert_name,
                           FUN.VALUE = character(1), USE.NAMES = FALSE)

# Print out clean_pass_names
print(clean_pass_names)

# titanic, dob1 and dob2 are preloaded

# Have a look at head() of dob1 and dob2
head(dob1)
head(dob2)

# Convert dob1 to dob1d, convert dob2 to dob2d
dob1d <- as.Date(dob1)
dob2d <- as.Date(dob2, format = "%B %d, %Y")

# Combine dob1d and dob2d into single vector: birth_dates
birth_dates <- append(dob1d, dob2d)

# titanic, dob1 and dob2 are preloaded
dob1d <- as.Date(dob1)
dob2d <- as.Date(dob2, format = "%B %d, %Y")
birth_dates <- c(dob1d, dob2d)
disaster_date <- as.Date("1912-04-15")

# Add birth_dates to titanic (column Birth)
titanic$Birth <- birth_dates

# Create subset: survivors
survivors <- subset(titanic, Survived == 1)

# Calculate average age of survivors
mean(disaster_date - survivors$Birth, na.rm = TRUE)
