library(ggplot2)

shinyServer(function(input, output) {
    output$plot <- renderPlot({
        g <- ggplot(swiss, aes(!!input$regressor, !!input$regressand)) +
            geom_point(aes(color=!!input$color, size=!!input$size))
            
        if (input$showRegression)
            g <- g + geom_smooth(method="lm")
        
        g
    })
})
