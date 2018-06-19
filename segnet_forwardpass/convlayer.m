function Ou=convlayer (I,stride,pad,b,W)
        
    row=size(I,1);
    col=size(I,2);
    w=size(W,1);
    Ou=zeros(floor(((row+2*pad-w)/stride)+1),floor(((col+2*pad-w)/stride))+1,size(W,4));
    if size(I,3)~=size(W,3)
        disp('error');
        return;
    end
    %outrow=floor(((row-w+(2*pad))/stride)+1);
    outcol=floor(((col-w+(2*pad))/stride)+1);
    row=row+2*pad;
    col=col+2*pad;
    I=padarray(I,[pad pad]);
    ll=1;
    kk=1;
    indepth=size(I,3);
    for k=1:size(W,4)
        for i=1:stride:row-w+1
            for j=1:stride:col-w+1
                %temp=W(:,:,:,k);
              %  I(i:i+w-1,j:j+w-1,:)
                %temp=permute(temp,[1 2 3]);
                %Ou(ceil(i/stride),ceil(j/stride),k)=sum(sum(sum(I(i:i+w-1,j:j+w-1,:).*temp)))+b(k);
                temp_sum=0;
                for mm=i:i+w-1
                    for nn=j:j+w-1
                        for oo=1:indepth
                           temp_sum=temp_sum+I(mm,nn,oo)*W(mm-i+1,nn-j+1,oo,k);
                           %mm-i+1
                           %nn-j+1
                           %oo
                           %k
                  %temp(mm-i+1,nn-j+1,oo,k);
                  %I(mm,nn,oo);
                   
                        end
                    end
                end
               % ll
                %kk
                %temp_sum+1
                Ou(ll,kk,k)=temp_sum+b(k);
                kk=kk+1;
                if(kk==outcol+1)
                    kk=1;
                    ll=ll+1;
                end
                
            end
        end
    end
end