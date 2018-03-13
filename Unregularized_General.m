function [two_error,w]=Unregularized_General(number)
load('Subsets.mat');
load('Data.mat');
train_data=subs{number};
x=[train_data(:,1:end-1),ones(size(train_data,1),1)];
y=train_data(:,end);
w=inv(x'*x)*x'*y;
train_error=mean_squared_error(x*w,y);
test_error=mean_squared_error([test(:,1:end-1),ones(size(test,1),1)]*w,test(:,end));
two_error=[train_error;test_error];
end
