library(vegan)
library(ggplot2)
pdf("nmds.pdf")
a<-read.table("trans_otu.txt",head=T,sep="	")
sol <- metaMDS(a)
MyMeta = data.frame( sites =c("Out101","Out102","Out103","On101","On102","On103","In101","In102","In103"),amt = c("Out10","Out10","Out10","On10","On10","On10","In10","In10","In10"),row.names = "sites")
NMDS = data.frame(MDS1 = sol$points[,1], MDS2 = sol$points[,2])
ggplot(data = NMDS, aes(MDS1, MDS2))+theme_bw()+theme(panel.grid=element_blank())+geom_point(aes(data = MyMeta, color = MyMeta$amt))+geom_text(label=c("Out101","Out102","Out103","On101","On102","On103","In101","In102","In103"),size=3,hjust=0.5, vjust=0)+theme(legend.key=element_rect(colour="white",fill="white",size=3,linetype="dashed"))+theme(legend.title=element_blank())
plot(sol$points, col = MyMeta$amt,pch=19)
ordiellipse(sol, MyMeta$amt, display = "sites", kind = "se", label = T ,conf =0.95)
dev.off()
