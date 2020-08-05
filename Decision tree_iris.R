library(party)

str(iris)
head(iris)

set.seed(1234) #To get reproducible result
ind <- sample(2,nrow(iris), replace=TRUE, prob=c(0.7,0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
iris_ctree <- ctree(myFormula, data=trainData)

#check the prediction on trainData 
#train_predict <- predict(iris_ctree)
train_predict <- predict(iris_ctree,trainData,type="response")

#create confusion matrix and misclassification errors
table(train_predict,trainData$Species)
mean(train_predict != trainData$Species) * 100 #3.57

#Above misclassification error rate is 3.6% and other way to say is Model is 96.4% accurate.


#validating the model on test set
test_predict <- predict(iris_ctree, newdata= testData,type="response")
table(test_predict, testData$Species)
mean(test_predict != testData$Species) * 100 #5.26


print(iris_ctree)
plot(iris_ctree)
plot(iris_ctree, type="simple")

