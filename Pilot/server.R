shinyServer(function(session, input, output){
  
  observe({
    B001 <- termData$L1.Name [termData$CT.Type == input$IN001]
    updateSelectInput(session, "IN002","CDISC Submission Value [e.g. LBTESTCD]",choices = sort(unique(B001)))
  })
  
  output$TAB.B101 <- renderText({
    OUT101 <- paste0("1.You've select Standard ========== ",input$IN001)
  })
  
  output$TAB.B102 <- renderText({
    OUT102 <- paste0("2.You've select CDISC Submission Value ========== ",input$IN002)
  })
  
  output$TAB.B103 <- renderText({
  OUT103 <- paste("3. NCI Code For",input$IN002,"==========", termData %>% filter(CT.Type %in% input$IN001 & L1.Name %in% input$IN002) %>% distinct(L1.Code) %>% select (L1.Code))
  })
  
  output$TAB.B104 <- renderText({
  OUT104 <- paste("4. NCI Code Name For",input$IN002,"==========", termData %>% filter(CT.Type %in% input$IN001 & L1.Name %in% input$IN002) %>% distinct(L1.Label) %>% select(L1.Label))
  })
  
  output$TAB.B105 <- renderText({
    OUT105 <- paste("5. Is control terminology extensible for",input$IN002,"? ========== ", termData %>% filter(CT.Type %in% input$IN001 & L1.Name %in% input$IN002) %>% distinct(Codelist.extensible) %>% select(Codelist.extensible))
  })
  
  output$TAB.B106 <- renderText({
    OUT106 <- paste("6. The control terminology for",input$IN001,"standard has been updated on by NCI on ========== ", termData %>% filter(CT.Type %in% input$IN001 & L1.Name %in% input$IN002) %>% distinct(VerDate) %>% select(VerDate))
  })
 
  output$TAB.B201 <- renderDataTable({
    OUT201 <- termData %>% filter(CT.Type == input$IN001 & L1.Name == input$IN002) %>% select(L2.Code,L2.Name,CDISC.Synonym,CDISC.Definition,NCI.Preferred.Term) %>% rename(NCI.Code=L2.Code,NCI.Code.Name=L2.Name)
  },options = list(lengthMenu = list(c(3,5,10,15,25,50,-1), c('3', '5', '10','15','25','50','All')), pageLength = 10))

  output$TAB.B301 <- renderDataTable({
    OUT201 <- grati[ ,-1]
  },options = list(lengthMenu = list(c(3,5,10,15,-1), c('3', '5', '10','15','All')), pageLength = 10))
  
})