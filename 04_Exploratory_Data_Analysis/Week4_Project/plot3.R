library(ggplot2)

# Read the data in
NEI <- readRDS("summarySCC_PM25.rds")

# Plot
ggplot(NEI[NEI$fips == "24510",], aes(year, Emissions / 1000)) +
       stat_summary(fun.y=sum, geom="line") +
       facet_grid(cols=vars(type)) +
       labs(x = "Year", y = "Total Emissions of PM2.5 in kt",
            title="Change in PM2.5 Pollution in Baltimore City, Maryland from 1999 to 2008")

ggsave("plot3.png")