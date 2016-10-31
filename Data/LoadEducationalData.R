##################################################################################

# This script Downloads the Gross Domestic Product Detail Data set for the 190 
# ranked countries,cleans the data by removing unwanted records having NULL and 
# empty records for analysis.

# Venkat Sharma

# Updated 10 October 2016

# Download URL https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv

##################################################################################
library(repmis)
library(RCurl)
# create a  site URL variable
site2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
getwd()
# download the dataset file into the current directory i.e data directory
download.file(site2,destfile="./EducationalData.csv")
# read the CSV file to create a dataset
EducationalData <-read.csv("EducationalData.csv",header =TRUE)
# filter dataset to cleanup Null and empty records
EducationalData <- subset(x = EducationalData, EducationalData !="")
# filter dataset to cleanup Null and empty records
EducationalData <- subset(x = EducationalData, EducationalData$Income.Group != "")

