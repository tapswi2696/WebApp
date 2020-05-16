shinyUI(fluidPage(theme = shinytheme("cosmo"),
                  #tags$head(HTML()),
                  tags$style("body{background-color:#D9D9D9; font-size:20px; font-family: courier, serif;font-weight: 1000;color:Black;}"),
                  tags$style(".well{background-color:#0398fc; font-size:20px; font-family: courier, serif;font-weight: 1000;color:White;}"), 
                  titlePanel(tags$h1(strong("Control Terminology Integrated Application Version (2.1)")),windowTitle = "HandyCT"),
                  sidebarLayout(
                      sidebarPanel(
                        tags$h4(strong(p("Step 1: Please select a CDISC Standard.",style = "font-family: courier, serif;color:Black;"))),
                         awesomeRadio("IN001", "CDISC Standards",choices = sort(unique(termData$CT.Type)),inline = F),
                         br(),
                         tags$h4(strong(p("Step 2: Please enter either keywords or select CDISC Submission Value.",style = "font-family: courier, serif;color:Black;"))),                       
                          searchInput(inputId = "IN003", label = "Keywords [Please check 'Keyword Results' tab for output]",placeholder = "   ",btnSearch = icon("search"),btnReset = icon("remove"),width = "450px"),
                          br(),
                          #tags$h4(strong(p("Please check 'Keyword Results' tab for output."))),
                          tags$h2(strong(p("========  OR =========",style = "font-family: courier, serif;color:Black;"))),br(),
                          selectInput("IN002", "CDISC Submission Value", choices = NULL, selected = NULL, selectize=T),
                          #tags$h4(strong(p("Please check 'Summary' and 'Results' tabs for output."))),
                          br(),
                      tags$div(img(src = "006.Background.gif", width = "200px", height = "200px"),img(src = "logo.png", width = "200px", height = "200px"),br(),br(),tags$iframe(style="overflow:hidden;border:0;margin:0;padding:0;width:450px;height:210px;",                                                                                                                                          src="https://www.clocklink.com/html5embed.php?clock=048&timezone=USA_Albany&color=blue&size=450&Title=&Message=&Target=&From=2020,1,1,0,0,0&Color=blue https://www.clocklink.com/html5embed.php?clock=048&timezone=USA_Albany&color=blue&size=450&Title=&Message=&Target=&From=2020,1,1,0,0,0&Color=blue"),
                               img(src = "004.Quote.jpg", width = "450px", height = "300px"))),
                      mainPanel(tabsetPanel(
                          tabPanel("About Us",tags$h1(p(strong("____ Our Story ______"))),br(),p("We believe everyone can easily accesible control terminology for CDISC on finger tip. Innovation and simplicity makes us happy: our goal is to remove any technical barriers that can prevent to individial clinical team member from making their work efficiently. We're excited to help you on your journey!")), 
                          tabPanel("Keyword Results",br(),dataTableOutput("TAB.Z101")),
                          tabPanel("Summary", br(),verbatimTextOutput("TAB.B101"),br(),verbatimTextOutput("TAB.B102"),br(),verbatimTextOutput("TAB.B103"),br(),verbatimTextOutput("TAB.B104"),br(),verbatimTextOutput("TAB.B105"),br(),verbatimTextOutput("TAB.B106")),    
                          tabPanel("Results", br(),dataTableOutput("TAB.B201",width = "100%", height = "auto")),
                          tabPanel("Gratitude", br(),tags$h2(strong(p("In memories of My Loving Dad !"))),br(),tags$h2(strong(p("Friends like you make life's challenging moments more bearable.I really appreciate my lovely wife, family and who have contributed through out the process."))),br(),br(),dataTableOutput("TAB.B301",width = "100%", height = "auto")),
                          tabPanel("Feedback", br(), tags$h3(strong(p("We would love to hear your thoughts or feedback on how we can improve your experience!"))),br(),br(),tags$h3("Please review or give your valuable feeback"),br(),tags$a(href = "https://forms.gle/WkiwRJvuWNgMw5mG7", "Click Here!"),br(),br(),strong(p("Thanks for choosing Application!")),br(),strong(p("Parth Shah"))),
                          tabPanel("Believe it or Not!",tags$h3(p(strong("Coming Soon......"))),br())
                      )))))
                     



