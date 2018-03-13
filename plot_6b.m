lamda=[0.1,1,10,100,500,1000];
T1=Regularized_General(lamda);
semilogx(lamda,T1(1,:),'*-b');%train error
hold on
semilogx(lamda,T1(2,:),'*-g');%test error
hold on
semilogx(lamda,T1(3,:),'*-k');%validation error
hold off
title('cross validation with 10% data');
xlabel('log(lamda)');
ylabel('error');

T2=Regularized_General2(lamda);
semilogx(lamda,T2(1,:),'*-b');%train error
hold on
semilogx(lamda,T2(2,:),'*-g');%test error
hold on
semilogx(lamda,T2(3,:),'*-k');%validation error
hold off
title('cross validation with 100% data');
xlabel('log(lamda)');
ylabel('error');