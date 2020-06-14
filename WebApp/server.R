shinyServer(function(session, input, output){

  #session$onSessionEnded(stopApp)
  #********************************************************************************************************************************************************************************************************************************************************************************************************************************************************#
  #********************************************************************************************************************************************************************************************************************************************************************************************************************************************************#
  ##================= Control Terminology Tab: Show summary results  ================================================================================================================================================================================================================================================###
  observe({
    B001 <- termData$p.cdsubval [termData$origin == input$IN001]
    updateSelectInput(session, "IN002","CDISC Submission Value",choices = sort(unique(B001)))
  })
  
  output$TAB.B101 <- renderText({
    OUT101 <- paste0("1.The Standard has been selected ========== ",input$IN001)
  })
  
  output$TAB.B102 <- renderText({
    OUT102 <- paste("2.",termData %>% filter(origin %in% input$IN001 & p.cdsubval %in% input$IN002) %>% distinct(Extyn) %>% select(Extyn),"For the",input$IN002)
  })
  
  output$TAB.B103 <- renderText({
    OUT103 <- paste0("3.CDISC Submission Value has been selected ========== ",input$IN002)
  })
  
  output$TAB.B104 <- renderText({
  OUT104 <- paste("4.NCI Code For",input$IN002,"==========", termData %>% filter(origin %in% input$IN001 & p.cdsubval %in% input$IN002) %>% distinct(cdlstcd) %>% select (cdlstcd))
  })
  
  output$TAB.B105 <- renderText({
    OUT105 <- paste("5.NCI Code Name For",input$IN002,"==========", termData %>% filter(origin %in% input$IN001 & p.cdsubval %in% input$IN002) %>% distinct(cp.cdlstname) %>% select(cp.cdlstname))
  })
  
  output$TAB.B106 <- renderText({
    OUT106 <- paste("6.The control terminology for",input$IN001,"standard has been updated on ========== ", termData %>% filter(origin %in% input$IN001 & p.cdsubval %in% input$IN002) %>% distinct(verdate) %>% select(verdate))
  })

  output$TAB.B107 <- renderText({
    OUT107 <- paste("7.HandyCT refreshed data on ========== ", termData %>% filter(origin %in% input$IN001 & p.cdsubval %in% input$IN002) %>% distinct(last.update) %>% select(last.update))
  })
  
  output$TAB.B108 <- renderText({
    OUT108 <- paste("8.",termData %>% filter(origin %in% input$IN001 & p.cdsubval %in% input$IN002) %>% distinct(srcinfo) %>% select(srcinfo))
  })
  
  
  ##============ Control Terminology Tab: For Select input word search =====================================#
  output$TAB.B201 <- renderDataTable({
    OUT201 <- termData %>% filter(origin == input$IN001 & p.cdsubval == input$IN002) %>% select(Code,c.cdsubval,c.cdsyno,c.cddef,c.ncipt) %>% rename(CodeList.Name=c.cdsubval,
                                                                                                                                                      CDISC.Synonym=c.cdsyno,
                                                                                                                                                       CDISC.Definition=c.cddef,
                                                                                                                                                       NCI.Prefered.Term=c.ncipt)
  },options = list(lengthMenu = list(c(3,5,10,15,25,50,-1), c('3', '5', '10','15','25','50','All')), searching = T, pageLength = 10,
                   autoWidth = F,
                   language = list(zeroRecords = "Server is ready to receive requests"), 
                   smart = T,
                   searchHighlight = TRUE, search = list(search = ''),
                   #language = list(url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Chinese.json'),
                   columnDefs = list(list(width = "800px", targets = c(4,5))),
                   initComplete = JS("
    function(settings, json) {
      $(this.api().table().header()).css({
        'background-color': '#0a0000',
        'color': '#fff'
      });
    }")))
  
###==================== Control Terminology Tab: For Search Keyword ===========================================###
output$TAB.Z101 <- renderDataTable({
  
    OUTZ01 <- termData %>% filter(origin == input$IN001 & input$IN003 != "") %>% filter_all(any_vars(str_detect(.,fixed(input$IN003, ignore_case=TRUE)))) %>% select(p.cdsubval,cdlstcd,Code,c.cdsubval,c.cdsyno,c.cddef,c.ncipt) %>% group_by(Code) %>% rename(CodeList.Code=cdlstcd,
                                                                                                                                                                                                                                                                 CDISC.Submission.Value.main=p.cdsubval,
                                                                                                                                                                                                                                                                  CodeList.Name=c.cdsubval,
                                                                                                                                                                                                                                                                 CDISC.Synonym=c.cdsyno,
                                                                                                                                                                                                                                                                    CDISC.Definition=c.cddef,
                                                                                                                                                                                                                                                                     NCI.Prefered.Term=c.ncipt)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
},options = list(lengthMenu = list(c(3,5,10,15,25,50,-1), c('3', '5', '10','15','25','50','All')), searching = T, pageLength = 10,
                 autoWidth = F,
                 language = list(zeroRecords = "Server is ready to receive requests"), 
                 smart = T,
                 searchHighlight = TRUE, search = list(search = ''),
                 #language = list(url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Chinese.json'),
                 columnDefs = list(list(width = "800px", targets = c(4,5))),
                 initComplete = JS("
    function(settings, json) {
      $(this.api().table().header()).css({
        'background-color': '#0a0000',
        'color': '#fff'
      });
    }")))

#********************************************************************************************************************************************************************************************************************************************************************************************************************************************************#
#********************************************************************************************************************************************************************************************************************************************************************************************************************************************************#

###================= Impl.guide: Show summary results  ====================###
observe({
  B2001 <- IgData$Core [IgData$P.Prelab == input$IN2001]
  updateSelectInput(session, "IN2002","Select Core Values such as Req,Exp,Perm",choices = sort(unique(B2001)))
})

output$TAB.B2101 <- renderText({
  OUT2101 <- paste0("1.SDTM Domain has been selected ========== ",str_extract(input$IN2001, "^.*(?=-)"))
})

output$TAB.B2102 <- renderText({
  OUT2102 <- paste0("2.Two-character abbreviation for selected Domain is ========== ",str_extract(input$IN2001, "^.*(?=-)"))
})

output$TAB.B2103 <- renderText({
  OUT2103 <- paste("3.Label for",str_extract(input$IN2001, "^.*(?=-)"),"Domain ==========", IgData %>% filter(P.Prelab %in% input$IN2001) %>% distinct(P.Domain.Label) %>% select (P.Domain.Label))
})

output$TAB.B2104 <- renderText({
  OUT2104 <- paste("4.The CDISC Compliance Structure for",str_extract(input$IN2001, "^.*(?=-)"),"Domain ==========", IgData %>% filter(P.Prelab %in% input$IN2001) %>% distinct(P.Domain.Structure) %>% select (P.Domain.Structure))
})

output$TAB.B2105 <- renderText({
  OUT2105 <- paste("5.The Observation Class for",str_extract(input$IN2001, "^.*(?=-)"),"Domain ==========", IgData %>% filter(P.Prelab %in% input$IN2001) %>% distinct(P.Observation.Class) %>% select (P.Observation.Class))
})

output$TAB.B2106 <- renderText({
  OUT2106 <- paste("6.You've selected",str_extract(input$IN2001, "^.*(?=-)"),"Domain from ==========", IgData %>% filter(P.Prelab %in% input$IN2001) %>% distinct(Version.x) %>% select (Version.x))
})

output$TAB.B2107 <- renderText({
  OUT2107 <- paste("7.HandyCT refreshed data on ========== ", IgData %>% filter(P.Prelab %in% input$IN2001) %>% distinct(last.update) %>% select(last.update))
})

output$TAB.B2108 <- renderText({
  OUT2108 <- paste("8.",IgData %>% filter(P.Prelab %in% input$IN2001) %>% distinct(srcinfo) %>% select(srcinfo))
})


##============ Implementation Guide : For Select input word search =====================================#
output$TAB.B2201 <- renderDataTable({
  OUT2201 <- IgData %>% filter(P.Prelab == input$IN2001 & Core %in% input$IN2002) %>% select(Domain.Prefix,Variable.Name,Variable.Label,Type,Core,Controlled.Terms.or.Format,Role,cdisc.notes) %>% rename(Domain=Domain.Prefix,CT.or.Format=Controlled.Terms.or.Format,CDISC.Notes=cdisc.notes,Variable=Variable.Name,Label=Variable.Label)
},options = list(lengthMenu = list(c(3,5,10,15,25,50,-1), c('3', '5', '10','15','25','50','All')), searching = T, pageLength = 10,
                 language = list(zeroRecords = "Server is ready to receive requests"), 
                 autoWidth = F,
                 smart = T,
                 searchHighlight = TRUE, search = list(search = ''),
                 #language = list(url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Chinese.json'),
                 columnDefs = list(list(width = "800px", targets = 8)),
                 initComplete = JS("
    function(settings, json) {
      $(this.api().table().header()).css({
        'background-color': '#0a0000',
        'color': '#fff'
      });
    }")))

###==================== IG: For Search Keyword ===========================================###
output$TAB.Z2101 <- renderDataTable({
  
  OUTZ2101 <- IgData %>% filter(input$IN2003 != "") %>% filter_all(any_vars(str_detect(.,fixed(input$IN2003, ignore_case=TRUE)))) %>% select(Domain.Prefix,P.Observation.Class,P.Domain.Structure,P.Domain.Label,Variable.Name,Variable.Label,Type,Controlled.Terms.or.Format,Role,cdisc.notes) %>% group_by(Domain.Prefix,P.Observation.Class) %>% rename(CT.or.Format=Controlled.Terms.or.Format,CDISC.Notes=cdisc.notes,Domain=Domain.Prefix,Variable=Variable.Name,Label=P.Domain.Label,Structure=P.Domain.Structure,Observation.Class=P.Observation.Class) 
  
  },options = list(lengthMenu = list(c(3,5,10,15,25,50,-1), c('3', '5', '10','15','25','50','All')), searching = T, pageLength = 10,
                   language = list(zeroRecords = "Server is ready to receive requests"),  
                 autoWidth = F,
                 smart = T,
                 searchHighlight = TRUE, search = list(search = ''),
                 #language = list(url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Chinese.json'),
                 columnDefs = list(list(width = "500px", targets = 10)),
                 initComplete = JS("
    function(settings, json) {
      $(this.api().table().header()).css({
        'background-color': '#0a0000',
        'color': '#fff'
      });
    }")))


#********************************************************************************************************************************************************************************************************************************************************************************************************************************************************#
#********************************************************************************************************************************************************************************************************************************************************************************************************************************************************#

##=============== Believe or Not tab ===========================================================================================================================================================================================================================================================================================================================##
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

#********************************************************************************************************************************************************************************************************************************************************************************************************************************************************#
#********************************************************************************************************************************************************************************************************************************************************************************************************************************************************#
  
##============== Gratitude Tab ==========================================================================================================================================================================================================================================================================================================================================##
  
  output$TAB.B301 <- renderDataTable({
    OUT201 <- grati[ ,-1]
  },options = list(lengthMenu = list(c(3,5,10,15,-1), c('3', '5', '10','15','All')), searching = T,pageLength = 10, 
                   initComplete = JS("
    function(settings, json) {
      $(this.api().table().header()).css({
        'background-color': '#878081',
        'color': '#fff'
      });
    }")))

#********************************************************************************************************************************************************************************************************************************************************************************************************************************************************#
#********************************************************************************************************************************************************************************************************************************************************************************************************************************************************#
  #output$slickr <- renderSlickR({
    #imgs <- list.files("/Users/sp/Desktop/CT/xls/WebApp/WWW/Caro", pattern="caro", full.names = TRUE)
    #slickR(imgs) + settings(autoplay = TRUE, autoplaySpeed = 5)
  #})


})



















