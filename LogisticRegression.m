function [w,b] = LogisticRegression(traindata, trainlabels)
   x=[traindata,ones(size(traindata,1),1)];
   y=trainlabels;
   L=@(w_aug)(sum(log(1+exp(-y.*(x*w_aug)))));
   w_aug_solution=fminunc(L,[zeros(57,1);0]);
   w=w_aug_solution(1:end-1,1);
   b=w_aug_solution(end,1);
  %w1=glmfit(traindata,(y+ones(size(traindata,1),1))/2,'binomial', 'link', 'logit');
end
