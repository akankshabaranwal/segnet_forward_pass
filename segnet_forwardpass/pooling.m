function Ou=pooling (I,w,stride)
row=size(I,1);
col=size(I,2);
Ou=zeros(floor(((row-w)/stride)+1),floor(((col-w)/stride))+1,size(I,3));
for i=1:stride:row-w+1
  for j=1:stride:col-w+1
      temp=I(i:i+w-1,j:j+w-1,:);
      Ou(ceil(i/stride),ceil(j/stride),:)=max(max(temp));
   end
end
end