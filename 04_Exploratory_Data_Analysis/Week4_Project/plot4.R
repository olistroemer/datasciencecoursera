library(ggplot2)

# Read the data in
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot
ggplot(NEI[NEI$SCC %in% SCC[grep("Coal", SCC$EI.Sector, fixed = T),]$SCC,], aes(year, Emissions / 1000)) +
       stat_summary(fun.y=sum, geom="line") +
       labs(x = "Year", y = "Total Coal-related Emissions of PM2.5 in kt",
            title="Change in PM2.5-pollution from Coal-related Sources in the USA")

ggsave("plot4.png")