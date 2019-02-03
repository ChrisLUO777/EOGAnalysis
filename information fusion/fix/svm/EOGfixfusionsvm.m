close all; clear;
load("EOGfixtrainset.mat");
load("EOGfixcvset.mat");
load("EOGfixtestset.mat");
X=EOGfixtrainset(:,1:26);
y=EOGfixtrainset(:,27);
m = size(X, 1);
Xval=EOGfixcvset(:,1:26);
yval=EOGfixcvset(:,27);
mval=size(Xval,1);
Xtest=EOGfixtestset(:,1:26);
ytest=EOGfixtestset(:,27);
mtest=size(Xtest,1);

%svm
% Try different SVM Parameters here
[C, sigma] = dataset3Params(X, y, Xval, yval);

% Train the SVM
model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));

%EER
RP=0;
RN=0;
for j=1:size(ytest,1)
    if(ytest(j,1)==0)
        RP=RP+1;
    else
        RN=RN+1;
    end
end

threshold=-5:0.00001:5;
predicth=svmOutput(model, Xtest);
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
predicth=svmOutput(model, Xtest);
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