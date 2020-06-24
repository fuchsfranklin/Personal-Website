library(shiny)
library(shinythemes)
library(shinycustomloader)
library(shinyAce)
library(sendmailR)


#UI
###################################################################
ui <- tagList(
  
       fluidPage(
          list(tags$head(HTML('<link rel="icon", href="MyIcon.png", 
                                   type="image/png" />'))),
          div(style="padding: 1px 0px; width: '100%'",
             titlePanel(
                title="", windowTitle="My Window Title"
          )
        )),
        navbarPage(theme = shinytheme("paper"),
                 
                 title=div("Franklin Fuchs"),
                 
                 
                 
                 
                 #Pages                 
                 ###################################################################                 
                 tabPanel(withMathJax(),
                          title = "About Me",
                          img(src="unr_logo.png", height = '50px', width = '50px',align="top"),
                          h4("Professional Bio"),
                          p("Currently, I am an honors student majoring in mathematics and minoring in big data at UNR. With Dr. Mihye Ahn as my mentor, I am a student researcher funded by the IDeA Network of Biomedical Research Excellence UROP Award. My current work is focused on traumatic brain injury classification. Specifically, I use both supervised machine learning and traditional statistical methods to predict the survival of traumatic brain injury patients according to National Trauma Data Bank data. The primary aim of my research is to deploy the best-performing model in a portable and self-contained format to be utilized in healthcare settings to assist professionals with TBI severity assessment and quantitatively informed decision making, especially in situations where patients do not have access to trained professionals. I am currently also an honors peer coach, where I help first year honors students gain experience networking with professors while individually mentoring them in their pursuits towards their academic goals."),
                          h4("My Interests"),   
                          p("In addition to mathematics and statistics, I really enjoy learning about biology, especially concerning problems in bioinformatics. Although study design is a relatively established field, I also find the statistical aspects of studies fascinating and could imagine myself pursuing a graduate degree where both epidemiological concepts and statistical theory are combined. I also quite like programming in relation to applied statistical learning and web-application development. Thus, I plan to go to graduate school for either computational mathematics or biostatistics. In my free-time I like working out, programming, and mindfulness meditation."),
                          h4("Website Info"),
                          p("I created this website as a personal project to improve my HTML and R Shiny programming skills. I recently expanded this website as a portfolio to present my current work and personal projects in a organized manner. Since I am continually working to improve this website, feel free to inform me if something does not work correctly."),
                                    
                 ), 
                 
 
                 
                 ################################################################### 
                 tabPanel(title = "My Work",
                          h4("A Quick Overview"),
                          p("The main aspects of my work can be summarized by outlining three intersecting areas."),
                          tags$hr(),
                          tags$ul(
                            tags$li(
                              h5("Traumatic Brain Injury Prediction"),
                              p("Traumatic Brain Injury (TBI) occurs when a sudden trauma to the head causes brain damage. Concerning public health, TBI is an issue that accounts for a small percentage of injury-related emergency department (ED) visits, but a large percentage of injury related deaths. TBI Mortality Prediction can provide a basis for informed medical decisions and trauma care where assessment by medical professionals is limited or inaccessible, such as for triage in Mass Casualty Incidents (MCI) or in pre-hospital settings. My research aims apply both supervised machine learning and traditional statisical methods to National Trauma Data Bank (NTDB) data and deploy the best performing model as a user-friendly web-application.")
                            ),
                            tags$hr(),
                            tags$li(
                              h5("Imbalanced Outcome Classification"),
                              p("Although there currently exist Logistic Regression (LR) based TBI prediction models, these do not account for the fact that the rates of pediatric patient non-survival is much lower than for older TBI patients, and so it follows that the number of observations for the outcome variable are unequally distributed such that there are many more non-cases (survivors) than cases (non-survivors). This imbalance in the outcome variable leads to an overestimation of the probability of the majority class, and more importantly, to an underestimation of the probability of the minority class for many models, which occurs due to the underlying model assumption of an approximately equally distributed outcome variable. In the context of healthcare, false positives can be costly, but false negatives can be life-threatening. Therefore, the methods I utilize include case-weighted models, subsampling techniques, and performance evaluation metrics that account for class imbalance.")
                            ),
                            tags$hr(),
                            tags$li(
                              h5("High Performance Computing"),
                              p("Working with large datasets and computationally intensive machine learning models leads to model training and hyperparameter tuning times that can range from days to weeks. Thus, I make use of parallelization and High Performance Computing (HPC) capabilities to minimize model fitting time. I run most of my models on the local HPC Clusters Pronghorn and Okapi. Specifically, I deploy models through containerization using both Singularity and Docker. Containerization, in relation to data analysis, can be beneficial, since dependencies such packages, software, and operating systems can be set up in a lightweight manner such that analyses are both reproducible and portable. Singularity is especially useful in my research, since Docker containers require administrator privileges, which is not a viable option for HPC clusters such as Pronghorn.")
                            )
                          )
                          
                          
                 ),
                 
                 ################################################################### 
                 tabPanel(title = "Personal Projects",
                          h4("Personal Projects and Web-Apps"),
                          tags$br(),
                          h5("Parallelized Artificial Neural Network Training for Big Data"),
                          tags$ul(
                            tags$li(
                              tags$b("Project Introduction"),
                              p("BLABLA.")
                            ),
                          ),
                          tags$br(),
                          h5("End-To-End Amazon Product Recommendation Engine"),
                          tags$ul(
                            tags$li(
                              tags$b("Project Introduction"),
                              p("BLABLA.")
                            ),
                          ),
                          tags$br(),
                          uiOutput("proj1"),
                          tags$ul(
                            tags$li(
                              tags$b("Project Introduction"),
                                    p("The first aim of this stochastic models and simulation project is to understand the metropolis-hastings algorithm and several markov-chain-monte-carlo diagnostic methods at a more intuitive and visual level through plots that are both animated and interactive. My second aim is to present my first aim in a cohesive and compect manner to those unfamiliar with MCMC and the R-Programming Language. It is important to mention that the time-dependent nature of a markov chain and the amount of visually appealing parameters are optimal for creating animated illustrations. The immediate next step I want to take for this project is adding another tab containing end-to-end analysis for a simple bayesian model which utilizes the Metropolis-Hastings Algorithm to bring the concepts of all other tabs together.")
                            )
                          ),
                          tags$br(),
                          h5("Comparing Regularization Techniques on Simulated Data"),
                          tags$ul(
                            tags$li(
                              tags$b("Project Introduction"),
                              p("The aims of this project are to simulate multivariate data from underlying linear models with varying degrees of correlation among predictors and then observing how effective different variable selection methods perform on each dataset by fitting a linear regression model with the selected variables. Thus, we first simulate 50 datasets for the first three underlying models from section 7 of the Paper 'Regression Shrinkage and Selection via the Lasso' by Tibshirani (1996). We then fit the models according several variable selection and shrinkage methods. Finally, we use mean and median mean square error to compare performances. The techniques being compared are Ordinary Least Squares (No Variable Selection), LASSO, Ridge, All possible Regression, Forward Selection, Backward Elimination, and Stepwise Selection. The immediate next step for this project is to add performance metrics such as AIC and BIC in addition to the mean and median MSE to better capture model performances. I also want to vectorize all loops and generally reduce redudant variable storage where possible.")
                            ),
                          )
                            
                           
                 ),
    
                 ###################################################################
                 tabPanel(title = "Contact Me",
                          h4("Contact Information"),
                          hr(),
                          tags$ul(
                            tags$li(p("GitHub: https://github.com/fuchsfranklin")),
                            tags$li(p("Email: fuchs.franklin@gmail.com"))
                          ),
                          tags$br(),
                          h4("Or Fill Out a Form"),
                          hr(),
                          #
                          fluidRow(
                            shinydashboard::box(
                                 splitLayout(
                                   textInput(inputId="subject",label= tags$b("Your Name")),
                                   textInput(inputId="from", label=tags$b("Your Email"))
                                ),
                                width = 7
                             )
                           ),
                          
                          
                          fluidRow(
                          column(7,aceEditor(outputId="message", value="Your message here",fontSize = 14, height = "100px"))
                          ),
                          
                          actionButton("send", "Send Email")
                          
                 )
                 ,fluid=FALSE
  )
)


#Server
###################################################################
server <- function(input, output) {
  
  # MCMC project Reference
  url <- a(h5("An Intuitive Introduction to Metropolis-Hastings Algorithm Sampling and Diagnostics",style = "color:blue"), href="https://franklinfuchs.shinyapps.io/MCMC_Visual_Project/")
  output$proj1 <- renderUI({
    tagList("", url)
  })
  
  # Contact Information Setup
  
  #MAKE THIS REACTIVE
  observe({
    if(is.null(input$send) || input$send==0) return(NULL)
    from <- isolate(input$from)
    to <- isolate("fuchs.franklin@gmail.com")
    subject <- isolate(input$subject)
    msg <- isolate(input$message)
    sendmail(from, to, subject, msg)
  })
}


#App Construction
###################################################################
shinyApp(server = server, ui = ui)