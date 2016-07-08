library(shiny)
library(xlsx)
library(foreign)
library(ggplot2)
library(psych)

source("funciones.R")
bdu1 <<- basedatos("GEM APS Key Indicators 2001 - 2015.xls")
bdu3 <<- read.csv("GEM_2012_Brecha_Genero.csv")


shinyUI(fluidPage(
  titlePanel("Emprendimiento y Genero"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "pais",
                  label = "Elige un pais",
                  choices = nombre_paises() ),
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
                  max = 10,
                  value = 0,
                  step = 1,
                  format="$#,##0", locale="us", animate=TRUE
        
      ),
      sliderInput(inputId = "rangey",
                  label = "elige la escala del eje y en cada uno de los graficos",
                  min = 0,
                  max = 10,
                  value = 0,
                  step = 1,
                  format="$#,##0", locale="us", animate=TRUE
        
      )),

    mainPanel(  
      tabsetPanel(type = "tabs",
                  tabPanel("Descriptiva", plotOutput("distPlot"),
                           verbatimTextOutput("Resumen"),
                           plotOutput("distPlot2"),
                           verbatimTextOutput("Resumen2")),
                  tabPanel("Inferencial", verbatimTextOutput("Resumen3"))
                  )
    )
  )
)
)