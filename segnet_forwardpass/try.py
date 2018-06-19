import numpy as np
import matplotlib.pyplot as plt
from PIL import Image
import caffe
caffe.set_mode_cpu()
net = caffe.Net('./examples/mnist/lenet1.prototxt', caffe.TEST)
im=np.array(Image.open('examples/images/data2/mnist_0_1.jpg'))
im_input = im[np.newaxis, np.newaxis, :, :]
net.blobs['data'].reshape(*im_input.shape)
net.blobs['data'].data[...] = im_input
net.forward()

#input image
I=net.blobs['data'].data;
I.tofile('image.txt',sep=" ",format="%s");

#convolution layer1
W1=net.params['conv1'][0].data;
b1=net.params['conv1'][1].data;
O1=net.blobs['conv1'].data;
W1.tofile('conv1W.txt',sep=" ",format="%s");
O1.tofile('conv1O.txt',sep=" ",format="%s");

#pooling layer1
O2= net.blobs['pool1'].data;
O2.tofile('pool1O.txt',sep=" ",format="%s");

#convolution layer2
W2=net.params['conv2'][0].data;
b2=net.params['conv2'][1].data;
O3=net.blobs['conv2'].data;
W2.tofile('conv2W.txt',sep=" ",format="%s");
O3.tofile('conv2O.txt',sep=" ",format="%s");

#pooling layer2
O4= net.blobs['pool2'].data;
O4.tofile('pool2O.txt',sep=" ",format="%s");

#inner product layer1
IP1=net.params['ip1'][0].data;
bP1=net.params['ip1'][1].data;
O5=net.blobs['ip1'].data;
IP1.tofile('IP1W.txt',sep=" ",format="%s");
O5.tofile('IP1O.txt',sep=" ",format="%s");

#relu layer
#O6=net.blobs['relu1'].data;

#inner product layer2
IP2=net.params['ip2'][0].data;
bP2=net.params['ip2'][1].data;
O7=net.blobs['ip2'].data;
IP2.tofile('IP2W.txt',sep=" ",format="%s");
O7.tofile('IP2O.txt',sep=" ",format="%s");

#softmax layer
O8=net.blobs['prob'].data;
O8.tofile('prob.txt',sep=" ",format="%s");
