close all; clear;
load("EOGfixtrainset.mat");
load("EOGfixcvset.mat");
load("EOGfixtestset.mat");

d=EOGfixtrainset(:,1:26);
f=EOGfixtrainset(:,27);
K=26;
fea=mrmr_mid_d(d,f,K);
Fscore=0;
bestfeature=[];

for count=2:26
    X=EOGfixtrainset(:,fea(1:count));
    y=EOGfixtrainset(:,27);

    Xval=EOGfixcvset(:,fea(1:count));
    yval=EOGfixcvset(:,27);

    Xtest=EOGfixtestset(:,fea(1:count));
    ytest=EOGfixtestset(:,27);

    
    %svm
    % Try different SVM Parameters here
    [C, sigma] = dataset3Params(X, y, Xval, yval);

    % Train the SVM
    model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
    predicth=svmPredict(model, Xtest);

    %F score
    TP=0;
    FP=0;
    FN=0;
    for i=1:size(ytest,1)
        if((predicth(i,1)==0) && (ytest(i,1)==0))%TP
                    TP=TP+1;
        elseif((predicth(i,1)==0) && (ytest(i,1)==1))%FP
                    FP=FP+1;
        elseif((predicth(i,1)==1) && (ytest(i,1)==0))%FN
                    FN=FN+1;        
        end
    end
    precise=TP/(TP+FP);
    recall=TP/(TP+FN);
    tempFscore=2*precise*recall/(precise+recall);
    if tempFscore>Fscore
        Fscore=tempFscore;
        bestfeature=fea(1:count);
    end
end
