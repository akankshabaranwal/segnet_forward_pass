function y=softmax (x)
x=double(x);
y=exp(x);
temp=sum(y);
y=y/temp;
end