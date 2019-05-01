close all; clear;
load("EOGstreettrainset.mat");
load("EOGstreetcvset.mat");
load("EOGstreettestset.mat");
X=EOGstreettrainset(:,1:46);
y=EOGstreettrainset(:,47);
m = size(X, 1);
Xval=EOGstreetcvset(:,1:46);
yval=EOGstreetcvset(:,47);
mval=size(Xval,1);
theta = zeros(46, 1);
Xtest=EOGstreettestset(:,1:46);
ytest=EOGstreettestset(:,47);
mtest=size(Xtest,1);

%%
%train linear regreesion model
model=fitrlinear(X,y);
score = predict(model,Xtest);
%%
%EER
RN=sum(ytest);
RP=size(ytest,1)-RN;

threshold=-5:0.00001:5;
TPR=zeros(1,size(threshold,2));
FPR=zeros(1,size(threshold,2));
count=1;
for k=threshold
    TP=0;
    FP=0;
    for i=1:size(ytest,1)
        if((score(i,1)<k) && (ytest(i,1)==0))%TP
                TP=TP+1;
        elseif((score(i,1)<k) && (ytest(i,1)==1))%FP
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

%%
%F score
close all;

threshold=-5:0.00001:5;
Fscore=zeros(1,size(threshold,2));
count=1;
for k=threshold
    TP=0;
    FP=0;
    FN=0;
    for i=1:size(ytest,1)
        if((score(i,1)<k) && (ytest(i,1)==0))%TP
                TP=TP+1;
        elseif((score(i,1)<k) && (ytest(i,1)==1))%FP
                FP=FP+1;
        elseif((score(i,1)>k) && (ytest(i,1)==0))%FN
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