shinyUI(fluidPage(

    titlePanel("Swiss Fertility and Socioeconomic Indicators from 1888"),

    sidebarLayout(
        sidebarPanel(
            varSelectInput("regressand", "Regressand (the dependent variable):", swiss),
            varSelectInput("regressor", "Regressor (the independent variable):", swiss, names(swiss)[2]),
            varSelectInput("color", "Color:", swiss, names(swiss)[3]),
            varSelectInput("size", "Size:", swiss, names(swiss)[4]),
            checkboxInput("showRegression", "Show the regression line", value=T),
            h2("Documentation"),
            p("With this shiny application you can explore the `swiss` data set from the `datasets` package in R."),
            p("Using the drop-down fields you can assign the different variables to the features of the plot. The plot will change immediately."),
            h3("Regression Line"),
            p("In the plot you can see a regression line with the 95 % confidence interval around it. It describes the relationship between the regressand and the regressor."),
            p("You can also hide the line using the checkbox."),
            h3("Source Code"),
            p("You can find the source code of this application here:"),
            a("GitHub link", href="https://github.com/olistroemer/datasciencecoursera/tree/master/09_Developing_Data_Products/Week4_Project")
        ),
        mainPanel(
            plotOutput("plot")
        )
    )
))
