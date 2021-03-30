# About

Three R program implementing fast-forward neural network on **Wool** dataset.

## ANN.R

The program implements fast-forward neural network by splitting the **Wool** dataset and using 1 hidden unit.

![image](https://user-images.githubusercontent.com/72771903/112984959-48198800-91ab-11eb-950c-19f9b5300354.png)

## ANN-hidden.R

The program implements fast-forward neural network by looping the train and test dataset through 1-7 hidden units. The obtained graph of correlation coefficient of each network and the number of hidden units show the strength of the linear association between the predicted Adult wool and original Adult wool values increase as we add more neurons to the
neural network starting with a fairly strong relationship with correlation coefficient of 0.87 for one neuron in the hidden layer while reaching to correlation coefficient of 0.92 for 6 neurons in the hidden layer. Adding more neurons does not change the correlation coefficient and remains at 0.92 and might reduce the correlation coefficient on further adding the neurons. This is because the model overfits the data on the training set leading to bad propagation and increasing the rounding errors adding to the noise of the correlation coefficient. Thus, the model requires 6 neurons in the hidden layer to give an optimal performance. 

![image](https://user-images.githubusercontent.com/72771903/112985332-c544fd00-91ab-11eb-88fe-34a55c413b0c.png)

## ANN-train-test-hidden.R

The program implements fast-forward neural network by constantly changing the size of training and testing dataset and looping it through 1-7 hidden units. The obtained graph of the correlation coefficient of each network and the percentage of the training set shows  the strength of the linear association between the predicted Adult wool and original Adult wool values increase as we increase the size of training dataset for fitting the neural network starting with a fairly strong relationship with correlation coefficient of 0.86 for training set consisting 15% of the total dataset while reaching to correlation coefficient of 0.92 for training set size of 70% along with test dataset consisting 30% 
of the total dataset. Further increasing the training set size decreases the correlation coefficient because the model overfits the data on the training set leading to bad propagation and the model is not able to generalize for the new data (i.e. Test dataset). Thus, we can conclude that in order to get optimal model performance (high correlation coefficient or strong linear association) the dataset should be divided with 70:30 ratio for training and test dataset respectively.

![image](https://user-images.githubusercontent.com/72771903/112985683-371d4680-91ac-11eb-82d6-5a267a5fab59.png)
