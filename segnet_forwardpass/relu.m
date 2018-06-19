function output=relu(input)
output=input;
for i=1:size(input,1)
    for j=1:size(input,2)
        for k=1:size(input,3)
            if input(i,j,k)<0
                output(i,j,k)=0;
            end
        end
    end
end
end