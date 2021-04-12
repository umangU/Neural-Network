#importing the neural net
library(neuralnet)
#reading the fleece dataset
fleece <- read_xlsx(file.choose())
#viewing the fleece dataset variables and respective values
str(fleece)
#normalizing the dataset with mean 0 and standard deviation 1
normalize <- function(x){
 return((x-min(x))/(max(x)-min(x)))
}
fleece_norm <- as.data.frame(lapply(fleece, normalize))
str(fleece_norm)
#setting the seed to get the same output
set.seed(430)
#dividing the dataset into train and test
fleece_train <- fleece_norm[1:3000,]
fleece_test <- fleece_norm[3001:4000,]
#training the neural netowrk over the train dataset
fleece_model <- neuralnet(AdultWool~., data=fleece_train, hidden=1)
#plotting the trained neural network
plot(fleece_model)
#predicting the correlation coefficient of Adultwool
model_results <- compute(fleece_model, fleece_test[1:15])
predicted_adultwool <- model_results$net.result
#Compute the variance of predicted_adultwool
#Compute the covariance of predicted_adultwool and fleece_test$Adultwool
cor(predicted_adultwool, fleece_test$AdultWool) 
