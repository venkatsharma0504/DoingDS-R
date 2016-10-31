##################################################################################
#This script Merges the datasets downloaded in other two R files 
#LoadGrossDomesticProductData.R and LoadEducationalData.R
#creates a merged dataset for analytics

# Venkat Sharma

# Updated 10 October 2016

# Download URL https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv

##################################################################################
#load the R scripts for both the datasets
source("LoadGrossDomesticProductData.R")
source("LoadEducationalData.R")

FinalMergedData <- merge(x=GDPProductData,
                         y=EducationalData,
                         by="CountryCode",
                         all=TRUE)

FinalMergedData <- FinalMergedData[order(FinalMergedData$USD),]

library(ggplot2)
LinePlot <- ggplot(data = FinalMergedData, aes(x = FinalMergedData$CountryCode, y = FinalMergedData$USD, color = FinalMergedData$Income.Group, linetype = FinalMergedData$Income.Group)) + 
  geom_density() + scale_color_discrete(name = "", labels = c("High income:nonOECD", "High income:OECD","Low income","Lower middle income","Upper middle income")) +scale_linetype(name = "", 
  labels = c("High income:nonOECD", "High income:OECD","Low income","Lower middle income","Upper middle income")) + xlab("\n Country") + ylab("GDP\n") + theme_bw(base_size =6)
quantileData <- cut(as.numeric(FinalMergedData$Ranking),
                      breaks=  c(0,50,100,150,200),
                    labels =c("low", "medium low", "medium high", "high income"))