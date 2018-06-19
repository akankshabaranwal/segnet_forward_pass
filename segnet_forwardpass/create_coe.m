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
%d1_In1=reshape(In(1,1,:,:),360,480);
%d2_In1=reshape(In(1,2,:,:),360,480);
%d3_In1=reshape(In(1,3,:,:),360,480);
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
%d1_w1=reshape(Wt(1,1,:,:),3,3);
%d2_w1=reshape(Wt(1,2,:,:),3,3);
%d3_w1=reshape(Wt(1,3,:,:),3,3);

d1_In1=padarray(d1_In1,[1 1]);
d2_In1=padarray(d2_In1,[1 1]);
d3_In1=padarray(d3_In1,[1 1]);

d1_O1=d1_In1(1:3,1:3).*d1_w1;
d2_O1=d2_In1(1:3,1:3).*d2_w1;
d3_O1=d3_In1(1:3,1:3).*d3_w1;
Out1=sum(sum(d1_O1))+sum(sum(d2_O1))+sum(sum(d3_O1))+b(1);