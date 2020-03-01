
## 데이터 설명 

# X 데이터


# y 데이터

# 00 ~ 17 : 센서 측정 온도


# 아래 변수 3개에 대하여선 0으로 동일한 값이 나옴
unique(train$X14)
unique(train$X16)
unique(train$X19)

dim(train)

plot_func = function(x1, x2, x3, x4, x5, type, title) {
  if(type == 1){
    p1 = ggplot(train, aes(x = x1)) + geom_histogram(color="darkblue", fill="lightblue")
    p2 = ggplot(train, aes(x = x2)) + geom_histogram(color="darkblue", fill="lightblue")
    p3 = ggplot(train, aes(x = x3)) + geom_histogram(color="darkblue", fill="lightblue")
    p4 = ggplot(train, aes(x = x4)) + geom_histogram(color="darkblue", fill="lightblue")
    p5 = ggplot(train, aes(x = x5)) + geom_histogram(color="darkblue", fill="lightblue")
    
    (p1 + p2 + p3 + p4 + p5) + plot_annotation(title = title,
                                               theme = theme(
                                                 plot.title = element_text(size = 20)
                                               ))
  }
  else if(type == 2) {
    p1 = ggplot(data =train, aes(x = id, y = x1)) + geom_line(color = "skyblue") 
    p2 = ggplot(data =train, aes(x = id, y = x2)) + geom_line(color = "skyblue")
    p3 = ggplot(data =train, aes(x = id, y = x3)) + geom_line(color = "skyblue")
    p4 = ggplot(data =train, aes(x = id, y = x4)) + geom_line(color = "skyblue")
    p5 = ggplot(data =train, aes(x = id, y = x5)) + geom_line(color = "skyblue")
    
    (p1 + p2 + p3 + p4 + p5) + plot_annotation(title = title,
                                               theme = theme(
                                                 plot.title = element_text(size = 20)
                                               ))
  }
}


## 기온
plot_func(train$X00, train$X07, train$X28, train$X31, train$X32, 2, "기온")
## 현지기압
plot_func(train$X01, train$X06, train$X22, train$X27, train$X29, 2, "현지기압")
## 풍속
plot_func(train$X02, train$X03, train$X18, train$X24, train$X26, 2, "풍속")
## 일일 누적 강수량
plot_func(train$X04, train$X10, train$X21, train$X36, train$X39, 2, "일일 누적 강수량")
## 해면기압
plot_func(train$X05, train$X08, train$X09, train$X23, train$X33, 2, "해면기압")
## 일일 누적 일사량
plot_func(train$X11, train$X14, train$X16, train$X19, train$X34, 2, "일일 누적 일사량")
## 습도
plot_func(train$X12, train$X20, train$X30, train$X37, train$X38, 2, "습도")
## 풍향
plot_func(train$X13, train$X15, train$X17, train$X25, train$X35, 2, "풍향")


lm_func = function(y) {
  attach(train)
  full = lm(y ~ 
              X00 + X07 + X28 + X31 + X32 +
              X01 + X06 + X22 + X27 + X29 +
              X02 + X03 + X18 + X24 + X26 +
              X04 + X10 + X21 + X36 + X39 +
              X05 + X08 + X09 + X23 + X33 +
              X11 + X14 + X16 + X19 + X34 +
              X12 + X20 + X30 + X37 + X38 +
              X13 + X15 + X17 + X25 + X35)
  null = lm(y ~ 1 ,)
  Y_model = step(null, direction = "both", scope=list(upper=full))
  return(Y_model)
  detach(train)
}
lm0 = lm_func(Y00)
lm1 = lm_func(Y01)
lm2 = lm_func(Y02)
lm3 = lm_func(Y03)
lm4 = lm_func(Y04)
lm5 = lm_func(Y05)
lm6 = lm_func(Y06)
lm7 = lm_func(Y07)
lm8 = lm_func(Y08)
lm9 = lm_func(Y09)
lm10 = lm_func(Y10)
lm11 = lm_func(Y11)
lm12 = lm_func(Y12)
lm13 = lm_func(Y13)
lm14 = lm_func(Y14)
lm15 = lm_func(Y15)
lm16 = lm_func(Y16)
lm17 = lm_func(Y17)

a = summary(lm17);a$r.squared


summary(paste0("lm",1))
for(i in 0:17) {
  a = summary(paste0("lm",i))
  print(a$r.squared)
}







