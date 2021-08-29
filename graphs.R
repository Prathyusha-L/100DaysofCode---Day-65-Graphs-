#Bar graph - rectangular rep of set of values,(x and y)
c=c(10,20,30,40,50)
barplot(c)

#barplot 
barplot(c,xlab="X-axis",ylab="Y-axis",main="Bar Chart")

#assign colors
a=c(10,20,30,40,50)
b=c("Jan","Feb","Mar","Apr","May")
barplot(a,names.arg=b,xlab="Month",ylab="Sales in thousand",col="red",main="sale per month")

barplot(a,names.arg=b,xlab="Month",ylab="Sales in thousand",col="red",border="green",main="sale per month")

#grouped bar graph
barplot(a,horiz=TRUE,names.arg=b,xlab="Month",ylab="Sales in thousand",col="red",main="sale per month")

#stacked bar graph
#grouping
colors=c("green","yellow","red")
Month=c("Jan","Feb","Mar","Apr","May")
model=c("FORD","HYUNDAI","AUDI")
values=matrix(c(2,3,4,5,6,7,8,9,12,23,34,1,2,3,4),nrow=3,ncol=5,byrow=TRUE)
barplot(values,names.arg=Month,xlab="Month",ylab="Sales in thousand",col="red",main="sale per month")
legend("topright",model,cex=0.7,fill=colors)


#ggplot
library(ggplot2)

rec1=read.csv("C:\\Users\\Prathyu Lachireddy\\Desktop\\r language\\Sales.csv")
rec1
h=ggplot(data=rec1,aes(x=Manufacturer,y=Sales_in_thousands))+geom_bar(stat="Identity")
h
h+coord_flip()

#change the width of the bar
ggplot(data=rec1,aes(x=Manufacturer,y=Sales_in_thousands))+geom_bar(stat="Identity",width=0.5)

#change the colors
ggplot(data=rec1,aes(x=Manufacturer,y=Sales_in_thousands))+geom_bar(stat="Identity",color="blue",fill="yellow")


#stacked and grouped bar
ggplot(data=rec1,aes(x=Manufacturer,y=Sales_in_thousands,fill=Model))+geom_bar(stat="Identity",position=position_dodge())

ggplot(data=rec1,aes(x=Manufacturer,y=Sales_in_thousands,fill=Model))+geom_bar(stat="Identity")

ggplot(data=rec1,aes(x=Manufacturer,y=Sales_in_thousands,fill=Model))+geom_bar(stat="Identity",position=position_dodge())+geom_text(aes(label=Model),vjust=1,size=3)


#colors manually
print(rec1[10,])
rec1[10,]
p=ggplot(data=rec1,aes(x=Manufacturer,y=Sales_in_thousands,fill=Model))+geom_bar(stat="Identity",position=position_dodge())
p
p+scale_fill_brewer(palette="Dark2")
p+scale_fill_manual(values=c("green","yellow","black","pink","grey","orange","red","brown","blue","white"))






#line graph
#basic line plots with points(print only first 10)

ggplot(data=rec1,aes(x=Model,y=Sales_in_thousands,group=1))+geom_line()
ggplot(data=rec1,aes(x=Model,y=Sales_in_thousands,group=1))+geom_line()+geom_line()+geom_point()



ggplot(data=rec1,aes(x=Model,y=Sales_in_thousands,group=Manufacturer))+geom_line(aes(linetype=Manufacturer))
p=ggplot(data=rec1,aes(x=Model,y=Sales_in_thousands,group=Manufacturer))+geom_line(aes(linetype=Manufacturer,color=Manufacturer))
p

#p=p+scale_color_brewer(palette="Paried")
p+theme(legend.position="top")
p+theme(legend.position="none")

#color and pattern manually
ggplot(data=rec1,aes(x=Model,y=Sales_in_thousands,group=Manufacturer))+geom_line(aes(linetype=Manufacturer))+geom_point()+scale_linetype_manual(values=c("dotted","dashed","dotdash"))+scale_color_manual(values=c("red","green","blue"))
