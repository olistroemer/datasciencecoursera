library(ggplot2)

# Read the data in
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot
ggplot(NEI[NEI$SCC %in% SCC[grep("Vehicle", SCC$EI.Sector, fixed = T),]$SCC &
                   NEI$fips %in% c("24510","06037"),], aes(year, Emissions / 1000)) +
       stat_summary(fun.y=sum, geom="line", aes(color=fips)) +
       scale_color_manual("", values=c("red","blue"), labels=c("Los Angeles County", "Baltimore City")) +
       labs(x = "Year", y = "Total Motor Vehicle-related Emissions of PM2.5 in kt",
            title="Comparsion of Change in PM2.5-pollution from 1999 to 2008")

ggsave("plot6.png")