
library(shiny)
library(xlsx)
library(foreign)
library(ggplot2)
library(psych)

source("funciones.R")
bdu1 <<- basedatos("GEM APS Key Indicators 2001 - 2015.xls")
bdu3 <<- read.csv("base_datos_sin_NA.csv")
bdu3 <<-bdu3[,-1]

shinyUI(fluidPage(
  titlePanel("Emprendimiento y Genero"),
  tabsetPanel(type = "tabs",
              tabPanel("Grafica brecha de genero en la TEA",
                       sidebarLayout(sidebarPanel(selectInput(inputId = "pais",
                                                              label = "Elige un pais",
                                                              choices = nombre_paises()),
                                                  sliderInput(inputId = "tamlinea",
                                                              label = "Grosor linea en cada uno de los graficos",
                                                              min = 0,
                                                              max = 10,
                                                              value = 0,
                                                              step = 1,
                                                              format="$#,##0", locale="us", animate=TRUE),
                                                  sliderInput(inputId = "rangex",
                                                              label = "Elige la escala del eje x en cada uno de los graficos",
                                                              min = 0,
                                                              max = 100,
                                                              value = 0,
                                                              step = 0.01,
                                                              format="$#,##0", locale="us", animate=TRUE),
                                                  sliderInput(inputId = "rangey",
                                                              label = "elige la escala del eje y en cada uno de los graficos",
                                                              min = 0,
                                                              max = 100,
                                                              value = 0,
                                                              step = 0.01,
                                                              format="$#,##0", locale="us", animate=TRUE)
                       ),
                       mainPanel(plotOutput("distPlot")))
              ),
              tabPanel("Grafica disparidad de genero en la TEA",
                       sidebarLayout(sidebarPanel(selectInput(inputId = "pais2",
                                                              label = "Elige un pais",
                                                              choices = nombre_paises()),
                                                  sliderInput(inputId = "tamlinea2",
                                                              label = "Grosor linea en cada uno de los graficos",
                                                              min = 0,
                                                              max = 10,
                                                              value = 0,
                                                              step = 1,
                                                              format="$#,##0", locale="us", animate=TRUE),
                                                  sliderInput(inputId = "rangex2",
                                                              label = "Elige la escala del eje x en cada uno de los graficos",
                                                              min = 0,
                                                              max = 10,
                                                              value = 0,
                                                              step = 0.001,
                                                              format="$#,##0", locale="us", animate=TRUE),
                                                  sliderInput(inputId = "rangey2",
                                                              label = "elige la escala del eje y en cada uno de los graficos",
                                                              min = 0,
                                                              max = 10,
                                                              value = 0,
                                                              step = 0.001,
                                                              format="$#,##0", locale="us", animate=TRUE)),
                                     mainPanel(plotOutput("disparidad"))) 
              ),
              tabPanel("Modelos de regresion logistica",
                       sidebarLayout(sidebarPanel(width=2,
                                                  selectInput(inputId = "pais3",
                                                              label = "Elige un pais",
                                                              choices = nombre_paises() ),
                                                  selectInput("dependent", "Dependent Variable:", names(bdu3)[1:5]),
                                                  checkboxInput("interaccion",
                                                                label = "Interaccion con la variable genero",
                                                                value = FALSE),
                                                  uiOutput("independent")),
                                     mainPanel(verbatimTextOutput("Resumen3"))) 
              ),
              tabPanel("Graficos multivariados",
                       plotOutput("grafico_multivariado"),
                       
                       hr(),
                       
                       fluidRow(
                         column(3,
                                h4("Diamonds Explorer"),
                                selectInput(inputId = "pais4",
                                            label = "Elige un pais",
                                            choices = nombre_paises())),
                         column(4, offset = 1,
                                selectInput("dependent2", "Dependent Variable:", names(bdu3)[1:5]),
                                uiOutput("independent2")),
                         column(4,
                                sliderInput("col","Elige el numero de columnas para tu grafico",
                                            min = 1,max = 20,
                                            value = 2)))
              )
  )
  
)
)


