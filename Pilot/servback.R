#Server
server <- shinyServer(function(input,output){
  
  output$B101 <- renderText({
    
    B11 <- isolate(paste0("1.You've select Standard ========== ",input$A001))
  })
  
  output$B102 <- renderText({
    
    B12 <- isolate(paste0("2.You've select CDISC Submission Value ========== ",input$A002))
  })
  
  output$B103 <- renderText({
    
    
    B13 <- paste("3. NCI Code For CDISC Submission Value ", input$A002," ========== ",unique(subset(termData[ ,termData$L1.Code], termData$CT.Type == input$A001 & termData$L1.Name == input$A002)))
  })
  
  output$B104 <- renderText({
    
    B14 <- paste("4.NCI Code Name For CDISC Submission Value", input$A002," ========== ",unique(subset(termData[ ,termData$L1.Label], termData$CT.Type == input$A001 & termData$L1.Name == input$A002)))
  })
  
  output$B105 <- renderText({
    
    B15 <- paste("==== Thanks for Choosing Control Terminology Application ==== ")
  })
  
  output$B106 <- renderText({
    
    
    
    B16 <- paste("===== Contact for any question : * Parth Shah * Email- tapswi2696@gmail.com =====")
  })
  
  
  output$B201 <- renderTable({
    B21 <- subset(termData[ ,termData$L1.Code], termData$CT.Type == input$A001 & termData$L1.Name == input$A002)
  })
  
})





#Ui
ui <- fluidPage(theme = shinytheme("darkly"),
                img(src = "001.Background.png", width = "100px", height = "100px"),
                img(src = "002.Background.png", width = "100px", height = "100px"),
                img(src = "003.Background.png", width = "100px", height = "100px"),
                img(src = "004.Background.png", width = "100px", height = "100px"),
                img(src = "005.Background.png", width = "100px", height = "100px"),
                img(src = "006.Background.png", width = "200px", height = "100px"),
                strong(h3(p("HandyCT Application V 1.0"))),
                br(),
                titlePanel("Welcome to Control Terminology Application"), 
                sidebarLayout(sidebarPanel(h5(radioButtons(inputId = "A001",label = "CDISC Foundation",choices = unique(termData$CT.Type),selected = "SDTM")),
                                           h5(selectInput(inputId = "A002", label = "Select CDISC Submission Value", choices = unique(termData$L1.Name),selected = "LBTESTCD")), 
                                           actionButton("Action", "Click Me !", class = "btn btn-primary"), p("Click me to update Result ! - All Fields are required")),
                              
                              mainPanel(tabsetPanel(
                                tabPanel("Summary", br(),h4(tableOutput("B105")),strong(tableOutput("B106")),br(),br(),h4(textOutput("B101")), br(),h4(textOutput("B102")),br(),h4(textOutput("B103")),br(),h4(textOutput("B104")),br()),
                                tabPanel("Results", br(),tableOutput("B201"))
                              ))
                ))
devtools::install_github("ramnathv/htmlwidgets#351")


dataTableOutput()

