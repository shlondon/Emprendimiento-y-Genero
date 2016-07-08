

shinyServer(function(input, output) {
  
 output$distPlot <- renderPlot({
    bd_x_pais(nacion = input$pais, lin = input$tamlinea, 
              ejx = input$rangex, ejy = input$rangey)
  })
 
 output$Resumen <- renderPrint({
   Est_x_genero(input$pais)
 })
 
 output$distPlot2 <- renderPlot({
   disparidad(nacion = input$pais, lin = input$tamlinea, 
              ejx = input$rangex, ejy = input$rangey)
 })
 
 output$Resumen2 <- renderPrint({
   Est_disp(input$pais)
 })
 
 output$Resumen3 <- renderPrint({
   model1(input$pais)
 })
 

})