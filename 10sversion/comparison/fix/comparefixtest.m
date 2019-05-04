subcombs=combinesubs(["08" "09" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27"],["08" "09" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27"],20);
count=1;
for k=1:size(subcombs,1)
    path1="EOG"+subcombs(k,1)+"fix";
    path2="EOG"+subcombs(k,2)+"fix";
    type="fix";
    if(subcombs(k,1)~=subcombs(k,2))
        for i=1:10
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"abspdf.mat");
            abshpdf1=y(1,:);
            absvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"deri1pdf.mat");
            deri1hpdf1=y(1,:);
            deri1vpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"deri2pdf.mat");
            deri2hpdf1=y(1,:);
            deri2vpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"fixdurationpdf.mat");
            fixdurationhpdf1=y(1,:);
            fixdurationvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"fixstartpdf.mat");
            fixstarthpdf1=y(1,:);
            fixstartvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"fixcentroidpdf.mat");
            fixcentroidhpdf1=y(1,:);
            fixcentroidvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxpdf.mat");
            maxhpdf1=y(1,:);
            maxvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"meanpdf.mat");
            meanhpdf1=y(1,:);
            meanvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"minpdf.mat");
            minhpdf1=y(1,:);
            minvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"sacamplitudepdf.mat");
            sacamplitudehpdf1=y(1,:);
            sacamplitudevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"sacdurationpdf.mat");
            sacdurationhpdf1=y(1,:);
            sacdurationvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"sacstartpdf.mat");
            sacstarthpdf1=y(1,:);
            sacstartvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"blinkstartpdf.mat");
            blinkstartpdf1=y(1,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"blinkdurationpdf.mat");
            blinkdurationpdf1=y(1,:);
            
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxdistancepdf.mat");
            maxdistancehpdf1=y(1,:);
            maxdistancevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"mindistancepdf.mat");
            mindistancehpdf1=y(1,:);
            mindistancevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopeoppdf.mat");
            slopeophpdf1=y(1,:);
            slopeopvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopeonpdf.mat");
            slopeonhpdf1=y(1,:);
            slopeonvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopefppdf.mat");
            slopefphpdf1=y(1,:);
            slopefpvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopefnpdf.mat");
            slopefnhpdf1=y(1,:);
            slopefnvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxderipdf.mat");
            maxderihpdf1=y(1,:);
            maxderivpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"minderipdf.mat");
            minderihpdf1=y(1,:);
            minderivpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxderidistancepdf.mat");
            maxderidistancehpdf1=y(1,:);
            maxderidistancevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"minderidistancepdf.mat");
            minderidistancehpdf1=y(1,:);
            minderidistancevpdf1=y(3,:);
            for j=1:10
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"abspdf.mat");
                abshpdf2=y(1,:);
                absvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"deri1pdf.mat");
                deri1hpdf2=y(1,:);
                deri1vpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"deri2pdf.mat");
                deri2hpdf2=y(1,:);
                deri2vpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"fixdurationpdf.mat");
                fixdurationhpdf2=y(1,:);
                fixdurationvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"fixstartpdf.mat");
                fixstarthpdf2=y(1,:);
                fixstartvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"fixcentroidpdf.mat");
                fixcentroidhpdf2=y(1,:);
                fixcentroidvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"maxpdf.mat");
                maxhpdf2=y(1,:);
                maxvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"meanpdf.mat");
                meanhpdf2=y(1,:);
                meanvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"minpdf.mat");
                minhpdf2=y(1,:);
                minvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"sacamplitudepdf.mat");
                sacamplitudehpdf2=y(1,:);
                sacamplitudevpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"sacdurationpdf.mat");
                sacdurationhpdf2=y(1,:);
                sacdurationvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"sacstartpdf.mat");
                sacstarthpdf2=y(1,:);
                sacstartvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"blinkstartpdf.mat");
                blinkstartpdf2=y(1,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"blinkdurationpdf.mat");
                blinkdurationpdf2=y(1,:);
                
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"maxdistancepdf.mat");
                maxdistancehpdf2=y(1,:);
                maxdistancevpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"mindistancepdf.mat");
                mindistancehpdf2=y(1,:);
                mindistancevpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopeoppdf.mat");
                slopeophpdf2=y(1,:);
                slopeopvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopeonpdf.mat");
                slopeonhpdf2=y(1,:);
                slopeonvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopefppdf.mat");
                slopefphpdf2=y(1,:);
                slopefpvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopefnpdf.mat");
                slopefnhpdf2=y(1,:);
                slopefnvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"maxderipdf.mat");
                maxderihpdf2=y(1,:);
                maxderivpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"minderipdf.mat");
                minderihpdf2=y(1,:);
                minderivpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"maxderidistancepdf.mat");
                maxderidistancehpdf2=y(1,:);
                maxderidistancevpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"minderidistancepdf.mat");
                minderidistancehpdf2=y(1,:);
                minderidistancevpdf2=y(3,:);
                [~,cm_P,~] = cmtest2(abshpdf1,abshpdf2);
                EOGfixtestset(count,1)=cm_P;
                [~,cm_P,~] = cmtest2(absvpdf1,absvpdf2);
                EOGfixtestset(count,2)=cm_P;
                [~,cm_P,~] = cmtest2(deri1hpdf1,deri1hpdf2);
                EOGfixtestset(count,3)=cm_P;
                [~,cm_P,~] = cmtest2(deri1vpdf1,deri1vpdf2);
                EOGfixtestset(count,4)=cm_P;
                [~,cm_P,~] = cmtest2(deri2hpdf1,deri2hpdf2);
                EOGfixtestset(count,5)=cm_P;
                [~,cm_P,~] = cmtest2(deri2vpdf1,deri2vpdf2);
                EOGfixtestset(count,6)=cm_P;
                [~,cm_P,~] = cmtest2(fixdurationhpdf1,fixdurationhpdf2);
                EOGfixtestset(count,7)=cm_P;
                [~,cm_P,~] = cmtest2(fixdurationvpdf1,fixdurationvpdf2);
                EOGfixtestset(count,8)=cm_P;
                [~,cm_P,~] = cmtest2(fixstarthpdf1,fixstarthpdf2);
                EOGfixtestset(count,9)=cm_P;
                [~,cm_P,~] = cmtest2(fixstartvpdf1,fixstartvpdf2);
                EOGfixtestset(count,10)=cm_P;
                [~,cm_P,~] = cmtest2(maxhpdf1,maxhpdf2);
                EOGfixtestset(count,11)=cm_P;
                [~,cm_P,~] = cmtest2(maxvpdf1,maxvpdf2);
                EOGfixtestset(count,12)=cm_P;
                [~,cm_P,~] = cmtest2(meanhpdf1,meanhpdf2);
                EOGfixtestset(count,13)=cm_P;
                [~,cm_P,~] = cmtest2(meanvpdf1,meanvpdf2);
                EOGfixtestset(count,14)=cm_P;
                [~,cm_P,~] = cmtest2(minhpdf1,minhpdf2);
                EOGfixtestset(count,15)=cm_P;
                [~,cm_P,~] = cmtest2(minvpdf1,minvpdf2);
                EOGfixtestset(count,16)=cm_P;
                [~,cm_P,~] = cmtest2(sacamplitudehpdf1,sacamplitudehpdf2);
                EOGfixtestset(count,17)=cm_P;
                [~,cm_P,~] = cmtest2(sacamplitudevpdf1,sacamplitudevpdf2);
                EOGfixtestset(count,18)=cm_P;
                [~,cm_P,~] = cmtest2(sacdurationhpdf1,sacdurationhpdf2);
                EOGfixtestset(count,19)=cm_P;
                [~,cm_P,~] = cmtest2(sacdurationvpdf1,sacdurationvpdf2);
                EOGfixtestset(count,20)=cm_P;
                [~,cm_P,~] = cmtest2(sacstarthpdf1,sacstarthpdf2);
                EOGfixtestset(count,21)=cm_P;
                [~,cm_P,~] = cmtest2(sacstartvpdf1,sacstartvpdf2);
                EOGfixtestset(count,22)=cm_P;
                [~,cm_P,~] = cmtest2(blinkstartpdf1,blinkstartpdf2);
                EOGfixtestset(count,23)=cm_P;
                [~,cm_P,~] = cmtest2(blinkdurationpdf1,blinkdurationpdf2);
                EOGfixtestset(count,24)=cm_P;
                [~,cm_P,~] = cmtest2(fixcentroidhpdf1,fixcentroidhpdf2);
                EOGfixtestset(count,25)=cm_P;
                [~,cm_P,~] = cmtest2(fixcentroidvpdf1,fixcentroidvpdf2);
                EOGfixtestset(count,26)=cm_P;
                
                [~,cm_P,~] = cmtest2(maxdistancehpdf1,maxdistancehpdf2);
                EOGfixtestset(count,27)=cm_P;
                [~,cm_P,~] = cmtest2(maxdistancevpdf1,maxdistancevpdf2);
                EOGfixtestset(count,28)=cm_P;
                [~,cm_P,~] = cmtest2(mindistancehpdf1,mindistancehpdf2);
                EOGfixtestset(count,29)=cm_P;
                [~,cm_P,~] = cmtest2(mindistancevpdf1,mindistancevpdf2);
                EOGfixtestset(count,30)=cm_P;
                [~,cm_P,~] = cmtest2(slopeophpdf1,slopeophpdf2);
                EOGfixtestset(count,31)=cm_P;
                [~,cm_P,~] = cmtest2(slopeopvpdf1,slopeopvpdf2);
                EOGfixtestset(count,32)=cm_P;
                [~,cm_P,~] = cmtest2(slopefphpdf1,slopefphpdf2);
                EOGfixtestset(count,33)=cm_P;
                [~,cm_P,~] = cmtest2(slopefpvpdf1,slopefpvpdf2);
                EOGfixtestset(count,34)=cm_P;
                [~,cm_P,~] = cmtest2(slopeonhpdf1,slopeonhpdf2);
                EOGfixtestset(count,35)=cm_P;
                [~,cm_P,~] = cmtest2(slopeonvpdf1,slopeonvpdf2);
                EOGfixtestset(count,36)=cm_P;
                [~,cm_P,~] = cmtest2(slopefnhpdf1,slopefnhpdf2);
                EOGfixtestset(count,37)=cm_P;
                [~,cm_P,~] = cmtest2(slopefnvpdf1,slopefnvpdf2);
                EOGfixtestset(count,38)=cm_P;
                [~,cm_P,~] = cmtest2(maxderihpdf1,maxderihpdf2);
                EOGfixtestset(count,39)=cm_P;
                [~,cm_P,~] = cmtest2(maxderivpdf1,maxderivpdf2);
                EOGfixtestset(count,40)=cm_P;
                [~,cm_P,~] = cmtest2(minderihpdf1,minderihpdf2);
                EOGfixtestset(count,41)=cm_P;
                [~,cm_P,~] = cmtest2(minderivpdf1,minderivpdf2);
                EOGfixtestset(count,42)=cm_P;
                [~,cm_P,~] = cmtest2(maxderidistancehpdf1,maxderidistancehpdf2);
                EOGfixtestset(count,43)=cm_P;
                [~,cm_P,~] = cmtest2(maxderidistancevpdf1,maxderidistancevpdf2);
                EOGfixtestset(count,44)=cm_P;
                [~,cm_P,~] = cmtest2(minderidistancehpdf1,minderidistancehpdf2);
                EOGfixtestset(count,45)=cm_P;
                [~,cm_P,~] = cmtest2(minderidistancevpdf1,minderidistancevpdf2);
                EOGfixtestset(count,46)=cm_P;
                
                EOGfixtestset(count,47)=(subcombs(k,1)~=subcombs(k,2));
                count=count+1;
            end
        end
    else
        for i=1:10
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"abspdf.mat");
            abshpdf1=y(1,:);
            absvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"deri1pdf.mat");
            deri1hpdf1=y(1,:);
            deri1vpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"deri2pdf.mat");
            deri2hpdf1=y(1,:);
            deri2vpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"fixdurationpdf.mat");
            fixdurationhpdf1=y(1,:);
            fixdurationvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"fixstartpdf.mat");
            fixstarthpdf1=y(1,:);
            fixstartvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"fixcentroidpdf.mat");
            fixcentroidhpdf1=y(1,:);
            fixcentroidvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxpdf.mat");
            maxhpdf1=y(1,:);
            maxvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"meanpdf.mat");
            meanhpdf1=y(1,:);
            meanvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"minpdf.mat");
            minhpdf1=y(1,:);
            minvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"sacamplitudepdf.mat");
            sacamplitudehpdf1=y(1,:);
            sacamplitudevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"sacdurationpdf.mat");
            sacdurationhpdf1=y(1,:);
            sacdurationvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"sacstartpdf.mat");
            sacstarthpdf1=y(1,:);
            sacstartvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"blinkstartpdf.mat");
            blinkstartpdf1=y(1,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"blinkdurationpdf.mat");
            blinkdurationpdf1=y(1,:);
            
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxdistancepdf.mat");
            maxdistancehpdf1=y(1,:);
            maxdistancevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"mindistancepdf.mat");
            mindistancehpdf1=y(1,:);
            mindistancevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopeoppdf.mat");
            slopeophpdf1=y(1,:);
            slopeopvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopeonpdf.mat");
            slopeonhpdf1=y(1,:);
            slopeonvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopefppdf.mat");
            slopefphpdf1=y(1,:);
            slopefpvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopefnpdf.mat");
            slopefnhpdf1=y(1,:);
            slopefnvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxderipdf.mat");
            maxderihpdf1=y(1,:);
            maxderivpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"minderipdf.mat");
            minderihpdf1=y(1,:);
            minderivpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxderidistancepdf.mat");
            maxderidistancehpdf1=y(1,:);
            maxderidistancevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"minderidistancepdf.mat");
            minderidistancehpdf1=y(1,:);
            minderidistancevpdf1=y(3,:);
            for j=(i+1):10
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"abspdf.mat");
                abshpdf2=y(1,:);
                absvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"deri1pdf.mat");
                deri1hpdf2=y(1,:);
                deri1vpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"deri2pdf.mat");
                deri2hpdf2=y(1,:);
                deri2vpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"fixdurationpdf.mat");
                fixdurationhpdf2=y(1,:);
                fixdurationvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"fixstartpdf.mat");
                fixstarthpdf2=y(1,:);
                fixstartvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"fixcentroidpdf.mat");
                fixcentroidhpdf2=y(1,:);
                fixcentroidvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"maxpdf.mat");
                maxhpdf2=y(1,:);
                maxvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"meanpdf.mat");
                meanhpdf2=y(1,:);
                meanvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"minpdf.mat");
                minhpdf2=y(1,:);
                minvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"sacamplitudepdf.mat");
                sacamplitudehpdf2=y(1,:);
                sacamplitudevpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"sacdurationpdf.mat");
                sacdurationhpdf2=y(1,:);
                sacdurationvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"sacstartpdf.mat");
                sacstarthpdf2=y(1,:);
                sacstartvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"blinkstartpdf.mat");
                blinkstartpdf2=y(1,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"blinkdurationpdf.mat");
                blinkdurationpdf2=y(1,:);
                
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"maxdistancepdf.mat");
                maxdistancehpdf2=y(1,:);
                maxdistancevpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"mindistancepdf.mat");
                mindistancehpdf2=y(1,:);
                mindistancevpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopeoppdf.mat");
                slopeophpdf2=y(1,:);
                slopeopvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopeonpdf.mat");
                slopeonhpdf2=y(1,:);
                slopeonvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopefppdf.mat");
                slopefphpdf2=y(1,:);
                slopefpvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopefnpdf.mat");
                slopefnhpdf2=y(1,:);
                slopefnvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"maxderipdf.mat");
                maxderihpdf2=y(1,:);
                maxderivpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"minderipdf.mat");
                minderihpdf2=y(1,:);
                minderivpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"maxderidistancepdf.mat");
                maxderidistancehpdf2=y(1,:);
                maxderidistancevpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"minderidistancepdf.mat");
                minderidistancehpdf2=y(1,:);
                minderidistancevpdf2=y(3,:);
                
                [~,cm_P,~] = cmtest2(abshpdf1,abshpdf2);
                EOGfixtestset(count,1)=cm_P;
                [~,cm_P,~] = cmtest2(absvpdf1,absvpdf2);
                EOGfixtestset(count,2)=cm_P;
                [~,cm_P,~] = cmtest2(deri1hpdf1,deri1hpdf2);
                EOGfixtestset(count,3)=cm_P;
                [~,cm_P,~] = cmtest2(deri1vpdf1,deri1vpdf2);
                EOGfixtestset(count,4)=cm_P;
                [~,cm_P,~] = cmtest2(deri2hpdf1,deri2hpdf2);
                EOGfixtestset(count,5)=cm_P;
                [~,cm_P,~] = cmtest2(deri2vpdf1,deri2vpdf2);
                EOGfixtestset(count,6)=cm_P;
                [~,cm_P,~] = cmtest2(fixdurationhpdf1,fixdurationhpdf2);
                EOGfixtestset(count,7)=cm_P;
                [~,cm_P,~] = cmtest2(fixdurationvpdf1,fixdurationvpdf2);
                EOGfixtestset(count,8)=cm_P;
                [~,cm_P,~] = cmtest2(fixstarthpdf1,fixstarthpdf2);
                EOGfixtestset(count,9)=cm_P;
                [~,cm_P,~] = cmtest2(fixstartvpdf1,fixstartvpdf2);
                EOGfixtestset(count,10)=cm_P;
                [~,cm_P,~] = cmtest2(maxhpdf1,maxhpdf2);
                EOGfixtestset(count,11)=cm_P;
                [~,cm_P,~] = cmtest2(maxvpdf1,maxvpdf2);
                EOGfixtestset(count,12)=cm_P;
                [~,cm_P,~] = cmtest2(meanhpdf1,meanhpdf2);
                EOGfixtestset(count,13)=cm_P;
                [~,cm_P,~] = cmtest2(meanvpdf1,meanvpdf2);
                EOGfixtestset(count,14)=cm_P;
                [~,cm_P,~] = cmtest2(minhpdf1,minhpdf2);
                EOGfixtestset(count,15)=cm_P;
                [~,cm_P,~] = cmtest2(minvpdf1,minvpdf2);
                EOGfixtestset(count,16)=cm_P;
                [~,cm_P,~] = cmtest2(sacamplitudehpdf1,sacamplitudehpdf2);
                EOGfixtestset(count,17)=cm_P;
                [~,cm_P,~] = cmtest2(sacamplitudevpdf1,sacamplitudevpdf2);
                EOGfixtestset(count,18)=cm_P;
                [~,cm_P,~] = cmtest2(sacdurationhpdf1,sacdurationhpdf2);
                EOGfixtestset(count,19)=cm_P;
                [~,cm_P,~] = cmtest2(sacdurationvpdf1,sacdurationvpdf2);
                EOGfixtestset(count,20)=cm_P;
                [~,cm_P,~] = cmtest2(sacstarthpdf1,sacstarthpdf2);
                EOGfixtestset(count,21)=cm_P;
                [~,cm_P,~] = cmtest2(sacstartvpdf1,sacstartvpdf2);
                EOGfixtestset(count,22)=cm_P;
                [~,cm_P,~] = cmtest2(blinkstartpdf1,blinkstartpdf2);
                EOGfixtestset(count,23)=cm_P;
                [~,cm_P,~] = cmtest2(blinkdurationpdf1,blinkdurationpdf2);
                EOGfixtestset(count,24)=cm_P;
                [~,cm_P,~] = cmtest2(fixcentroidhpdf1,fixcentroidhpdf2);
                EOGfixtestset(count,25)=cm_P;
                [~,cm_P,~] = cmtest2(fixcentroidvpdf1,fixcentroidvpdf2);
                EOGfixtestset(count,26)=cm_P;
                
                [~,cm_P,~] = cmtest2(maxdistancehpdf1,maxdistancehpdf2);
                EOGfixtestset(count,27)=cm_P;
                [~,cm_P,~] = cmtest2(maxdistancevpdf1,maxdistancevpdf2);
                EOGfixtestset(count,28)=cm_P;
                [~,cm_P,~] = cmtest2(mindistancehpdf1,mindistancehpdf2);
                EOGfixtestset(count,29)=cm_P;
                [~,cm_P,~] = cmtest2(mindistancevpdf1,mindistancevpdf2);
                EOGfixtestset(count,30)=cm_P;
                [~,cm_P,~] = cmtest2(slopeophpdf1,slopeophpdf2);
                EOGfixtestset(count,31)=cm_P;
                [~,cm_P,~] = cmtest2(slopeopvpdf1,slopeopvpdf2);
                EOGfixtestset(count,32)=cm_P;
                [~,cm_P,~] = cmtest2(slopefphpdf1,slopefphpdf2);
                EOGfixtestset(count,33)=cm_P;
                [~,cm_P,~] = cmtest2(slopefpvpdf1,slopefpvpdf2);
                EOGfixtestset(count,34)=cm_P;
                [~,cm_P,~] = cmtest2(slopeonhpdf1,slopeonhpdf2);
                EOGfixtestset(count,35)=cm_P;
                [~,cm_P,~] = cmtest2(slopeonvpdf1,slopeonvpdf2);
                EOGfixtestset(count,36)=cm_P;
                [~,cm_P,~] = cmtest2(slopefnhpdf1,slopefnhpdf2);
                EOGfixtestset(count,37)=cm_P;
                [~,cm_P,~] = cmtest2(slopefnvpdf1,slopefnvpdf2);
                EOGfixtestset(count,38)=cm_P;
                [~,cm_P,~] = cmtest2(maxderihpdf1,maxderihpdf2);
                EOGfixtestset(count,39)=cm_P;
                [~,cm_P,~] = cmtest2(maxderivpdf1,maxderivpdf2);
                EOGfixtestset(count,40)=cm_P;
                [~,cm_P,~] = cmtest2(minderihpdf1,minderihpdf2);
                EOGfixtestset(count,41)=cm_P;
                [~,cm_P,~] = cmtest2(minderivpdf1,minderivpdf2);
                EOGfixtestset(count,42)=cm_P;
                [~,cm_P,~] = cmtest2(maxderidistancehpdf1,maxderidistancehpdf2);
                EOGfixtestset(count,43)=cm_P;
                [~,cm_P,~] = cmtest2(maxderidistancevpdf1,maxderidistancevpdf2);
                EOGfixtestset(count,44)=cm_P;
                [~,cm_P,~] = cmtest2(minderidistancehpdf1,minderidistancehpdf2);
                EOGfixtestset(count,45)=cm_P;
                [~,cm_P,~] = cmtest2(minderidistancevpdf1,minderidistancevpdf2);
                EOGfixtestset(count,46)=cm_P;

                EOGfixtestset(count,47)=(subcombs(k,1)~=subcombs(k,2));
                count=count+1;
            end
        end
    end
    save("EOG"+type+"testset.mat",'EOGfixtestset');
end
