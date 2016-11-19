#' Confusion Matrix Metrics
#'
#' takes in actual  and predicted value of a binary classifier to compute accuracy measures
#' @param a  Actual Value
#' @param b  Predicted Value
#' @return  Accuracy Metrics
#' @export

performanceMetrics <-function(target=NULL,predicted=NULL,threshold=0.5,k=10)
{
  if(is.null(target)|is.null(predicted))
  {
    return("target and predicted probabilities not provided")
  }
  #calculating threshold frequencies
  cMetrics=as.data.frame(table(target,predicted>threshold))
  TrueNegative=cMetrics[cMetrics$target==0&cMetrics$Var2==FALSE,"Freq"]
  TruePositive=cMetrics[cMetrics$target==1&cMetrics$Var2==TRUE,"Freq"]
  FalsePositive=cMetrics[cMetrics$target==0&cMetrics$Var2==TRUE,"Freq"]
  FalseNegative=cMetrics[cMetrics$target==1&cMetrics$Var2==FALSE,"Freq"]
  #vector of measures
  metrics=c(AIC=0 ,BIC=0, TPR=0 ,
            TNR=0,
            FPR=0,FNR=0,Precision=0,NPV=0,Accuracy=0,FMeasure=0,auc=0)
  #calculating measures
  metrics["TPR"]=TruePositive/(TruePositive+FalseNegative)
  metrics["TNR"]=TrueNegative/(TrueNegative+FalsePositive)
  metrics["FPR"]=FalsePositive/(TrueNegative+FalsePositive)
  metrics["FNR"]=FalseNegative/(TruePositive+FalseNegative)
  metrics["Precision"]=TruePositive/(TruePositive+FalsePositive)
  metrics["NPV"]=TrueNegative/(TrueNegative+FalseNegative)
  metrics["Accuracy"]=(TrueNegative+TruePositive)/(TruePositive+FalseNegative+TrueNegative+FalsePositive)
  metrics["FMeasure"]=2*TruePositive/(2*TruePositive+FalsePositive+FalseNegative)
  LL=sum(ifelse(target==1,log(predicted),log(1-predicted)))
  #assuming
  metrics["AIC"]=-2*LL+2*k
  #Bic -2logL+2*n/k
  metrics["BIC"]=-2*LL+2*k*log(length(predicted))
  #pairs to compute auc
  pairs=length(target[target==1])*length(target[target==0])
  metrics["auc"]=mean(sample(predicted[target==1],pairs,replace = TRUE)
                      >(sample(predicted[target==0],pairs,replace = TRUE)))
  return(round(metrics,2))
}
