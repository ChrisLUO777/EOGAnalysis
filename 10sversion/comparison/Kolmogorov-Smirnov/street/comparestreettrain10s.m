close all; clear;
subnum=32;
subcombs=combinesubs(["01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32"],...
    ["01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32"],subnum);
count=1;
datasize=(subnum*10)*(subnum*10-1)/2;
EOGstreettrainset=zeros(datasize,47);
time="10s";
for k=1:size(subcombs,1)
    path1=subcombs(k,1)+"\EOG"+subcombs(k,1)+"street";
    path2=subcombs(k,2)+"\EOG"+subcombs(k,2)+"street";
    type="street";
    if(subcombs(k,1)~=subcombs(k,2))
        for i=1:10
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"abspdf"+time+".mat");
            abshpdf1=y(1,:);
            absvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"deri1pdf"+time+".mat");
            deri1hpdf1=y(1,:);
            deri1vpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"deri2pdf"+time+".mat");
            deri2hpdf1=y(1,:);
            deri2vpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"fixdurationpdf"+time+".mat");
            fixdurationhpdf1=y(1,:);
            fixdurationvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"fixstartpdf"+time+".mat");
            fixstarthpdf1=y(1,:);
            fixstartvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"fixcentroidpdf"+time+".mat");
            fixcentroidhpdf1=y(1,:);
            fixcentroidvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxpdf"+time+".mat");
            maxhpdf1=y(1,:);
            maxvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"meanpdf"+time+".mat");
            meanhpdf1=y(1,:);
            meanvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"minpdf"+time+".mat");
            minhpdf1=y(1,:);
            minvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"sacamplitudepdf"+time+".mat");
            sacamplitudehpdf1=y(1,:);
            sacamplitudevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"sacdurationpdf"+time+".mat");
            sacdurationhpdf1=y(1,:);
            sacdurationvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"sacstartpdf"+time+".mat");
            sacstarthpdf1=y(1,:);
            sacstartvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"blinkstartpdf"+time+".mat");
            blinkstartpdf1=y(1,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"blinkdurationpdf"+time+".mat");
            blinkdurationpdf1=y(1,:);
            
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxdistancepdf"+time+".mat");
            maxdistancehpdf1=y(1,:);
            maxdistancevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"mindistancepdf"+time+".mat");
            mindistancehpdf1=y(1,:);
            mindistancevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopeoppdf"+time+".mat");
            slopeophpdf1=y(1,:);
            slopeopvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopeonpdf"+time+".mat");
            slopeonhpdf1=y(1,:);
            slopeonvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopefppdf"+time+".mat");
            slopefphpdf1=y(1,:);
            slopefpvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopefnpdf"+time+".mat");
            slopefnhpdf1=y(1,:);
            slopefnvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxderipdf"+time+".mat");
            maxderihpdf1=y(1,:);
            maxderivpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"minderipdf"+time+".mat");
            minderihpdf1=y(1,:);
            minderivpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxderidistancepdf"+time+".mat");
            maxderidistancehpdf1=y(1,:);
            maxderidistancevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"minderidistancepdf"+time+".mat");
            minderidistancehpdf1=y(1,:);
            minderidistancevpdf1=y(3,:);
            for j=1:10
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"abspdf"+time+".mat");
                abshpdf2=y(1,:);
                absvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"deri1pdf"+time+".mat");
                deri1hpdf2=y(1,:);
                deri1vpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"deri2pdf"+time+".mat");
                deri2hpdf2=y(1,:);
                deri2vpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"fixdurationpdf"+time+".mat");
                fixdurationhpdf2=y(1,:);
                fixdurationvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"fixstartpdf"+time+".mat");
                fixstarthpdf2=y(1,:);
                fixstartvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"fixcentroidpdf"+time+".mat");
                fixcentroidhpdf2=y(1,:);
                fixcentroidvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"maxpdf"+time+".mat");
                maxhpdf2=y(1,:);
                maxvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"meanpdf"+time+".mat");
                meanhpdf2=y(1,:);
                meanvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"minpdf"+time+".mat");
                minhpdf2=y(1,:);
                minvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"sacamplitudepdf"+time+".mat");
                sacamplitudehpdf2=y(1,:);
                sacamplitudevpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"sacdurationpdf"+time+".mat");
                sacdurationhpdf2=y(1,:);
                sacdurationvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"sacstartpdf"+time+".mat");
                sacstarthpdf2=y(1,:);
                sacstartvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"blinkstartpdf"+time+".mat");
                blinkstartpdf2=y(1,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"blinkdurationpdf"+time+".mat");
                blinkdurationpdf2=y(1,:);
                
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"maxdistancepdf"+time+".mat");
                maxdistancehpdf2=y(1,:);
                maxdistancevpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"mindistancepdf"+time+".mat");
                mindistancehpdf2=y(1,:);
                mindistancevpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopeoppdf"+time+".mat");
                slopeophpdf2=y(1,:);
                slopeopvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopeonpdf"+time+".mat");
                slopeonhpdf2=y(1,:);
                slopeonvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopefppdf"+time+".mat");
                slopefphpdf2=y(1,:);
                slopefpvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopefnpdf"+time+".mat");
                slopefnhpdf2=y(1,:);
                slopefnvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"maxderipdf"+time+".mat");
                maxderihpdf2=y(1,:);
                maxderivpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"minderipdf"+time+".mat");
                minderihpdf2=y(1,:);
                minderivpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"maxderidistancepdf"+time+".mat");
                maxderidistancehpdf2=y(1,:);
                maxderidistancevpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"minderidistancepdf"+time+".mat");
                minderidistancehpdf2=y(1,:);
                minderidistancevpdf2=y(3,:);
                [~,cm_P,~] = cmtest2(abshpdf1,abshpdf2);
                EOGstreettrainset(count,1)=cm_P;
                [~,cm_P,~] = cmtest2(absvpdf1,absvpdf2);
                EOGstreettrainset(count,2)=cm_P;
                [~,cm_P,~] = cmtest2(deri1hpdf1,deri1hpdf2);
                EOGstreettrainset(count,3)=cm_P;
                [~,cm_P,~] = cmtest2(deri1vpdf1,deri1vpdf2);
                EOGstreettrainset(count,4)=cm_P;
                [~,cm_P,~] = cmtest2(deri2hpdf1,deri2hpdf2);
                EOGstreettrainset(count,5)=cm_P;
                [~,cm_P,~] = cmtest2(deri2vpdf1,deri2vpdf2);
                EOGstreettrainset(count,6)=cm_P;
                [~,cm_P,~] = cmtest2(fixdurationhpdf1,fixdurationhpdf2);
                EOGstreettrainset(count,7)=cm_P;
                [~,cm_P,~] = cmtest2(fixdurationvpdf1,fixdurationvpdf2);
                EOGstreettrainset(count,8)=cm_P;
                [~,cm_P,~] = cmtest2(fixstarthpdf1,fixstarthpdf2);
                EOGstreettrainset(count,9)=cm_P;
                [~,cm_P,~] = cmtest2(fixstartvpdf1,fixstartvpdf2);
                EOGstreettrainset(count,10)=cm_P;
                [~,cm_P,~] = cmtest2(maxhpdf1,maxhpdf2);
                EOGstreettrainset(count,11)=cm_P;
                [~,cm_P,~] = cmtest2(maxvpdf1,maxvpdf2);
                EOGstreettrainset(count,12)=cm_P;
                [~,cm_P,~] = cmtest2(meanhpdf1,meanhpdf2);
                EOGstreettrainset(count,13)=cm_P;
                [~,cm_P,~] = cmtest2(meanvpdf1,meanvpdf2);
                EOGstreettrainset(count,14)=cm_P;
                [~,cm_P,~] = cmtest2(minhpdf1,minhpdf2);
                EOGstreettrainset(count,15)=cm_P;
                [~,cm_P,~] = cmtest2(minvpdf1,minvpdf2);
                EOGstreettrainset(count,16)=cm_P;
                [~,cm_P,~] = cmtest2(sacamplitudehpdf1,sacamplitudehpdf2);
                EOGstreettrainset(count,17)=cm_P;
                [~,cm_P,~] = cmtest2(sacamplitudevpdf1,sacamplitudevpdf2);
                EOGstreettrainset(count,18)=cm_P;
                [~,cm_P,~] = cmtest2(sacdurationhpdf1,sacdurationhpdf2);
                EOGstreettrainset(count,19)=cm_P;
                [~,cm_P,~] = cmtest2(sacdurationvpdf1,sacdurationvpdf2);
                EOGstreettrainset(count,20)=cm_P;
                [~,cm_P,~] = cmtest2(sacstarthpdf1,sacstarthpdf2);
                EOGstreettrainset(count,21)=cm_P;
                [~,cm_P,~] = cmtest2(sacstartvpdf1,sacstartvpdf2);
                EOGstreettrainset(count,22)=cm_P;
                [~,cm_P,~] = cmtest2(blinkstartpdf1,blinkstartpdf2);
                EOGstreettrainset(count,23)=cm_P;
                [~,cm_P,~] = cmtest2(blinkdurationpdf1,blinkdurationpdf2);
                EOGstreettrainset(count,24)=cm_P;
                [~,cm_P,~] = cmtest2(fixcentroidhpdf1,fixcentroidhpdf2);
                EOGstreettrainset(count,25)=cm_P;
                [~,cm_P,~] = cmtest2(fixcentroidvpdf1,fixcentroidvpdf2);
                EOGstreettrainset(count,26)=cm_P;
                
                [~,cm_P,~] = cmtest2(maxdistancehpdf1,maxdistancehpdf2);
                EOGstreettrainset(count,27)=cm_P;
                [~,cm_P,~] = cmtest2(maxdistancevpdf1,maxdistancevpdf2);
                EOGstreettrainset(count,28)=cm_P;
                [~,cm_P,~] = cmtest2(mindistancehpdf1,mindistancehpdf2);
                EOGstreettrainset(count,29)=cm_P;
                [~,cm_P,~] = cmtest2(mindistancevpdf1,mindistancevpdf2);
                EOGstreettrainset(count,30)=cm_P;
                [~,cm_P,~] = cmtest2(slopeophpdf1,slopeophpdf2);
                EOGstreettrainset(count,31)=cm_P;
                [~,cm_P,~] = cmtest2(slopeopvpdf1,slopeopvpdf2);
                EOGstreettrainset(count,32)=cm_P;
                [~,cm_P,~] = cmtest2(slopefphpdf1,slopefphpdf2);
                EOGstreettrainset(count,33)=cm_P;
                [~,cm_P,~] = cmtest2(slopefpvpdf1,slopefpvpdf2);
                EOGstreettrainset(count,34)=cm_P;
                [~,cm_P,~] = cmtest2(slopeonhpdf1,slopeonhpdf2);
                EOGstreettrainset(count,35)=cm_P;
                [~,cm_P,~] = cmtest2(slopeonvpdf1,slopeonvpdf2);
                EOGstreettrainset(count,36)=cm_P;
                [~,cm_P,~] = cmtest2(slopefnhpdf1,slopefnhpdf2);
                EOGstreettrainset(count,37)=cm_P;
                [~,cm_P,~] = cmtest2(slopefnvpdf1,slopefnvpdf2);
                EOGstreettrainset(count,38)=cm_P;
                [~,cm_P,~] = cmtest2(maxderihpdf1,maxderihpdf2);
                EOGstreettrainset(count,39)=cm_P;
                [~,cm_P,~] = cmtest2(maxderivpdf1,maxderivpdf2);
                EOGstreettrainset(count,40)=cm_P;
                [~,cm_P,~] = cmtest2(minderihpdf1,minderihpdf2);
                EOGstreettrainset(count,41)=cm_P;
                [~,cm_P,~] = cmtest2(minderivpdf1,minderivpdf2);
                EOGstreettrainset(count,42)=cm_P;
                [~,cm_P,~] = cmtest2(maxderidistancehpdf1,maxderidistancehpdf2);
                EOGstreettrainset(count,43)=cm_P;
                [~,cm_P,~] = cmtest2(maxderidistancevpdf1,maxderidistancevpdf2);
                EOGstreettrainset(count,44)=cm_P;
                [~,cm_P,~] = cmtest2(minderidistancehpdf1,minderidistancehpdf2);
                EOGstreettrainset(count,45)=cm_P;
                [~,cm_P,~] = cmtest2(minderidistancevpdf1,minderidistancevpdf2);
                EOGstreettrainset(count,46)=cm_P;
                
                EOGstreettrainset(count,47)=(subcombs(k,1)~=subcombs(k,2));
                count=count+1;
            end
        end
    else
        for i=1:10
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"abspdf"+time+".mat");
            abshpdf1=y(1,:);
            absvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"deri1pdf"+time+".mat");
            deri1hpdf1=y(1,:);
            deri1vpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"deri2pdf"+time+".mat");
            deri2hpdf1=y(1,:);
            deri2vpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"fixdurationpdf"+time+".mat");
            fixdurationhpdf1=y(1,:);
            fixdurationvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"fixstartpdf"+time+".mat");
            fixstarthpdf1=y(1,:);
            fixstartvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"fixcentroidpdf"+time+".mat");
            fixcentroidhpdf1=y(1,:);
            fixcentroidvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxpdf"+time+".mat");
            maxhpdf1=y(1,:);
            maxvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"meanpdf"+time+".mat");
            meanhpdf1=y(1,:);
            meanvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"minpdf"+time+".mat");
            minhpdf1=y(1,:);
            minvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"sacamplitudepdf"+time+".mat");
            sacamplitudehpdf1=y(1,:);
            sacamplitudevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"sacdurationpdf"+time+".mat");
            sacdurationhpdf1=y(1,:);
            sacdurationvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"sacstartpdf"+time+".mat");
            sacstarthpdf1=y(1,:);
            sacstartvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"blinkstartpdf"+time+".mat");
            blinkstartpdf1=y(1,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"blinkdurationpdf"+time+".mat");
            blinkdurationpdf1=y(1,:);
            
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxdistancepdf"+time+".mat");
            maxdistancehpdf1=y(1,:);
            maxdistancevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"mindistancepdf"+time+".mat");
            mindistancehpdf1=y(1,:);
            mindistancevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopeoppdf"+time+".mat");
            slopeophpdf1=y(1,:);
            slopeopvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopeonpdf"+time+".mat");
            slopeonhpdf1=y(1,:);
            slopeonvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopefppdf"+time+".mat");
            slopefphpdf1=y(1,:);
            slopefpvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"slopefnpdf"+time+".mat");
            slopefnhpdf1=y(1,:);
            slopefnvpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxderipdf"+time+".mat");
            maxderihpdf1=y(1,:);
            maxderivpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"minderipdf"+time+".mat");
            minderihpdf1=y(1,:);
            minderivpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"maxderidistancepdf"+time+".mat");
            maxderidistancehpdf1=y(1,:);
            maxderidistancevpdf1=y(3,:);
            load(".\"+path1+i+"\EOG"+subcombs(k,1)+type+i+"minderidistancepdf"+time+".mat");
            minderidistancehpdf1=y(1,:);
            minderidistancevpdf1=y(3,:);
            for j=(i+1):10
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"abspdf"+time+".mat");
                abshpdf2=y(1,:);
                absvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"deri1pdf"+time+".mat");
                deri1hpdf2=y(1,:);
                deri1vpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"deri2pdf"+time+".mat");
                deri2hpdf2=y(1,:);
                deri2vpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"fixdurationpdf"+time+".mat");
                fixdurationhpdf2=y(1,:);
                fixdurationvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"fixstartpdf"+time+".mat");
                fixstarthpdf2=y(1,:);
                fixstartvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"fixcentroidpdf"+time+".mat");
                fixcentroidhpdf2=y(1,:);
                fixcentroidvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"maxpdf"+time+".mat");
                maxhpdf2=y(1,:);
                maxvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"meanpdf"+time+".mat");
                meanhpdf2=y(1,:);
                meanvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"minpdf"+time+".mat");
                minhpdf2=y(1,:);
                minvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"sacamplitudepdf"+time+".mat");
                sacamplitudehpdf2=y(1,:);
                sacamplitudevpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"sacdurationpdf"+time+".mat");
                sacdurationhpdf2=y(1,:);
                sacdurationvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"sacstartpdf"+time+".mat");
                sacstarthpdf2=y(1,:);
                sacstartvpdf2=y(3,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"blinkstartpdf"+time+".mat");
                blinkstartpdf2=y(1,:);
                load(".\"+path2+j+"\EOG"+subcombs(k,2)+type+j+"blinkdurationpdf"+time+".mat");
                blinkdurationpdf2=y(1,:);
                
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"maxdistancepdf"+time+".mat");
                maxdistancehpdf2=y(1,:);
                maxdistancevpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"mindistancepdf"+time+".mat");
                mindistancehpdf2=y(1,:);
                mindistancevpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopeoppdf"+time+".mat");
                slopeophpdf2=y(1,:);
                slopeopvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopeonpdf"+time+".mat");
                slopeonhpdf2=y(1,:);
                slopeonvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopefppdf"+time+".mat");
                slopefphpdf2=y(1,:);
                slopefpvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"slopefnpdf"+time+".mat");
                slopefnhpdf2=y(1,:);
                slopefnvpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"maxderipdf"+time+".mat");
                maxderihpdf2=y(1,:);
                maxderivpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"minderipdf"+time+".mat");
                minderihpdf2=y(1,:);
                minderivpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"maxderidistancepdf"+time+".mat");
                maxderidistancehpdf2=y(1,:);
                maxderidistancevpdf2=y(3,:);
                load(".\"+path2+i+"\EOG"+subcombs(k,2)+type+i+"minderidistancepdf"+time+".mat");
                minderidistancehpdf2=y(1,:);
                minderidistancevpdf2=y(3,:);
                
                [~,cm_P,~] = cmtest2(abshpdf1,abshpdf2);
                EOGstreettrainset(count,1)=cm_P;
                [~,cm_P,~] = cmtest2(absvpdf1,absvpdf2);
                EOGstreettrainset(count,2)=cm_P;
                [~,cm_P,~] = cmtest2(deri1hpdf1,deri1hpdf2);
                EOGstreettrainset(count,3)=cm_P;
                [~,cm_P,~] = cmtest2(deri1vpdf1,deri1vpdf2);
                EOGstreettrainset(count,4)=cm_P;
                [~,cm_P,~] = cmtest2(deri2hpdf1,deri2hpdf2);
                EOGstreettrainset(count,5)=cm_P;
                [~,cm_P,~] = cmtest2(deri2vpdf1,deri2vpdf2);
                EOGstreettrainset(count,6)=cm_P;
                [~,cm_P,~] = cmtest2(fixdurationhpdf1,fixdurationhpdf2);
                EOGstreettrainset(count,7)=cm_P;
                [~,cm_P,~] = cmtest2(fixdurationvpdf1,fixdurationvpdf2);
                EOGstreettrainset(count,8)=cm_P;
                [~,cm_P,~] = cmtest2(fixstarthpdf1,fixstarthpdf2);
                EOGstreettrainset(count,9)=cm_P;
                [~,cm_P,~] = cmtest2(fixstartvpdf1,fixstartvpdf2);
                EOGstreettrainset(count,10)=cm_P;
                [~,cm_P,~] = cmtest2(maxhpdf1,maxhpdf2);
                EOGstreettrainset(count,11)=cm_P;
                [~,cm_P,~] = cmtest2(maxvpdf1,maxvpdf2);
                EOGstreettrainset(count,12)=cm_P;
                [~,cm_P,~] = cmtest2(meanhpdf1,meanhpdf2);
                EOGstreettrainset(count,13)=cm_P;
                [~,cm_P,~] = cmtest2(meanvpdf1,meanvpdf2);
                EOGstreettrainset(count,14)=cm_P;
                [~,cm_P,~] = cmtest2(minhpdf1,minhpdf2);
                EOGstreettrainset(count,15)=cm_P;
                [~,cm_P,~] = cmtest2(minvpdf1,minvpdf2);
                EOGstreettrainset(count,16)=cm_P;
                [~,cm_P,~] = cmtest2(sacamplitudehpdf1,sacamplitudehpdf2);
                EOGstreettrainset(count,17)=cm_P;
                [~,cm_P,~] = cmtest2(sacamplitudevpdf1,sacamplitudevpdf2);
                EOGstreettrainset(count,18)=cm_P;
                [~,cm_P,~] = cmtest2(sacdurationhpdf1,sacdurationhpdf2);
                EOGstreettrainset(count,19)=cm_P;
                [~,cm_P,~] = cmtest2(sacdurationvpdf1,sacdurationvpdf2);
                EOGstreettrainset(count,20)=cm_P;
                [~,cm_P,~] = cmtest2(sacstarthpdf1,sacstarthpdf2);
                EOGstreettrainset(count,21)=cm_P;
                [~,cm_P,~] = cmtest2(sacstartvpdf1,sacstartvpdf2);
                EOGstreettrainset(count,22)=cm_P;
                [~,cm_P,~] = cmtest2(blinkstartpdf1,blinkstartpdf2);
                EOGstreettrainset(count,23)=cm_P;
                [~,cm_P,~] = cmtest2(blinkdurationpdf1,blinkdurationpdf2);
                EOGstreettrainset(count,24)=cm_P;
                [~,cm_P,~] = cmtest2(fixcentroidhpdf1,fixcentroidhpdf2);
                EOGstreettrainset(count,25)=cm_P;
                [~,cm_P,~] = cmtest2(fixcentroidvpdf1,fixcentroidvpdf2);
                EOGstreettrainset(count,26)=cm_P;
                
                [~,cm_P,~] = cmtest2(maxdistancehpdf1,maxdistancehpdf2);
                EOGstreettrainset(count,27)=cm_P;
                [~,cm_P,~] = cmtest2(maxdistancevpdf1,maxdistancevpdf2);
                EOGstreettrainset(count,28)=cm_P;
                [~,cm_P,~] = cmtest2(mindistancehpdf1,mindistancehpdf2);
                EOGstreettrainset(count,29)=cm_P;
                [~,cm_P,~] = cmtest2(mindistancevpdf1,mindistancevpdf2);
                EOGstreettrainset(count,30)=cm_P;
                [~,cm_P,~] = cmtest2(slopeophpdf1,slopeophpdf2);
                EOGstreettrainset(count,31)=cm_P;
                [~,cm_P,~] = cmtest2(slopeopvpdf1,slopeopvpdf2);
                EOGstreettrainset(count,32)=cm_P;
                [~,cm_P,~] = cmtest2(slopefphpdf1,slopefphpdf2);
                EOGstreettrainset(count,33)=cm_P;
                [~,cm_P,~] = cmtest2(slopefpvpdf1,slopefpvpdf2);
                EOGstreettrainset(count,34)=cm_P;
                [~,cm_P,~] = cmtest2(slopeonhpdf1,slopeonhpdf2);
                EOGstreettrainset(count,35)=cm_P;
                [~,cm_P,~] = cmtest2(slopeonvpdf1,slopeonvpdf2);
                EOGstreettrainset(count,36)=cm_P;
                [~,cm_P,~] = cmtest2(slopefnhpdf1,slopefnhpdf2);
                EOGstreettrainset(count,37)=cm_P;
                [~,cm_P,~] = cmtest2(slopefnvpdf1,slopefnvpdf2);
                EOGstreettrainset(count,38)=cm_P;
                [~,cm_P,~] = cmtest2(maxderihpdf1,maxderihpdf2);
                EOGstreettrainset(count,39)=cm_P;
                [~,cm_P,~] = cmtest2(maxderivpdf1,maxderivpdf2);
                EOGstreettrainset(count,40)=cm_P;
                [~,cm_P,~] = cmtest2(minderihpdf1,minderihpdf2);
                EOGstreettrainset(count,41)=cm_P;
                [~,cm_P,~] = cmtest2(minderivpdf1,minderivpdf2);
                EOGstreettrainset(count,42)=cm_P;
                [~,cm_P,~] = cmtest2(maxderidistancehpdf1,maxderidistancehpdf2);
                EOGstreettrainset(count,43)=cm_P;
                [~,cm_P,~] = cmtest2(maxderidistancevpdf1,maxderidistancevpdf2);
                EOGstreettrainset(count,44)=cm_P;
                [~,cm_P,~] = cmtest2(minderidistancehpdf1,minderidistancehpdf2);
                EOGstreettrainset(count,45)=cm_P;
                [~,cm_P,~] = cmtest2(minderidistancevpdf1,minderidistancevpdf2);
                EOGstreettrainset(count,46)=cm_P;

                EOGstreettrainset(count,47)=(subcombs(k,1)~=subcombs(k,2));
                count=count+1;
            end
        end
    end
    save("EOG"+type+"trainset"+time+".mat",'EOGstreettrainset');
end
