###################################################################
# Libraries
###################################################################
library(shiny)
library(shinythemes)
library(shinycustomloader)
library(shinyAce)


###################################################################
# UI
###################################################################
ui <- tagList(
       fluidPage(
          list(tags$head(HTML('<link rel="icon", href="MyIcon.png", 
                                   type="image/png" />'))),
          div(style="padding: 1px 0px; width: '100%'",
             titlePanel(
                title="", windowTitle="My Window Title"
          )
        )
      ),
      
      navbarPage(theme = shinytheme("paper"),title=div("Franklin Fuchs"),
            
###################################################################
# About Me Page
###################################################################                
                 tabPanel(withMathJax(),
                          title = "About Me",
                          fluidRow(
                            column(1,img(src="unr_logo.png", height = '50px', width = '50px',align="top")),
                            column(1,img(src="JHU.png", height = '50px', width = '50px',align="top")),
                            column(1,img(src="Pfizer.png", height = '50px', width = '100px',align="top"))
                          ),
                          
                          h4("Professional Bio"),
                          p("Currently, I am an honors student in mathematics and statistics with a minor in big data at UNR. With my advisor Dr. Mihye Ahn, I am currently completing my honors thesis work on predicting imbalanced pediatric patient traumatic brain injury mortality using both supervised machine learning and regression-based methods. Together with Dr. Daniel Joyce, I am also currently working on building, programming, and calibrating a low-cost wearable for spectral distribution classification and circadian rhythm measurement with the Honors Undergraduate Research Award (HURA) funding I have received. Additionally, I am an honors peer coach, where I individually mentor students in their pursuits towards their academic goals. This summer, I will be a software development intern at the Pfizer Simulation and Modeling Science (SMS) group. Next fall, I will attend Johns Hopkins University for an ScM in Biostatistics."),
                          
                          tags$br(),
                          
                          h4("My Interests"),   
                          p("The areas that I am most interested in and have the most experience with are binary classification, dimensionality reduction, and predictive modeling. In addition to mathematics and statistics, I am especially interested in immunology and bioinformatics. Programming in relation to high-performance computing and web application development are other areas I find particularly engaging. In my free time, I like to code, I work out, and I practice mindfulness meditation."),
                          
                          tags$br(),
                          
                          h4("Website Info"),
                          p("I created this website as a personal project to improve my R Shiny and HTML programming skills, and I recently expanded this website as a portfolio to present my current work and personal projects in an organized manner. Since I am continually working to improve this website, feel free to inform me if something does not work correctly."),
                                    
                 ), 
                 
###################################################################
# My Work Page
###################################################################  
                 tabPanel(title = "Current Work",
                          h4("Overview"),
                          
                          p("The main aspects of my current work can be summarized by outlining the following three intersecting areas."),
                          tags$hr(),
                          
                          tags$ul(
                            tags$li(
                              h5("Traumatic Brain Injury Survival Prediction"),
                              p("Traumatic Brain Injury (TBI) occurs when a sudden trauma to the head causes brain damage. Concerning public health, TBI is an issue that accounts for a small percentage of injury-related emergency department (ED) visits, but a large percentage of injury related deaths. TBI Mortality Prediction can provide a basis for informed medical decisions and trauma care where assessment by medical professionals is limited or inaccessible, such as for triage in Mass Casualty Incidents (MCI) or in pre-hospital settings. My work aims to apply both supervised machine learning and traditional statisical methods to National Trauma Data Bank (NTDB) data and deploy the best performing model as a user-friendly web-application.")
                            ),
                            tags$hr(),
                            tags$li(
                              h5("Imbalanced Outcome Classification"),
                              p("Although there currently exist Logistic Regression (LR) based TBI prediction models, these do not account for the fact that the rates of pediatric patient non-survival is much lower than for older TBI patients, and so it follows that the number of observations for the outcome variable are unequally distributed such that there are many more non-cases (survivors) than cases (non-survivors). This imbalance in the outcome variable leads to an overestimation of the probability of the majority class, and more importantly, to an underestimation of the probability of the minority class. In the context of healthcare, false positives can be costly, but false negatives can be life-threatening, depending on the purpose of the utilized model. Therefore, the methods I utilize include case-weighted models, subsampling techniques, and robust performance evaluation metrics.")
                            ),
                            tags$hr(),
                            tags$li(
                              h5("High-Performance Computing"),
                              p("Working with large amounts of obervations and computationally intensive machine learning models leads to model training and hyperparameter tuning times that can range from days to weeks. Thus, I make use of parallelization and High-Performance-Computing (HPC) capabilities to minimize model fitting times. I run most of my models on the local UNR HPC Clusters Pronghorn and Okapi. Specifically, I deploy models through containerization using both Singularity and Docker. Containerization, in relation to data analysis, can be beneficial, since dependencies such packages, software, and operating systems can be set up in a lightweight manner such that analyses are both reproducible and portable. Singularity is especially useful in my work, since Docker containers require administrator privileges, which is not a viable option for HPC clusters such as Pronghorn.")
                            )
                          )
                 ),
                 
###################################################################
# Personal Projects Page
################################################################### 
                 tabPanel(title = "Projects",
                          
                          h4("Personal Projects and Web-Apps"),
                          tags$br(),
                          
                          uiOutput("proj1"),
                          tags$ul(
                            tags$li(
                              tags$b("(R-Based) Project Introduction"),
                              p("The first aim of this stochastic models and simulation project is to understand the metropolis-hastings algorithm and several markov-chain-monte-carlo diagnostic methods at a more intuitive and visual level through plots that are both animated and interactive. My second aim is to present my first aim in a cohesive and compact manner to those unfamiliar with MCMC and the R-Programming Language. It is important to mention that the time-dependent nature of a markov chain and the amount of visually appealing parameters are optimal for creating animated illustrations. The next step I will take for this project is to add a tab that brings all other concepts together in one cohesive analysis.")
                            )
                          ),
                          tags$br(),
                          
                          uiOutput("proj2"),
                          tags$ul(
                            tags$li(
                              tags$b("(R-Based) Project Introduction"),
                              p("The aims of this project are to simulate multivariate data from three underlying linear models with varying degrees of correlation among predictors and then observing how effective different variable selection methods perform on each dataset by fitting a linear regression model with the selected variables. Thus, we first simulate 50 datasets for every underlying model from section 7 of the Paper \"Regression Shrinkage and Selection via the Lasso\" by Tibshirani (1996). We then fit the models according several variable selection and shrinkage methods and consider Akaike Information Criterion (AIC), Bayesian Information Criterion (BIC), and Adjusted R-Squared Value as performance metrics. My next goal is to vectorize all for loops and generally reduce redundant variable storage where possible.")
                            ),
                          ),
                          tags$br(),
                          
                          uiOutput("proj3"),
                          tags$ul(
                            tags$li(
                              tags$b("(R-Based) Project Introduction"),
                              p("This pediatric TBI prediction web-application is part of my honors thesis on imbalanced outcome pediatric patient mortality classification, where the best-performing C5.0 decision tree classifier trained on Synthetic Minority Over-sampling TEchnique (SMOTE) subsampled data is the predictive model implemented here. Potential applications of such a web-application, as recommended to us by clinicians, could be when either diagnosis by a clinician is not possible or as an indirect clinicians aid to give an approximate survival estimate for parents or guardians. Simplicity, speed, and portability were the main priorities considered when developing the application.")
                            ),
                          ),
                          tags$br(),
                          
                          
                          
                          h5("Parallelized Artificial Neural Network Fitting and Tuning to Reduce Total Training Time"),
                          tags$ul(
                            tags$li(
                              tags$b("(R-Based) Project Introduction"),
                              p("Work in Progress.")
                            ),
                          ),
                          tags$br(),
                          
                          h5("Interactive Product Recommendation Engine Dashboard"),
                          tags$ul(
                            tags$li(
                              tags$b("(R-Based) Project Introduction"),
                              p("Work in Progress.")
                            ),
                          ),
                          tags$br(),
                          
                          h5("Web Mining and Task Automation Toolset"),
                          tags$ul(
                            tags$li(
                              tags$b("(Python-Based) Project Introduction"),
                              p("Work in Progress.")
                            ),
                          ),
                          tags$br()
                 ),

###################################################################
# Contact Me Page
################################################################### 
                 tabPanel(title = "Contact Me",
                          
                          h4("Contact Info"),
                          hr(),
                          
                          tags$ul(
                            tags$li(tags$h6(icon("github", lib = "font-awesome"),HTML('&nbsp;'),"GitHub: ", a("fuchsfranklin", href = "https://github.com/fuchsfranklin"))),
                            tags$li(tags$h6(icon("envelope", lib = "font-awesome"),HTML('&nbsp;'),"Email: fuchs.franklin@gmail.com")),
                          ),
                          hr(),
                          
                          fluidRow(
                            column(4,withLoader(imageOutput("plot4"),type="html",loader="loader6")),
                            column(4,withLoader(imageOutput("plot5"),type="html",loader="loader6")),
                            column(4,withLoader(imageOutput("plot6"),type="html",loader="loader6"))
                          ),
                          tags$br(),
                          tags$br(),
                          tags$p(tags$b("What are these Animations? "),"They are Metropolis Hastings Samples generated with multiple different initial values to illustrate the practical utility of Burn-In removal (for potential downsides of Burn-In removal and more such animations please see my MCMC/MH project).",style = "font-size:12px;"),
                          hr()
                 ),
                 fluid=FALSE
  )
)

###################################################################
# Server
###################################################################
server <- function(input, output) {
  
  # MCMC Project Hyperlink
  url <- a(h5("An Intuitive Introduction to Metropolis-Hastings Algorithm Sampling and Diagnostics",style = "color:blue"), href="https://franklinfuchs.shinyapps.io/MCMC_Visual_Project/")
  output$proj1 <- renderUI({
    tagList("", url)
  })
  
  # Regularization Project Hyperlink
  url1 <- a(h5("Comparing Regularization Techniques on Simulated Data",style = "color:blue"), href="https://rpubs.com/franklinfuchs/Regularization-Project")
  output$proj2 <- renderUI({
    tagList("", url1)
  })
  
  # TBI Prediction Project Hyperlink
  url2 <- a(h5("Traumatic Brain Injury (TBI) Mortality Prediction Web-Application",style = "color:blue"), href="https://franklinfuchs.shinyapps.io/Pediatric-TBI-Prediction-Application/")
  output$proj3 <- renderUI({
    tagList("", url2)
  })
  
  # MCMC gifs 
  plot_unreactive1 <-
    {
      list(src = "outfile7.gif",
           contentType = 'image/gif',
           width = 430,
           height = 425
      )}
  
  plot_unreactive2 <-
    {
      list(src = "outfile8.gif",
           contentType = 'image/gif',
           width = 430,
           height = 425
      )}
  
  plot_unreactive3 <-
    {
      list(src = "outfile9.gif",
           contentType = 'image/gif',
           width = 430,
           height = 425
      )}
  
  output$plot4 <- renderImage(plot_unreactive1,deleteFile = FALSE)
  output$plot5 <- renderImage(plot_unreactive2,deleteFile = FALSE)
  output$plot6 <- renderImage(plot_unreactive3,deleteFile = FALSE)
  
}

################################################################### 
#App Construction
###################################################################
shinyApp(server = server, ui = ui)