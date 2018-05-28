# How to work with Quandl in R
# https://campus.datacamp.com/courses/quandl-r-tutorial/chapter-one-importing-quandl-datasets

# Load in the Quandl package with the help of library() here:
library(Quandl)

# Assign your first dataset to the variable:
mydata <- Quandl("NSE/OIL")

# Your Quandl Package is already loaded in
library(Quandl)

# Assign the Prague Stock Exchange to:
PragueStockExchange <- Quandl("PRAGUESE/PX")

# The quantmod package is ready for use:
library(quantmod)

# Load in the Facebook data with the help of Quandl
Facebook <- Quandl("WIKI/FB", type = "xts")

# Plot the chart with the help of candleChart()
candleChart(Facebook)

# Your Quandl Package is already loaded in
library(Quandl)

# Look up the first 3 results for 'Bitcoin' within the Quandl database:
results <- Quandl.search(query = "Bitcoin", silent = FALSE)

# Print out the results
str(results)

# Assign the data set with code BCHAIN/TOTBC
BitCoin <- Quandl("BCHAIN/TOTBC")

# Retrieve all rows for ZACKS/FC for 'AAPL' and 'MSFT'
datatable_all <- Quandl.datatable("ZACKS/FC", ticker = c("AAPL","MSFT"))

# Retrieve all rows for ZACKS/FC for 'AAPL' and 'MSFT'.  Only return the ticker and per_end_date columns
datatable_columns <- Quandl.datatable("ZACKS/FC", ticker = c("AAPL","MSFT"), qopts.columns = c("ticker", "per_end_date"))

# Load the Quandl package
library(Quandl)

# Assign to the variable exchange
exchange <- Quandl("CUR/EUR", start_date = "2013-01-01", end_date = "2013-12-01")

# Load the Quandl package
library(Quandl)

# The result:
GDP_Change <- Quandl("FRED/CANRGDPR", transform = "rdiff")

# Load the Quandl package
library(Quandl)

# The result:
eiaQuarterly <- Quandl("EIA/STEO_RAIMUUS_Q", collapse = "quarterly")

# Load the Quandl package
library(Quandl)

# Assign to TruSo the first 5 observations of the crude oil prices
TruSo <- Quandl("EIA/STEO_RAIMUUS_Q", rows = 5, order = "asc")

# Print the result
TruSo

# Load the Quandl Package
library(Quandl)

# Here you should place the return:
Final <- Quandl("EIA/STEO_RAIMUUS_Q", start_date = "2005-01-01", end_date = "2010-03-01",
                order = "asc", transform = "rdiff")
