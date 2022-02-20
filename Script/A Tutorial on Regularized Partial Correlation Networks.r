# Note: In RStudio change all dev.new() calls to x11(). Also, some
# figures might look different depending on the computer used to
# compile these. This is because the Fruchterman-Reingold algorithm
# behaves chaotically and floating point errors might cause the layout
# to look very different. The general structure should be the same.

###################################################
### Load library and data
###################################################
library("qgraph")
data("big5")


###################################################
### Figure 1
###################################################
dev.new(width=3,height=3)
adj <- matrix(c(0,0,0,1,0,0,2,3,0),3,3)
l <- matrix(c(2,3,1,2,1,1),ncol=2)
qgraph(adj,esize=4,asize=0.25,layout=l,gray=TRUE)


###################################################
### Figure 2 (codes combined in one call)
###################################################
dev.new(width=12,height=8)
data("big5groups")
Q <- qgraph(cor(big5),groups=big5groups,minimum=0.25,borders=FALSE,vsize=2)


###################################################
### Figure 3
###################################################
dev.new(width=8,height=8)
qgraph(Q,layout="spring",legend=FALSE)


###################################################
### Figure 4 A
###################################################
dev.new(width=7,height=7)
qgraph(cor(big5),graph="default",groups=big5groups,minimum=0.25,borders=FALSE,vsize=1,cut=0.3,legend=FALSE,layout="spring")


###################################################
### Figure 4 B
###################################################
dev.new(width=7,height=7)
qgraph(cor(big5),graph="factorial",groups=big5groups,
       minimum=0.25,borders=FALSE,vsize=1,cut=0.3,
       legend=FALSE,layout="spring",
       layout.par=list(area=ncol(big5)^2.3,repulse.rad=ncol(big5)^2.8))


###################################################
### Unevaluated example code (qgraph.panel)
###################################################
## qgraph.panel(cor(big5),groups=big5groups,minimum=0.25,borders=FALSE,vsize=1,cut=0.3)


###################################################
### Unevaluated example code (significance graph)
###################################################
## qgraph(cor(big5),groups=big5groups,vsize=2,graph="sig",alpha=c(0.0001,0.001,0.01))


###################################################
### Figure 5 A
###################################################
dev.new(width=8,height=8)
qgraph.efa(big5,5,groups=big5groups,rotation="promax",minimum=0.2,cut=0.4, vsize=c(1,15),borders=FALSE,asize=0.07,esize=4,vTrans=200)


###################################################
### Figure 5 B
###################################################
dev.new(width=8,height=8)
qgraph.pca(big5,5,groups=big5groups,rotation="promax",minimum=0.2,cut=0.4, vsize=c(1,15),borders=FALSE,asize=0.07,esize=4,vTrans=200)


###################################################
### CFA example
###################################################
names(big5groups) <- strtrim(names(big5groups),1)
fit <- qgraph.cfa(cov(big5),N=nrow(big5),groups=big5groups,pkg="lavaan",opts=list(se="none"),fun=print)


###################################################
### Figure 6
###################################################
dev.new(width=10,height=10)
qgraph.lavaan(fit,onefile=FALSE,filename="lavaanmodel",panels=1,
  height=10,width=10,vsize.man=1,vsize.lat=6,edge.label.cex=0.5,
  titles=FALSE,include=8,groups=big5groups,filetype="")


###################################################
### Figure 7
###################################################
dev.new(width=20,height=10)
qgraph.lavaan(fit,filename="lavaancors",panels=2,filetype="",
  height=10,width=20,vsize.man=1,vsize.lat=6,edge.label.cex=0.5,
	titles=FALSE,include=11,groups=big5groups,minimum=0.2)

