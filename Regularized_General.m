function [T]=Regularized_General(lamda)
w=zeros(9,size(lamda,2));
train_error=zeros(1,size(lamda,2));
test_error=zeros(1,size(lamda,2));
validation_error=zeros(1,size(lamda,2));
load('Subsets.mat');
load('Data.mat');
load('CV_Data.mat');
train_data=subs{1};

for i=1:1:size(lamda,2)    
[test_error(i),train_error(i),w(:,i)]=Regularized_data(train_data,test,lamda(i));
sum=0;
   for j=1:1:5
      set=[1,2,3,4,5];
      validation_test=cv_data_10{j};
      set(j)=[];
      validation_train=[cv_data_10{set(1)};cv_data_10{set(2)};cv_data_10{set(3)};cv_data_10{set(4)};];
      validation_error_j=Regularized_data(validation_train,validation_test,lamda(i));
      sum=sum+validation_error_j;
   end
validation_error(i)=sum/5;
end
T=[train_error;test_error;validation_error;w];
end