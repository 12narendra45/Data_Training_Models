data <- read.csv("airline_passenger_satisfaction.csv")
View(data)
data<-data[,-c(1,2,3,4,5,6)]
sum(is.na(data))
data[is.na(data)] <-0
sum(is.na(data))
set.seed(123)
index <- sample(1:nrow(data), 0.75 * nrow(data))
data$Satisfaction <- ifelse(data$Satisfaction == "Satisfied", 1, 0)
train_data <- data[index, ] 
test_data <- data[-index, ]  


# Naive Bayes Model
# -----------------
library(e1071)
Nmodel <- naiveBayes(Satisfaction ~ ., data = train_data)
Npred <- predict(Nmodel,test_data)
Naccuracy<-sum(Npred == test_data$Satisfaction) / length(Npred)
print(paste("Naive Bayes Accuracy: ", Naccuracy* 100))


# KNN
# -----------------
train_fea<-train_data[,-24]
test_fea<-test_data[,-24]
train_labe1<-train_data$Satisfaction
test_label<-test_data$Satisfaction
library(class)
Kmodel<-knn(train=train_fea,test=test_fea,cl=train_labe1,k=8)
Kaccuracy<-sum(Kmodel==test_label)/length(test_label)
print(paste("KNN Accuracy: ", Kaccuracy* 100))


# Decision Tree
# -----------------
library(rpart)
train_data$Satisfaction <- as.factor(train_data$Satisfaction)
test_data$Satisfaction <- as.factor(test_data$Satisfaction)
Dmodel<-rpart(Satisfaction ~ . ,data=train_data)
library("rpart.plot")
rpart.plot(Dmodel,col="red")
Dpredict<-predict(Dmodel,test_data,type="class")
Daccuracy<-sum(Dpredict==test_data$Satisfaction)/length(Dpredict)
print(paste("Decission tree Accuracy: ", Daccuracy* 100))


# Linear Regression
# -----------------
summary(data)
train_data$Satisfaction <- as.numeric(as.character(train_data$Satisfaction))
Mmodel <- lm(Satisfaction ~ . , data=train_data)
summary(Mmodel)$r.squared*100
Mpredict <- predict(Mmodel, test_data)
plot(train_data$Flight.Distance, train_data$Satisfaction, pch=8, xlab="Leg Room Service", ylab="Satisfaction")
abline(lm(Satisfaction ~ Flight.Distance, data = train_data), col="red")


# Support Vector Machine(SVM)
# -----------------
library("kernlab")
library(e1071)
svm_model <-ksvm(Satisfaction ~ .,data = train_data,kernel="vanilladot")
svm_predictions<-predict(svm_model,test_data)
svm_accuracy<-sum(svm_predictions==test_data$Satisfaction)/nrow(test_data)
cat("SVM Model Accuracy:",svm_accuracy*100,"%\n")
plot(svm_model,train_data,Flight.Distance~Leg.Room.Service)


# Comparison of Accuracy
# -----------------
library(ggplot2)
naive_bayes_accuracy <- Naccuracy * 100       
knn_accuracy <- Kaccuracy * 100              
decision_tree_accuracy <- Daccuracy * 100     
r_squared <- summary(Mmodel)$r.squared * 100  
SVM_accuracy<-0.77*100
accuracy_df <- data.frame(
  Model = c("Naive Bayes", "KNN", "Decision Tree", "Linear Regression (R-squared)","SVM"),
  Accuracy = c(naive_bayes_accuracy, knn_accuracy, decision_tree_accuracy, r_squared,SVM_accuracy)
)
ggplot(accuracy_df, aes(x = Model, y = Accuracy, fill = Model)) +
  geom_bar(stat = "identity") +
  labs(title = "Model Accuracy Comparison", y = "Accuracy (%)", x = "Model") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2") +
  geom_text(aes(label = round(Accuracy, 1)), vjust = -0.5)  # Add labels above bars
