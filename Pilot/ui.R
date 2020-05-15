shinyUI(fluidPage(theme = shinytheme("cosmo"),
                  img(src = "logo.jpg", width = "100px", height = "100px"),
                  titlePanel("Control Terminology Integrated Application Version (2.0)"),
                  sidebarLayout(
                      sidebarPanel(
                          radioButtons("IN001", "Standard", choices = sort(unique(termData$CT.Type)),inline = F),
                          selectInput("IN002", "Please Select from the List CDISC Submission Value [e.g. LBTESTCD]", choices = NULL, selected = NULL, selectize=T),
                          h3(strong(p("   OR    "))),
                          searchInput("IN003","Seach with Keywords",placeholder=" ",btnSearch=icon("Search"),btnReset=icon("remove"),width="100%"),
                          br(),tags$div(img(src = "006.Background.gif", width = "200px", height = "200px"),br(),img(src = "002.Quote.jpg", width = "350px", height = "200px"))),
                      
                      mainPanel(tabsetPanel(
                          tabPanel("Summary", br(),verbatimTextOutput("TAB.B101"), br(),verbatimTextOutput("TAB.B102"),br(),verbatimTextOutput("TAB.B103"),br(),verbatimTextOutput("TAB.B104"),br(),verbatimTextOutput("TAB.B105"),br(),verbatimTextOutput("TAB.B106")),    
                          tabPanel("Results", br(),dataTableOutput("TAB.B201",width = "100%", height = "auto")),
                          tabPanel("Gratitude", br(),h4(p("In memories of My Loving Dad !")),br(),h2(p("Friends like you make life's challenging moments more bearable. I really appreciate my lovely wife, family and who has contributed through out process")),br(),br(),dataTableOutput("TAB.B301",width = "100%", height = "auto")),
                          tabPanel("Feedback", br(), h4(p("We would love to hear your thoughts or feedback on how we can improve your experience!")),br(),br(),tags$p("Please review or give your valuable feeback"),br(),tags$a(href = "https://forms.gle/WkiwRJvuWNgMw5mG7", "Click Here!"),br(),br(),p("Thanks for choosing Application!"),br(),p("Parth Shah")),
                          tabPanel("Feedback 2"),
                          tabPanel("Believe it or Not!",br(),h5(p("Calculator")),br(),br(),tags$embed(src = "game.swf", width = "650x", height = "600x", autoplay = NA))
                      )))))


