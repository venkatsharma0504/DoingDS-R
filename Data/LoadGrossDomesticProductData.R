##################################################################################

# This script Downloads Gross Domestic Product data for the 190 ranked countries
#ranked countries,cleans the data by removing unwanted records having NULL and 
# empty records for analysis.

# Venkat Sharma

# Updated 10 October 2016

# Download URL https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv

##################################################################################
library(repmis)
library(RCurl)

# create a  site URL variable
site <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
#just check current working directory
getwd()
# download the dataset file into the current directory i.e data directory
download.file(site,destfile="./GDPProductData.csv")
# read the CSV file to create a dataset
GDPProductData <-read.csv("GDPProductData.csv",header =TRUE)
# clean dataset for null or empty records
GDPProductData <- subset(x = GDPProductData, GDPProductData != "")
#remove unwanted columns
GDPProductData$X.1 <- NULL
GDPProductData$X.4 <- NULL
GDPProductData$X.5 <- NULL
GDPProductData$X.6 <- NULL
GDPProductData$X.7 <- NULL
GDPProductData$X.8 <- NULL
#rename cloumn names for understanding purposes
GDPProductData <- dplyr::rename(GDPProductData,CountryCode = X,Ranking = Gross.domestic.product.2012,Economy=X.2, USD=X.3)



