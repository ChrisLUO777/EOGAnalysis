subname=["Anh" "Luo" "Yi"];
for name=subname
    path="EOG"+name+"fix";
    type="fix";
    for i=1:10
        load(".\"+name+"\"+path+i+"\EOG"+name+type+i+"20s.mat");
        CWTcoeffsh = cwt(data20s(:,1),1:128,'haar');%haar tranform, scale=20
        CWTcoeffsv = cwt(data20s(:,2),1:128,'haar');
        cwth=CWTcoeffsh(20,:);
        cwtv=CWTcoeffsv(20,:);
        thsd=0.02+0.02*rand(1);
        sacrangeh=[];
        sacrangev=[];
        saccounth=0;
        saccountv=0;
        fixcounth=0;
        fixcountv=0;
        for m=1:size(cwth,2)
            if(cwth(m)>thsd||cwth(m)<-thsd)
                if(fixcounth>0)
                    saccounth=saccounth+fixcounth;
                    fixcounth=0;
                end
                saccounth=saccounth+1;
            elseif(cwth(m)<=thsd&&cwth(m)>=-thsd)
                fixcounth=fixcounth+1;
                if(fixcounth>40)
                    if(saccounth>4)
                        sacrangeh=[sacrangeh;m-fixcounth-saccounth m-fixcounth];
                    end
                    saccounth=0;
                    fixcounth=0;
                end
            end
        end
        
        for n=1:size(cwtv,2)
            if(cwtv(n)>thsd||cwtv(n)<-thsd)
                if(fixcountv>0)
                    saccountv=saccountv+fixcountv;
                    fixcountv=0;
                end
                saccountv=saccountv+1;
            elseif(cwtv(n)<=thsd&&cwtv(n)>=-thsd)
                fixcountv=fixcountv+1;
                if(fixcountv>40)
                    if(saccountv>4)
                        sacrangev=[sacrangev;n-fixcountv-saccountv n-fixcountv];
                    end
                    saccountv=0;
                    fixcountv=0;
                end
            end
        end
        save(".\"+name+"\"+path+i+"\EOG"+name+type+i+"groundtruthh.mat",'sacrangeh');
        save(".\"+name+"\"+path+i+"\EOG"+name+type+i+"groundtruthv.mat",'sacrangev');
    end
end
