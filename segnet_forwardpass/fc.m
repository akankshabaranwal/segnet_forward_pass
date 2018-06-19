function Out=fc(I,W)
Out=zeros(size(W,2),1);
I=permute(I,[2 1 3]);
I1=reshape(I,size(I,1)*size(I,2)*size(I,3),1);
I1=I1';
Out=I1*W;
end