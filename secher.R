secher<-read.table("secher.txt",header=T)

model1<-lm(bwt~bpd, data=secher)
model2<-lm(bwt~ad, data=secher)

sum.model1<-summary(model1)
sum.model2<-summary(model2)

R2_1<-sum.model1$r.squared
R2_2<-sum.model2$r.squared

f1<-sum.model1$fstatistic
f2<-sum.model2$fstatistic

pvalue1<-pf(f1[1],f1[2],f1[3],lower.tail=F)
pvalue2<-pf(f2[1],f2[2],f2[3],lower.tail=F)

output<-sprintf("R2_1 = %f, pvalue1 = %f, R2_2 = %f, and pvalue2 = %f", R2_1,pvalue1, R2_2,pvalue2)
cat(output)

intercept1<-model1$coefficients[1]
slope1<-model1$coefficients[2]

intercept2<-model2$coefficients[1]
slope2<-model2$coefficients[2]

output<-sprintf("slope1=%f, intercept1=%f, slope2=%f, intercept2=%f",slope1, intercept1,slope2, intercept2)
cat(output)

png("graph1.png")
plot(bwt~bpd,data=secher)
abline(model1)
dev.off()
png("graph2.png")
plot(bwt~ad,data=secher)
abline(model2)
dev.off()

