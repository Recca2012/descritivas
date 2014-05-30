require(ggplot2)
require(maps)
require(grid)
require(reshape)
#load(file="~/Dropbox/Dissertacao/reunioes/2014-05-28/descritivas/dados.RData")
plotar.boxplot<-function(dados,tipo){
  banco.plotar<-dados
  names(banco.plotar)[2]<-"Cancer"
  banco.plotar$"Var"<-"Cancer"
  
  
  sizeLine=1
  sizePoint=3
  sizeLabX = 14
  sizeLabY = 14
  sizeTitle = 14
  sizeTitleLeg = 14
  sizeTextLeg = 12
  sizeText = 3
  sizeTickX = 14
  sizeTickY = 14
  
  colTickX = "black"
  colTickY = "black"
  colLabX = "black"
  colLabY = "black"
  colTitle = "black"
  colTitleLeg = "black"
  colTextLeg = "black"
  colText = "black"
  colBG = "snow"
  colGridX = "white"
  colGridY = "white"
  typeGridX = NULL #dashed dotted
  typeGridY = NULL #dashed dotted
  heightFig=680
  widthFig=680
  angleLabX=90
  angleLabY=90
  omitNA=TRUE 
  useColor= TRUE
  
  
  p <- ggplot(banco.plotar,aes(x=Var,y=Cancer),col="tomato") + xlab("Cancer") + ylab(tipo)
  plott<-p+geom_boxplot(outlier.colour="red")+
    theme_bw(base_size = 20) +
    theme(axis.title.x = element_text(size = 10, colour = colLabX), 
          #axis.text.x  = element_blank(),
          axis.title.y = element_text(size = 10, colour = colLabY), 
          axis.text.y  = element_text(angle = 0, size = 10, colour = colTickY),
          legend.text  = element_text(size = sizeTextLeg, colour = colTextLeg), 
          legend.title = element_text(size = sizeTitleLeg, colour = colTitleLeg),
          panel.background = element_rect(fill = "white"),
          panel.grid.major = element_line(colour = "white", linetype = typeGridX),
          panel.grid.minor = element_line(colour = "snow", linetype = typeGridY),
          text = element_text(size = sizeTitle, colour = colTitle),
          title =  element_text(size = 14, face = "bold"),
          legend.position = "none")
  
  
       print(plott)
}


# 
# SMR<-Rate3
# 
# 
# for(i in names(Rate3)[-c(1:2)]){
#   SMR[,i]<-NA
#   SMR[,i]<-Rate3[,i]/(sum(Quantidade[which(!is.na(Quantidade[,i])),i])/sum(Pop[which(!is.na(Quantidade[,i])),i]))
# }
# 
# 
# 
# 
# 
# save(Pop,Pop3,Quantidade,Quantidade3,Rate,Rate3,SMR,base,shape,file="~/Dropbox/Dissertacao/reunioes/2014-05-28/mapas/dados.RData")
# SMR$State<-NULL
# names(SMR)[1]<-"State"
