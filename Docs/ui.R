shinyUI(fluidPage(theme = shinytheme("cosmo"),
                  #tags$head(includeHTML(("Webanalytics.html"))),
                  tags$style("body{background-color:#D9D9D9; font-size:20px; font-family: courier, serif;font-weight: 1000;color:Black;}"),
                  tags$style(".well{background-color:#f55a42; font-size:20px; font-family: courier, serif;font-weight: 1000;color:White;}"), 
                  titlePanel(tags$h1(strong("Control Terminology Integrated Application Version (2.1)")),windowTitle = "HandyCT"),
                  sidebarLayout(
                      sidebarPanel(
                        tags$h4(strong(p("Step 1: Please select a CDISC Standard.",style = "font-family: courier, serif;color:Black;"))),
                         awesomeRadio("IN001", "CDISC Standards",choices = sort(unique(termData$CT.Type)),inline = F),
                         br(),
                         tags$h4(strong(p("Step 2: Please enter either keywords or select CDISC Submission Value.",style = "font-family: courier, serif;color:Black;"))),                       
                          searchInput(inputId = "IN003", label = "Keywords [Please check 'Keyword Results' tab for output]",placeholder = "   ",btnSearch = icon("search"),btnReset = icon("remove"),width = "450px"),
                          br(),
                          tags$h2(strong(p("========  OR =========",style = "font-family: courier, serif;color:Black;"))),br(),
                          selectInput("IN002", "CDISC Submission Value", choices = NULL, selected = NULL, selectize=T),
                          tags$h4(strong(p("Please check 'Summary' and 'Results' tabs for output."))),
                          br(),
                             tags$div(img(src = "006.Background.gif", width = "200px", height = "200px"),img(src = "logo.png", width = "200px", height = "200px"),br(),br(),
                               img(src = "002.Quote.jpg", width = "450px", height = "300px"))),
                      mainPanel(tabsetPanel(
                          tabPanel("About Us",tags$h1(p(strong("____ Our Story ______"))),br(),p("We believe that everyone should have easy access to control terminology for CDISC. Our goal is to overcome any technical barriers that can prevent individuals working in clinical teams from achieving their work efficiently. Innovation and simplicity is our primary objective.We're excited to help you and make you a part of our journey!")), 
                          tabPanel("Keyword Results",br(),dataTableOutput("TAB.Z101")),
                          tabPanel("Summary", br(),verbatimTextOutput("TAB.B101"),br(),verbatimTextOutput("TAB.B102"),br(),verbatimTextOutput("TAB.B103"),br(),verbatimTextOutput("TAB.B104"),br(),verbatimTextOutput("TAB.B105"),br(),verbatimTextOutput("TAB.B106")),    
                          tabPanel("Results", br(),dataTableOutput("TAB.B201",width = "100%", height = "auto")),
                          tabPanel("Gratitude", br(),tags$h2(strong(p("In memory of My Loving Dad."))),br(),tags$h2(strong(p("Friends make life's challenging moments a piece of cake. I heartily appreciate my lovely wife and family who have stayed patient with me throughout this process."))),br(),br(),dataTableOutput("TAB.B301",width = "100%", height = "auto")),
                          tabPanel("Feedback", br(), tags$h3(strong(p("We would love to hear your thoughts and feedback on how we can improve your experience!"))),br(),br(),tags$h3(strong(p("Please provide us your valuable feedback!"))),br(),tags$a(href = "https://forms.gle/WkiwRJvuWNgMw5mG7", "Click Here!"),br(),br(),tags$h3(strong(p("Thanks for choosing this application!"))),br(),strong(p("Parth Shah"))),
                          tabPanel("Believe it or Not!",br(),tags$h3(p(strong("Control Terminology Percentages"))),br(),plotlyOutput("TAB.X101", height = "auto",width = "auto"),br())
                      )))))
                     



