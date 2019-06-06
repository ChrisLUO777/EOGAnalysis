function result=EER(ytest,predicth)
    result=1;
    RN=sum(ytest);
    RP=size(ytest,1)-RN;
    threshold=-5:0.00001:5;
    TPR=0;
    FPR=0;
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
        TPR=(TP/RP);
        FPR=(FP/RN);
        if TPR>=(1-FPR)
            result=FPR;
            break;
        end
    end
end