function [subcombine] = combinesubs(subs1,subs2,len)
    count=1;
    for i=1:len
        for j=1:len
            subcombine(count,1)=subs1(1,i);
            subcombine(count,2)=subs2(1,j);
            count=count+1;
        end
    end
end