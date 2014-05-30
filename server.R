palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
u <- "https://raw.githubusercontent.com/Recca2012/descritivas/master/descritivias.R"
require(RCurl)
script <- getURL(u, ssl.verifypeer = FALSE)
eval(parse(text = script))
load("data/dados.RData",envir=.GlobalEnv)
shinyServer(function(input, output, session) {

  # Combine the selected variables into a new data frame
  dadorate <- reactive({
    Rate3[,c("State",input$cancer)]
    
  })
  dadoquan <- reactive({
    Quantidade3[,c("State",input$cancer)]
    
  })
  dadosmr <- reactive({
    SMR[,c("State",input$cancer)]
    
  })
  shape2<-reactive({shape})
  output$plot1 <- renderPlot({
    plotar.boxplot(dados=dadorate(),tipo="Rate")
  })
  output$plot2<-renderPlot({
    plotar.boxplot(dados=dadoquan(),tipo="Quantidade")
    
  })
  output$plot3<-renderPlot({
    plotar.boxplot(dados=dadosmr(),tipo="SMR")
    
  })
  
})