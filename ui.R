fluidPage(
  
  pageWithSidebar(
    headerPanel('Student dimension reduction and clustering'),
    sidebarPanel(
      varSelectInput("variables", "Variable:", student, multiple = TRUE),
      numericInput('dimension', 'Dimension:', 2, min = 2, max = 3)
    ),
    
    mainPanel(
      plotlyOutput('plot1')
    )
  )
  
)
