#setting the directory
setwd("D:/Documents/UNE/Trimester-4/STAT430 - Statistical Learning/ANN")
#importing the neural net
library(neuralnet)
#reading the fleece dataset
fleece <- read.csv("FleeceWeight.csv")
#viewing the fleece dataset variables and respective values
str(fleece)
#normalizing the dataset with mean 0 and standard deviation 1
normalize <- function(x){
 return((x-min(x))/(max(x)-min(x)))
}
fleece_norm <- as.data.frame(lapply(fleece, normalize))
amount = 0
#declaring empty vectors to store the values of correlation coefficient and
hidden units respectively
co <- vector(,6)
i_values <- vector(,6)
vec <- vector(,6)
#for loop to train the neural network by increasing the number of hidden
units simultaneously
for(i in 1:6)
{
 #dividing the dataset into train and test
 index <- (0.15+amount)*nrow(fleece_norm)
 train_ind <- sample(seq_len(nrow(fleece_norm)), size=index)
 fleece_train <- fleece_norm[train_ind,]
 fleece_test <- fleece_norm[-train_ind,]
 #training the neural netowrk over the train dataset
 fleece_model <- neuralnet(AdultWool~., data=fleece_train,
hidden=i,stepmax=1e7)
 #predicting the correlation coefficient of Adultwool
 model_results <- compute(fleece_model, fleece_test[1:15])
 predicted_adultwool <- model_results$net.result
 #storing the values of correlation coefficient and the training set
percentage
 co[i] <- as.vector(cor(predicted_adultwool, fleece_test$AdultWool))
 i_values[i]<-i
 amount=amount+0.15
 vec[i] = amount
}
#converting values to percentages
vec<-vec*100
#plotting the graph of correlation coefficient vs the percentage of training
set
plot(vec,co,xlab="Percentage of Training Set", ylab="Correlation Cofficient")