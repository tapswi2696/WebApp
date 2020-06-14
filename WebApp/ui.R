shinyUI(fluidPage(
                  navbarPage(title="HandyCT",theme = shinytheme("readable"),inverse = T, selected = "About Us",

                             setBackgroundImage(
                               src = "004.Background.gif"
                             ),                           
                  #============= FIRST TAB - ABOUT US ===================================#         
                  tabPanel("About Us", fluid= T, icon=icon("fas fa-puzzle-piece"),
                           fluidRow(
                             column(width=5,tags$h1(p(strong("Mission & Vision"))),br(),tags$h3(p("We believe that everyone should have easy access to control 
                                                                              terminologies, CDISC information for Clinical Devlopment. Our goal is to overcome any technical barriers that can prevent individuals working in clinical teams from achieving their work efficiently. Innovation and simplicity is our primary objective.
                                                                              We're excited to help you and make you a part of our journey!",
                                                                               style = "font-size:23px; font-family: courier, serif;font-weight: 1000;color:Dark cyan;word-wrap: break-word;")),br()), br(), br(),
                             column(width=4,img(src = "logo.jpg", width = "350px", height = "350px"))
                                   ),
                           
                           fluidRow(
                             column(width=5,tags$h1(p(strong("Our Leadership"))))
                                   ),
                           br(),
                           br(),
                           fluidRow(
                              column(width=3,img(src = "nsp.png", alt="Parth Shah", width = "250px", height = "250px", style="border-radius: 50%;"),br(),tags$h3(p("Parth Shah",style = "background-color:#D9D9D9; font-size:30px; font-family: courier, bold, serif;font-weight: 1000;color:Blue;word-wrap: break-word;text-align: center; text-decoration: underline")),p("Product Owner & Developer",style = "background-color:#D9D9D9; font-size:20px; font-family: courier,serif;font-weight: 1000;color:Dark cyan ;word-wrap: break-word;text-align: center;")),
                              
                              column(width=1,p(" ")),  
                              
                              column(width=3,img(src = "tp.jpg", alt="Toral Patel", width = "250px", height = "250px",style="border-radius: 50%;"),br(),tags$h3(p("Toral Patel",style = "background-color:#D9D9D9; font-size:30px; font-family: courier, bold, serif;font-weight: 1000;color:Blue;word-wrap: break-word;text-align: center; text-decoration: underline")),p("Feature Product Owner & Technical Architect",style = "background-color:#D9D9D9; font-size:20px; font-family: courier,serif;font-weight: 1000;color:Dark cyan ;word-wrap: break-word;text-align: center;")),
                              
                              column(width=1,p(" ")), 
                              
                              column(width=3,img(src = "sp.png", alt="Vishal Zaveri", width = "250px", height = "250px",style="border-radius: 50%;"),br(),tags$h3(p("Vishal Zaveri",style = "background-color:#D9D9D9; font-size:30px; font-family: courier,bold, serif;font-weight: 1000;color:Blue;word-wrap: break-word;text-align: center; text-decoration: underline")),p("Developer & Technical Architect",style = "background-color:#D9D9D9; font-size:20px; font-family: courier,serif;font-weight: 1000;color:Dark cyan ;word-wrap: break-word;text-align: center;")))
                        ), 
             
                  #============= SECOND TAB - CONTROL TERMINOLOGY ====================#
                  tabPanel("Control Terminology", fluid= T, icon=icon("fal fa-database"),
                  #tags$head(includeHTML("Webanalytics.html")),
                  tags$style("body{background-color:#D9D9D9; font-size:20px; font-family: courier,serif;font-weight: 1000;color:Dark cyan;}"),
                  tags$style(".well{background-image: url(001.Background.jpg); font-size:22px; font-family: courier, bold, serif;font-weight: 1000;color:Dark cyan;}"), 
                  titlePanel(tags$h2(strong("HandyCT v3.0",style = "font-family: courier, font-size:40px;serif;color:Dark cyan;")),windowTitle = "HandyCT-CT"),
                  sidebarLayout(
                      sidebarPanel(
                        tags$h4(strong(p("Step 1: Please select a CDISC Standard.",style = "font-family: courier, serif;color:Black;font-size:22px;"))),
                         awesomeRadio("IN001", "CDISC Standards",choices = sort(unique(termData$origin)),inline = F),
                         br(),
                         tags$h4(strong(p("Step 2: Please enter either keywords or select CDISC Submission Value.",style = "font-family: courier, serif;color:Black;font-size:22px;"))),                       
                         selectInput("IN002", "CDISC Submission Value", choices = NULL, selected = NULL, selectize=T),
                         tags$h4(strong(p("Please check 'Summary' and 'Results' tabs for output."))),
                         br(),
                         tags$h2(strong(p("================ OR ==============",style = "font-family: courier, serif;color:Black;font-size:22px;"))),br(),
                         searchInput(inputId = "IN003", label = "Keywords [Please check 'Keyword Results' tab for output]",placeholder = "   ",btnSearch = icon("search"),btnReset = icon("remove"),width = "450px"),
                         br(),
                         tags$div(img(src = "002.Background.gif", width = "300px", height = "200px"),img(src = "logo.png", width = "200px", height = "200px"),br(),br(),
                         img(src = "002.MQ.jpg", width = "450px", height = "300px"))),
                      mainPanel(tabsetPanel(
                        tabPanel("Summary", br(),span(textOutput("TAB.B101"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),
                                 span(textOutput("TAB.B102"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),span(textOutput("TAB.B103"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),span(textOutput("TAB.B104"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),
                                 span(textOutput("TAB.B105"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),span(textOutput("TAB.B106"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),span(textOutput("TAB.B107"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),span(textOutput("TAB.B108"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),br(),br()),  
                        tabPanel("Results", br(),dataTableOutput("TAB.B201",width = "100%", height = "auto")),
                        tabPanel("Keyword Results",br(),dataTableOutput("TAB.Z101"))
                      )))),
 
                  #============= THIRD TAB - IMPLEMENTATION GUIDE  ====================#  
                  
                  tabPanel("Implementation Guide", fluid= T, icon=icon("far fa-file-alt"),
                           #tags$head(includeHTML("Webanalytics.html")),
                           tags$style("body{background-color:#D9D9D9; font-size:22px; font-family: courier,serif;font-weight: 1000;color:Dark cyan;}"),
                           tags$style(".well{background-image: url(001.Background.jpg); font-size:22px; font-family: courier, bold, serif;font-weight: 1000;color:Dark cyan;}"), 
                           titlePanel(tags$h2(strong("HandyCT v3.0",style = "font-family: courier, font-size:40px;serif;color:Dark cyan;")),windowTitle = "HandyCT-IG"),
                           sidebarLayout(
                             sidebarPanel(
                               tags$h4(strong(p("Step 1: Please select a Domain.",style = "font-family: courier, serif;color:Black;font-size:22px;"))),
                               selectInput("IN2001", "CDISC Standard Domains",choices = sort(unique(IgData$P.Prelab)),multiple = F),
                               #pickerInput("IN2001","CDISC Standard Domains",choices = sort(unique(IgData$P.Prelab)),inline = F, multiple = TRUE,options = list(`actions-box` = TRUE, size = 10,`selected-text-format` = "count > 2",`show-Tick`= TRUE,`live-Search` = TRUE,`select-On-Tab` = TRUE),choicesOpt = list(style = rep(("font-size:22px; font-family: courier,serif;font-weight: 1000;color:Dark cyan;"),3000))),
                               br(),
                               tags$h4(strong(p("Step 2: Please Select Core Values.",style = "font-family: courier, serif;color:Black;font-size:22px;"))),                       
                               #searchInput(inputId = "IN2003", label = "Keywords [Please check 'Keyword Results' tab for output]",placeholder = "   ",btnSearch = icon("search"),btnReset = icon("remove"),width = "450px"),
                               selectInput("IN2002","CDISC Core value",choices=NULL,selectize=T,multiple = T),
                               #selectInput("IN2002", "CDISC Variable", choices = NULL, selected = NULL, selectize=T),
                               tags$h4(strong(p("Please check 'Summary' and 'Results' tabs for output."))),
                               br(),
                               tags$h2(strong(p("================   OR ==============",style = "font-family: courier, serif;color:Black;font-size:22px;"))),
                               br(),
                               searchInput(inputId = "IN2003", label = "Keywords [Please check 'Keyword Results' tab for output]",placeholder = "   ",btnSearch = icon("search"),btnReset = icon("remove"),width = "500px"),
                               br(),
                               br(),
                               tags$div(img(src = "002.Background.gif", width = "300px", height = "200px"),img(src = "logo.png", width = "200px", height = "200px"),br(),br(),
                                        img(src = "001.MQ.jpg", width = "450px", height = "300px"))),
                             mainPanel(tabsetPanel(
                               tabPanel("Summary", br(),span(textOutput("TAB.B2101"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),
                                        span(textOutput("TAB.B2102"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),span(textOutput("TAB.B2103"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),span(textOutput("TAB.B2104"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),
                                        span(textOutput("TAB.B2105"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),span(textOutput("TAB.B2106"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),span(textOutput("TAB.B2107"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),span(textOutput("TAB.B2108"), style="font-family: courier, serif; color:Black;font-size:30px;"),br(),br(),br()),    
                               tabPanel("Results", br(),dataTableOutput("TAB.B2201",width = "100%", height = "auto")),
                               tabPanel("Keyword Results",br(),dataTableOutput("TAB.Z2101",width = "100%", height = "auto"))
                             )))),
                  
                  #============= Forth TAB - Feed back ====================#  
                  
                  tabPanel("Feedback", fluid= T, icon=icon("fas fa-comment-dots"),
                           #tags$head(includeHTML("Webanalytics.html")),
                           tags$style("body{background-color:#D9D9D9; font-size:22px; font-family: courier,serif;font-weight: 1000;color:Dark cyan;}"),
                           tags$style(".well{background-image: url(001.Background.jpg); font-size:22px; font-family: courier, bold, serif;font-weight: 1000;color:Dark cyan;}"), 
                           titlePanel(tags$h2(strong("HandyCT v3.0",style = "font-family: courier, font-size:40px;serif;color:Dark cyan;")),windowTitle = "HandyCT-IG"),
                              tags$iframe(id = "googleform",
                                          src="https://docs.google.com/forms/d/e/1FAIpQLSfLNwxdv8kxZ4fDdDG7ouJTfovSRBEXoQIX14uUy0UQ8EAoHA/viewform?embedded=true",
                                          width = "100%",
                                          height = 2130,
                                          scrolling="no" ,
                                          frameborder = 0,
                                          marginheight = 0))
    
)))


                     



