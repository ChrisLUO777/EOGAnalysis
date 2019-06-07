close all; clear;
subnum=32;
subcombs=combinesubs(["33" "34" "35" "36" "37" "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49" "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61" "62" "63" "64"],...
    ["33" "34" "35" "36" "37" "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49" "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61" "62" "63" "64"],subnum);
count=1;
datasize=(subnum*10)*(subnum*10-1)/2;
EOGstreettestset=zeros(datasize,47);
time="5s";
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
                [~,p] = cmtest2(abshpdf1,abshpdf2);
                EOGstreettestset(count,1)=p;
                [~,p] = cmtest2(absvpdf1,absvpdf2);
                EOGstreettestset(count,2)=p;
                [~,p] = cmtest2(deri1hpdf1,deri1hpdf2);
                EOGstreettestset(count,3)=p;
                [~,p] = cmtest2(deri1vpdf1,deri1vpdf2);
                EOGstreettestset(count,4)=p;
                [~,p] = cmtest2(deri2hpdf1,deri2hpdf2);
                EOGstreettestset(count,5)=p;
                [~,p] = cmtest2(deri2vpdf1,deri2vpdf2);
                EOGstreettestset(count,6)=p;
                [~,p] = cmtest2(fixdurationhpdf1,fixdurationhpdf2);
                EOGstreettestset(count,7)=p;
                [~,p] = cmtest2(fixdurationvpdf1,fixdurationvpdf2);
                EOGstreettestset(count,8)=p;
                [~,p] = cmtest2(fixstarthpdf1,fixstarthpdf2);
                EOGstreettestset(count,9)=p;
                [~,p] = cmtest2(fixstartvpdf1,fixstartvpdf2);
                EOGstreettestset(count,10)=p;
                [~,p] = cmtest2(maxhpdf1,maxhpdf2);
                EOGstreettestset(count,11)=p;
                [~,p] = cmtest2(maxvpdf1,maxvpdf2);
                EOGstreettestset(count,12)=p;
                [~,p] = cmtest2(meanhpdf1,meanhpdf2);
                EOGstreettestset(count,13)=p;
                [~,p] = cmtest2(meanvpdf1,meanvpdf2);
                EOGstreettestset(count,14)=p;
                [~,p] = cmtest2(minhpdf1,minhpdf2);
                EOGstreettestset(count,15)=p;
                [~,p] = cmtest2(minvpdf1,minvpdf2);
                EOGstreettestset(count,16)=p;
                [~,p] = cmtest2(sacamplitudehpdf1,sacamplitudehpdf2);
                EOGstreettestset(count,17)=p;
                [~,p] = cmtest2(sacamplitudevpdf1,sacamplitudevpdf2);
                EOGstreettestset(count,18)=p;
                [~,p] = cmtest2(sacdurationhpdf1,sacdurationhpdf2);
                EOGstreettestset(count,19)=p;
                [~,p] = cmtest2(sacdurationvpdf1,sacdurationvpdf2);
                EOGstreettestset(count,20)=p;
                [~,p] = cmtest2(sacstarthpdf1,sacstarthpdf2);
                EOGstreettestset(count,21)=p;
                [~,p] = cmtest2(sacstartvpdf1,sacstartvpdf2);
                EOGstreettestset(count,22)=p;
                [~,p] = cmtest2(blinkstartpdf1,blinkstartpdf2);
                EOGstreettestset(count,23)=p;
                [~,p] = cmtest2(blinkdurationpdf1,blinkdurationpdf2);
                EOGstreettestset(count,24)=p;
                [~,p] = cmtest2(fixcentroidhpdf1,fixcentroidhpdf2);
                EOGstreettestset(count,25)=p;
                [~,p] = cmtest2(fixcentroidvpdf1,fixcentroidvpdf2);
                EOGstreettestset(count,26)=p;
                
                [~,p] = cmtest2(maxdistancehpdf1,maxdistancehpdf2);
                EOGstreettestset(count,27)=p;
                [~,p] = cmtest2(maxdistancevpdf1,maxdistancevpdf2);
                EOGstreettestset(count,28)=p;
                [~,p] = cmtest2(mindistancehpdf1,mindistancehpdf2);
                EOGstreettestset(count,29)=p;
                [~,p] = cmtest2(mindistancevpdf1,mindistancevpdf2);
                EOGstreettestset(count,30)=p;
                [~,p] = cmtest2(slopeophpdf1,slopeophpdf2);
                EOGstreettestset(count,31)=p;
                [~,p] = cmtest2(slopeopvpdf1,slopeopvpdf2);
                EOGstreettestset(count,32)=p;
                [~,p] = cmtest2(slopefphpdf1,slopefphpdf2);
                EOGstreettestset(count,33)=p;
                [~,p] = cmtest2(slopefpvpdf1,slopefpvpdf2);
                EOGstreettestset(count,34)=p;
                [~,p] = cmtest2(slopeonhpdf1,slopeonhpdf2);
                EOGstreettestset(count,35)=p;
                [~,p] = cmtest2(slopeonvpdf1,slopeonvpdf2);
                EOGstreettestset(count,36)=p;
                [~,p] = cmtest2(slopefnhpdf1,slopefnhpdf2);
                EOGstreettestset(count,37)=p;
                [~,p] = cmtest2(slopefnvpdf1,slopefnvpdf2);
                EOGstreettestset(count,38)=p;
                [~,p] = cmtest2(maxderihpdf1,maxderihpdf2);
                EOGstreettestset(count,39)=p;
                [~,p] = cmtest2(maxderivpdf1,maxderivpdf2);
                EOGstreettestset(count,40)=p;
                [~,p] = cmtest2(minderihpdf1,minderihpdf2);
                EOGstreettestset(count,41)=p;
                [~,p] = cmtest2(minderivpdf1,minderivpdf2);
                EOGstreettestset(count,42)=p;
                [~,p] = cmtest2(maxderidistancehpdf1,maxderidistancehpdf2);
                EOGstreettestset(count,43)=p;
                [~,p] = cmtest2(maxderidistancevpdf1,maxderidistancevpdf2);
                EOGstreettestset(count,44)=p;
                [~,p] = cmtest2(minderidistancehpdf1,minderidistancehpdf2);
                EOGstreettestset(count,45)=p;
                [~,p] = cmtest2(minderidistancevpdf1,minderidistancevpdf2);
                EOGstreettestset(count,46)=p;
                
                EOGstreettestset(count,47)=(subcombs(k,1)~=subcombs(k,2));
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
                
                [~,p] = cmtest2(abshpdf1,abshpdf2);
                EOGstreettestset(count,1)=p;
                [~,p] = cmtest2(absvpdf1,absvpdf2);
                EOGstreettestset(count,2)=p;
                [~,p] = cmtest2(deri1hpdf1,deri1hpdf2);
                EOGstreettestset(count,3)=p;
                [~,p] = cmtest2(deri1vpdf1,deri1vpdf2);
                EOGstreettestset(count,4)=p;
                [~,p] = cmtest2(deri2hpdf1,deri2hpdf2);
                EOGstreettestset(count,5)=p;
                [~,p] = cmtest2(deri2vpdf1,deri2vpdf2);
                EOGstreettestset(count,6)=p;
                [~,p] = cmtest2(fixdurationhpdf1,fixdurationhpdf2);
                EOGstreettestset(count,7)=p;
                [~,p] = cmtest2(fixdurationvpdf1,fixdurationvpdf2);
                EOGstreettestset(count,8)=p;
                [~,p] = cmtest2(fixstarthpdf1,fixstarthpdf2);
                EOGstreettestset(count,9)=p;
                [~,p] = cmtest2(fixstartvpdf1,fixstartvpdf2);
                EOGstreettestset(count,10)=p;
                [~,p] = cmtest2(maxhpdf1,maxhpdf2);
                EOGstreettestset(count,11)=p;
                [~,p] = cmtest2(maxvpdf1,maxvpdf2);
                EOGstreettestset(count,12)=p;
                [~,p] = cmtest2(meanhpdf1,meanhpdf2);
                EOGstreettestset(count,13)=p;
                [~,p] = cmtest2(meanvpdf1,meanvpdf2);
                EOGstreettestset(count,14)=p;
                [~,p] = cmtest2(minhpdf1,minhpdf2);
                EOGstreettestset(count,15)=p;
                [~,p] = cmtest2(minvpdf1,minvpdf2);
                EOGstreettestset(count,16)=p;
                [~,p] = cmtest2(sacamplitudehpdf1,sacamplitudehpdf2);
                EOGstreettestset(count,17)=p;
                [~,p] = cmtest2(sacamplitudevpdf1,sacamplitudevpdf2);
                EOGstreettestset(count,18)=p;
                [~,p] = cmtest2(sacdurationhpdf1,sacdurationhpdf2);
                EOGstreettestset(count,19)=p;
                [~,p] = cmtest2(sacdurationvpdf1,sacdurationvpdf2);
                EOGstreettestset(count,20)=p;
                [~,p] = cmtest2(sacstarthpdf1,sacstarthpdf2);
                EOGstreettestset(count,21)=p;
                [~,p] = cmtest2(sacstartvpdf1,sacstartvpdf2);
                EOGstreettestset(count,22)=p;
                [~,p] = cmtest2(blinkstartpdf1,blinkstartpdf2);
                EOGstreettestset(count,23)=p;
                [~,p] = cmtest2(blinkdurationpdf1,blinkdurationpdf2);
                EOGstreettestset(count,24)=p;
                [~,p] = cmtest2(fixcentroidhpdf1,fixcentroidhpdf2);
                EOGstreettestset(count,25)=p;
                [~,p] = cmtest2(fixcentroidvpdf1,fixcentroidvpdf2);
                EOGstreettestset(count,26)=p;
                
                [~,p] = cmtest2(maxdistancehpdf1,maxdistancehpdf2);
                EOGstreettestset(count,27)=p;
                [~,p] = cmtest2(maxdistancevpdf1,maxdistancevpdf2);
                EOGstreettestset(count,28)=p;
                [~,p] = cmtest2(mindistancehpdf1,mindistancehpdf2);
                EOGstreettestset(count,29)=p;
                [~,p] = cmtest2(mindistancevpdf1,mindistancevpdf2);
                EOGstreettestset(count,30)=p;
                [~,p] = cmtest2(slopeophpdf1,slopeophpdf2);
                EOGstreettestset(count,31)=p;
                [~,p] = cmtest2(slopeopvpdf1,slopeopvpdf2);
                EOGstreettestset(count,32)=p;
                [~,p] = cmtest2(slopefphpdf1,slopefphpdf2);
                EOGstreettestset(count,33)=p;
                [~,p] = cmtest2(slopefpvpdf1,slopefpvpdf2);
                EOGstreettestset(count,34)=p;
                [~,p] = cmtest2(slopeonhpdf1,slopeonhpdf2);
                EOGstreettestset(count,35)=p;
                [~,p] = cmtest2(slopeonvpdf1,slopeonvpdf2);
                EOGstreettestset(count,36)=p;
                [~,p] = cmtest2(slopefnhpdf1,slopefnhpdf2);
                EOGstreettestset(count,37)=p;
                [~,p] = cmtest2(slopefnvpdf1,slopefnvpdf2);
                EOGstreettestset(count,38)=p;
                [~,p] = cmtest2(maxderihpdf1,maxderihpdf2);
                EOGstreettestset(count,39)=p;
                [~,p] = cmtest2(maxderivpdf1,maxderivpdf2);
                EOGstreettestset(count,40)=p;
                [~,p] = cmtest2(minderihpdf1,minderihpdf2);
                EOGstreettestset(count,41)=p;
                [~,p] = cmtest2(minderivpdf1,minderivpdf2);
                EOGstreettestset(count,42)=p;
                [~,p] = cmtest2(maxderidistancehpdf1,maxderidistancehpdf2);
                EOGstreettestset(count,43)=p;
                [~,p] = cmtest2(maxderidistancevpdf1,maxderidistancevpdf2);
                EOGstreettestset(count,44)=p;
                [~,p] = cmtest2(minderidistancehpdf1,minderidistancehpdf2);
                EOGstreettestset(count,45)=p;
                [~,p] = cmtest2(minderidistancevpdf1,minderidistancevpdf2);
                EOGstreettestset(count,46)=p;

                EOGstreettestset(count,47)=(subcombs(k,1)~=subcombs(k,2));
                count=count+1;
            end
        end
    end
    save("EOG"+type+"testset"+time+".mat",'EOGstreettestset');
end
