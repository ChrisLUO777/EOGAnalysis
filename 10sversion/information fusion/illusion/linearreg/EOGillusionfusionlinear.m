close all; clear;
load("EOGillusiontrainset.mat");
load("EOGillusioncvset.mat");
load("EOGillusiontestset.mat");
X=EOGillusiontrainset(:,1:46);
y=EOGillusiontrainset(:,47);
m = size(X, 1);
Xval=EOGillusioncvset(:,1:46);
yval=EOGillusioncvset(:,47);
mval=size(Xval,1);
theta = zeros(46, 1);
Xtest=EOGillusiontestset(:,1:46);
ytest=EOGillusiontestset(:,47);
mtest=size(Xtest,1);
%linear regression

%learning curve
% lambda = 0;
% [error_train, error_val] = ...
%     learningCurve([ones(m, 1) X], y, ...
%                   [ones(size(Xval, 1), 1) Xval], yval, ...
%                   lambda);
% 
% plot(1:m, error_train, 1:m, error_val);
% title('Learning curve for linear regression')
% legend('Train', 'Cross Validation')
% xlabel('Number of training examples')
% ylabel('Error')
% axis([0 115 0 0.5])
% 
% fprintf('Program paused. Press enter to continue.\n');
% pause;

%lambda validation
close all;
[lambda_vec, error_train, error_val] = ...
    validationCurve(X, y, Xval, yval);
plot(lambda_vec, error_train, lambda_vec, error_val);
legend('Train', 'Cross Validation');
xlabel('lambda');
ylabel('Error');

fprintf('Program paused. Press enter to continue.\n');
pause;

%train linear regression
close all;
lambda = 10;
[theta] = trainLinearReg([ones(m, 1) X], y, lambda);

%EER
RN=sum(ytest);
RP=size(ytest,1)-RN;

threshold=-5:0.00001:5;
predicth=[ones(mtest, 1) Xtest]*theta;
TPR=zeros(1,size(threshold,2));
FPR=zeros(1,size(threshold,2));
count=1;
for k=threshold
    TP=0;
    FP=0;
    for i=1:size(ytest,1)
        if((predicth(i,1)<k) && (ytest(i,1)==0))%TP
                TP=TP+1;
        elseif((predicth(i,1)<k) && (ytest(i,1)==1))%FP
                FP=FP+1;
        end
    end
    TPR(1,count)=(TP/RP);
    FPR(1,count)=(FP/RN);
    count=count+1;
end

plot(FPR,TPR);
hold on;
plot(FPR,TPR,'o');
plot(0:0.01:1,1:-0.01:0,'r');
grid on;
xlabel('False Positive Rate');
ylabel('True Positive Rate');
axis([0 1 0 1]);

fprintf('Program paused. Press enter to continue.\n');
pause;

%F score
close all;

threshold=-5:0.00001:5;
predicth=[ones(mtest, 1) Xtest]*theta;
Fscore=zeros(1,size(threshold,2));
count=1;
for k=threshold
    TP=0;
    FP=0;
    FN=0;
    for i=1:size(ytest,1)
        if((predicth(i,1)<k) && (ytest(i,1)==0))%TP
                TP=TP+1;
        elseif((predicth(i,1)<k) && (ytest(i,1)==1))%FP
                FP=FP+1;
        elseif((predicth(i,1)>k) && (ytest(i,1)==0))%FN
                FN=FN+1;        
        end
    end
    precise=TP/(TP+FP);
    recall=TP/(TP+FN);
    Fscore(1,count)=2*precise*recall/(precise+recall);
    count=count+1;
end

plot(threshold,Fscore);
hold on;
plot(threshold,Fscore,'.');
grid on;
xlabel('threshold');
ylabel('fscore');
axis([0 1 0 1]);