# Read the data in
NEI <- readRDS("summarySCC_PM25.rds")

# Summarize emissions by year
esum <- tapply(NEI$Emissions, NEI$year, sum)

# Plot
png("plot1.png", 640, 480)

plot(esum / 1000,
     type = "b",
     xaxt = "n",
     xlab = "Year",
     ylab = "Total Emission of PM2.5 in kt",
     main = "Change in PM2.5 Pollution in the USA from 1999 to 2008")
axis(1, at=1:4, labels=names(esum))

dev.off()