shinyServer(function(session, input, output){
  
  observe({
    B001 <- termData$p.cdsubval [termData$origin == input$IN001]
    updateSelectInput(session, "IN002","CDISC Submission Value",choices = sort(unique(B001)))
  })
  
  output$TAB.B101 <- renderText({
    OUT101 <- paste0("1.You've select Standard ========== ",input$IN001)
  })
  
  output$TAB.B102 <- renderText({
    OUT102 <- paste0("2.You've select CDISC Submission Value ========== ",input$IN002)
  })
  
  output$TAB.B103 <- renderText({
  OUT103 <- paste("3. NCI Code For",input$IN002,"==========", termData %>% filter(origin %in% input$IN001 & p.cdsubval %in% input$IN002) %>% distinct(Code) %>% select (Code))
  })
  
  output$TAB.B104 <- renderText({
  OUT104 <- paste("4. NCI Code Name For",input$IN002,"==========", termData %>% filter(origin %in% input$IN001 & p.cdsubval %in% input$IN002) %>% distinct(cp.cdlstname) %>% select(cp.cdlstname))
  })
  
  output$TAB.B105 <- renderText({
    OUT105 <- paste("5. Is control terminology extensible for",input$IN002,"? ========== ", termData %>% filter(origin %in% input$IN001 & p.cdsubval %in% input$IN002) %>% distinct(Codelist.extensible) %>% select(Codelist.extensible))
  })
  
  output$TAB.B106 <- renderText({
    OUT106 <- paste("6. The control terminology for",input$IN001,"standard has been updated on by NCI on ========== ", termData %>% filter(origin %in% input$IN001 & p.cdsubval %in% input$IN002) %>% distinct(VerDate) %>% select(VerDate))
  })
  
 
  output$TAB.B201 <- renderDataTable({
    OUT201 <- termData %>% filter(origin == input$IN001 & p.cdsubval == input$IN002) %>% select(L2.Code,L2.Name,CDISC.Synonym,CDISC.Definition,NCI.Preferred.Term) %>% rename(NCI.Code=L2.Code,NCI.Code.Name=L2.Name)
  },options = list(lengthMenu = list(c(3,5,10,15,25,50,-1), c('3', '5', '10','15','25','50','All')), searching = T, pageLength = 10,
                   autoWidth = TRUE,
                   columnDefs = list(list(width = '60%', targets = c(4,5))),
                   initComplete = JS("
    function(settings, json) {
      $(this.api().table().header()).css({
        'background-color': '#000',
        'color': '#fff'
      });
    }")))

  output$TAB.B301 <- renderDataTable({
    OUT201 <- grati[ ,-1]
  },options = list(lengthMenu = list(c(3,5,10,15,-1), c('3', '5', '10','15','All')), searching = T,pageLength = 10, 
                   initComplete = JS("
    function(settings, json) {
      $(this.api().table().header()).css({
        'background-color': '#000',
        'color': '#fff'
      });
    }")))
  
  
  output$TAB.Z101 <- renderDataTable({
    OUTZ01 <- termData %>% filter(origin == input$IN001 & input$IN003 != "") %>% filter_all(any_vars(str_detect(.,fixed(input$IN003, ignore_case=TRUE)))) %>% select(Code,p.cdsubval,cp.cdlstname,Code,c.cdsubval,c.cdsyno,c.cddef,c.ncipt) %>% group_by(Code) %>% rename(NCI.Code.main=cdlstcd,NCI.Code.Label.main=cp.cdlstname,NCI.Name.main=p.cdsubval,
                                                                                                                                                                                                                                                                          NCI.Code=Code,NCI.Code.Name=cp.cdlstname)
    },options = list(lengthMenu = list(c(3,5,10,15,-1), c('3', '5', '10','15','All')), pageLength = 10,
                     initComplete = JS("
    function(settings, json) {
      $(this.api().table().header()).css({
        'background-color': '#000',
        'color': '#fff'
      });
    }")))
  
  output$TAB.X101 <- renderPlotly({
    
    OUTX101 <- plot_ly(x = names(table(as.factor(termData$origin))),
                  y = round(as.numeric(table(as.factor(termData$origin)))*100/ as.numeric(sum(table(as.factor(termData$origin)))),digits = 2),
                  name = "Standard",
                  type = "bar",
                  marker = list(color = c("rgba(455, 10, 0, 0.9)",
                                          "rgba(220, 12, 3, 0.2)",
                                          "rgba(255, 20, 0, 0.7)",
                                          "rgba(220, 12, 3, 0.2)", 
                                          "rgba(122, 20, 3, 0.4)",
                                          "rgba(455, 10, 0, 0.9)"
                  ))) %>% 
      layout(title = "Control Terminology vs Percentage",
             xaxis = list(title = "Standard",
                          zeroline = FALSE),
             yaxis = list(title = "Percentage",
                          zeroline = FALSE))
  })
  
  })














