function [w, b] = LogisticRegressionL2(traindata, trainlabels, lambda)
    % leave the bias unregularized
   x=[traindata,ones(size(traindata,1),1)];
   y=trainlabels;
   L=@(w_aug)(sum(log(1+exp(-y.*(x*w_aug)))-lambda*w_aug(1:end-1)'*w_aug(1:end-1)));
   w_aug_solution=fminunc(L,[zeros(57,1);0]);
   w=w_aug_solution(1:end-1,1);
   b=w_aug_solution(end,1);
end
