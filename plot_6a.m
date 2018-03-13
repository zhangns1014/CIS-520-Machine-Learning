plot_x=10:10:100;
A=[];
for i=1:10
    A=[A;Regression(i)];
end
plot(plot_x',A(:,1),'*--r');
hold on
plot(plot_x',A(:,2),'o-g');
hold off
title('Learning Curve');
xlabel('training number');
ylabel('error');



