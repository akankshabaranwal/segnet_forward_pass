clc;
clear;
In=importdata('/home/akanksha/caffe-params/after_bn/conv1_1_input.mat');
Wt=importdata('/home/akanksha/caffe-params/after_bn/conv1_1_weight.mat');
b=importdata('/home/akanksha/caffe-params/after_bn/conv1_1_bias.mat');
d1_In1=zeros(360,480);
d2_In1=zeros(360,480);
d3_In1=zeros(360,480);
for i=1:360
    for j=1:480
        d1_In1(i,j)=In(1,1,i,j);
        d2_In1(i,j)=In(1,2,i,j);
        d3_In1(i,j)=In(1,3,i,j);
    end
end
d1_w1=zeros(3,3);
d2_w1=zeros(3,3);
d3_w1=zeros(3,3);

for i=1:3
    for j=1:3
        d1_w1(i,j)=Wt(1,1,i,j);
        d2_w1(i,j)=Wt(1,2,i,j);
        d3_w1(i,j)=Wt(1,3,i,j);
    end
end

d1_In1=padarray(d1_In1,[1 1]);
d2_In1=padarray(d2_In1,[1 1]);
d3_In1=padarray(d3_In1,[1 1]);

fid = fopen('conv1_1_in_d1.coe','w');
fprintf(fid,'memory_initialization_radix=2;\nmemory_initialization_vector=\n');
for i=1:362
    for j=1:482
        result=decimal2float(d1_In1(i,j));
        for k=1:16
        fprintf(fid, '%d',result(k));
        end
        if((i==362) && (j==482))
        fprintf(fid,';');    
        else
        fprintf(fid,',\n');
        end
    end
end