close all; clear;
time="10s";
load("EOGstreettrainset"+time+".mat");
load("EOGstreettestset"+time+".mat");

d=EOGstreettrainset(:,1:46);
f=EOGstreettrainset(:,47);
K=46;
fea=mrmr_mid_d(d,f,K);
Fscore=0;

% for count=2:26
%     X=EOGstreettrainset(:,fea(1:count));
%     y=EOGstreettrainset(:,27);
% 
%     Xval=EOGstreetcvset(:,fea(1:count));
%     yval=EOGstreetcvset(:,27);
% 
%     Xtest=EOGstreettestset(:,fea(1:count));
%     ytest=EOGstreettestset(:,27);
% 
%     
%     %svm
%     % Try different SVM Parameters here
%     [C, sigma] = dataset3Params(X, y, Xval, yval);
% 
%     % Train the SVM
%     model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
%     predicth=svmPredict(model, Xtest);
% 
%     %F score
%     TP=0;
%     FP=0;
%     FN=0;
%     for i=1:size(ytest,1)
%         if((predicth(i,1)==0) && (ytest(i,1)==0))%TP
%                     TP=TP+1;
%         elseif((predicth(i,1)==0) && (ytest(i,1)==1))%FP
%                     FP=FP+1;
%         elseif((predicth(i,1)==1) && (ytest(i,1)==0))%FN
%                     FN=FN+1;        
%         end
%     end
%     precise=TP/(TP+FP);
%     recall=TP/(TP+FN);
%     tempFscore=2*precise*recall/(precise+recall);
%     if tempFscore>Fscore
%         Fscore=tempFscore;
%         bestfeature=fea(1:count);
%     end
% end
%%
%feature subsets
y=EOGstreettrainset(:,47);
ytest=EOGstreettestset(:,47);
Fscorelist=zeros(46,1);
for i=1:46
    bestfeature=fea(47-i:46);
    X=EOGstreettrainset(:,bestfeature);
    Xtest=EOGstreettestset(:,bestfeature);
    model=fitcsvm(X,y,'KernelFunction','poly');
    [label,score] = predict(model,Xtest);
    
    TP=0;
    FP=0;
    TN=0;
    FN=0;
    for j=1:size(ytest,1)
        if((label(j,1)==0) && (ytest(j,1)==0))%TP
                    TP=TP+1;
        elseif((label(j,1)==0) && (ytest(j,1)==1))%FP
                    FP=FP+1;
        elseif((label(j,1)==1) && (ytest(j,1)==1))%TN
                    TN=TN+1;
        elseif((label(j,1)==1) && (ytest(j,1)==0))%FN
                    FN=FN+1;
        end
    end
    precise=TP/(TP+FP);
    recall=TP/(TP+FN);
    %Fscore=2*precise*recall/(precise+recall);
    BAC=0.5*recall+0.5*TN/(TN+FP);
    Fscorelist(i,1)=BAC;
end