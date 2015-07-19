### Coursera R programming

### Week 1 Quizz

x <- list(2, "a", "b", TRUE)
x[[1]]

x <- c(3, 5, 1, 10, 12, 6)
x[x %in% 1:5] <- 0
x

quizz1_data<-read.csv(file = "D:/DataScience/Project/datasciencecoursera/R Programming/Quizz 1/hw1_data.csv")
head(quizz1_data)

quizz1_data[1:2,]

str(quizz1_data)

quizz1_data[152:153,]

quizz1_data[47,]


NAOzone<-is.na(quizz1_data$O)

str(NAOzone[NAOzone])

str(NAOzone)

mean(quizz1_data$Ozone[!NAOzone])

quizz1_data$Ozone[quizz1_data$Ozone>31]

Ozone31 <- quizz1_data$Ozone[!NAOzone & quizz1_data$Ozone>31]

Ozone31

quizz1_data[quizz1_data$Ozone[Ozone31]]

Ozone31<- subset(quizz1_data, Ozone>31)

Ozone31Temp90<- subset(quizz1_data, Ozone>31 & Temp>90)

mean(Ozone31Temp90$Solar.R)


Month6 <- subset(quizz1_data, Month =6)

mean(Month6$Temp)

Month6 <- subset(quizz1_data, Month==6)

Month6


Month5 <- subset(quizz1_data, Month==5)

max(Month5$Ozone[!is.na(Month5$Ozone)])


### Week 2 Quizz

cube <- function(x,n){
  x^n
}


x <- 1:10
if(x > 5) {
  x <- 0
}


f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}


x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}


