function(input, output, session) {
  
 selected <- reactive({
    req(input$variables)
  # Combine the selected variables into a new data frame
    select_data(student, input$variables, 'G3')
  })
  
  output$plot1 <- renderPlotly({
    req(input$dimension)
    make_cluster(selected(), input$dimension)
  })
  
}