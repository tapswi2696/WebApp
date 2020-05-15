shinyUI(fluidPage(theme = shinytheme("cosmo"),
                  img(src = "logo.png", width = "250px", height = "250px"),
                  titlePanel(tags$h1(strong("Control Terminology Integrated Application Version (2.1)"))),
                  sidebarLayout(
                      sidebarPanel(
                          radioButtons("IN001", "Standard", choices = sort(unique(termData$CT.Type)),inline = F),
                          selectInput("IN002", "Please Select from the List CDISC Submission Value [e.g. LBTESTCD]", choices = NULL, selected = NULL, selectize=T),
                          tags$h2(strong(p("============= OR =============="))),
                          searchInput(inputId = "IN003", label = "Enter your text",placeholder = "   ",btnSearch = icon("search"),btnReset = icon("remove"),width = "450px"),
                      tags$div(img(src = "006.Background.gif", width = "200px", height = "200px"),br(),img(src = "003.Quote.jpg", width = "350px", height = "200px"))),
                      mainPanel(tabsetPanel(
                          tabPanel("Summary", br(),verbatimTextOutput("TAB.B101"), br(),verbatimTextOutput("TAB.B102"),br(),verbatimTextOutput("TAB.B103"),br(),verbatimTextOutput("TAB.B104"),br(),verbatimTextOutput("TAB.B105"),br(),verbatimTextOutput("TAB.B106")),    
                          tabPanel("outchek",br(),dataTableOutput("TAB.Z101")),
                          tabPanel("Results", br(),dataTableOutput("TAB.B201",width = "100%", height = "auto")),
                          tabPanel("Gratitude", br(),tags$h2(strong(p("In memories of My Loving Dad !"))),br(),tags$h2(p("Friends like you make life's challenging moments more bearable. I really appreciate my lovely wife, family and who has contributed through out process")),br(),br(),dataTableOutput("TAB.B301",width = "100%", height = "auto")),
                          tabPanel("Feedback", br(), tags$h3(strong(p("We would love to hear your thoughts or feedback on how we can improve your experience!"))),br(),br(),tags$h3("Please review or give your valuable feeback"),br(),tags$a(href = "https://forms.gle/WkiwRJvuWNgMw5mG7", "Click Here!"),br(),br(),strong(p("Thanks for choosing Application!")),br(),strong(p("Parth Shah"))),
                          tabPanel("Believe it or Not!")
                      )))))


