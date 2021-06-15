# importing the neural net
library(neuralnet)
# reading the fleece dataset
fleece <- read_xlsx(file.choose())
# viewing the fleece dataset variables and respective values
str(fleece)
# normalizing the dataset with mean 0 and standard deviation 1
normalize <- function(x){
 return((x-min(x))/(max(x)-min(x)))
}
fleece_norm <- as.data.frame(lapply(fleece, normalize))
# viewing the normalized dataset
str(fleece_norm)
#dividing the dataset into train and test
fleece_train <- fleece_norm[1:3000,]
fleece_test <- fleece_norm[3001:4000,]
#declaring empty vectors to store the values of correlation coefficient and
hidden units respectively
co <- vector(,7)
i_values <- vector(,7)
#for loop to train the neural network by increasing the number of hidden
units simultaneously
for(i in 1:7)
{
 fleece_model <- neuralnet(AdultWool~., data=fleece_train,
hidden=i,stepmax=1e7)
 model_results <- compute(fleece_model, fleece_test[1:15])
 predicted_adultwool <- model_results$net.result
 co[i] <- as.vector(cor(predicted_adultwool, fleece_test$AdultWool))
 i_values[i]<-i
}
#plotting the graph of correlation coefficient vs the number of hidden 
