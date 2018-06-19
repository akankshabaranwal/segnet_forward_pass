function answer=decimal2float(number)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% getting first bit
if(number >= 0)
    answer(1)=0;
else
    answer(1)=1;
end
number = abs(number);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculating next 5 bits
intermediate = number;
x = floor(log2(intermediate))+15;
a = fliplr(de2bi(x));
answer(2:6) = [zeros(5-size(a,2))' a];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculating last 10 bits
integer = floor(number);
temp = fliplr(de2bi(integer));
endvalue = 5+size(temp,2);
answer(7:endvalue) = temp(2:end);
remain = number - integer;
for i=endvalue+1:16
    remain=remain*2;
    answer(i)=floor(remain);
    remain = remain - floor(remain);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%