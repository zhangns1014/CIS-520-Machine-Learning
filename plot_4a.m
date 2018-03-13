train=cell(1,10);
train{1}=textread('Spambase/TrainSubsets/train-10%.txt');
train{2}=textread('Spambase/TrainSubsets/train-20%.txt');
train{3}=textread('Spambase/TrainSubsets/train-30%.txt');
train{4}=textread('Spambase/TrainSubsets/train-40%.txt');
train{5}=textread('Spambase/TrainSubsets/train-50%.txt');
train{6}=textread('Spambase/TrainSubsets/train-60%.txt');
train{7}=textread('Spambase/TrainSubsets/train-70%.txt');
train{8}=textread('Spambase/TrainSubsets/train-80%.txt');
train{9}=textread('Spambase/TrainSubsets/train-90%.txt');
train{10}=textread('Spambase/TrainSubsets/train-100%.txt');
test_data=textread('Spambase/TrainSubsets/test.txt');
train_err=zeros(1,10);
test_err=zeros(1,10);
plot_x=10:10:100;
w_show=[];
for i=1:1:10
    a=train{i};
    [w, b] = LogisticRegression(a(:,1:end-1),a(:,end));
    train_err(i)=classification_error(sign(a(:,1:end-1)*w+b),a(:,end));
    test_err(i)=classification_error(sign(test_data(:,1:end-1)*w+b),test_data(:,end));
    %w_show=[w_show,[w;b]-w1];
end
diff=sum(w_show,1)/58;
plot(plot_x,train_err,'*-b');
hold on
plot(plot_x,test_err,'*-r');
hold off
title('learning curve');
xlabel('r% of training sample');
ylabel('error');


