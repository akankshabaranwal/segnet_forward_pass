import numpy as np
import os
import os.path
import matplotlib.pyplot as plt
import scipy
import argparse
import math
import cv2
import sys
import time
from PIL import Image
caffe_root = '/home/akanksha/caffe-segnet/'
sys.path.insert(0, caffe_root + 'python')
import caffe

#python IIIT_test.py ../Example_Models/segnet_model_driving_webdemo.prototxt --weights ../Models/segnet_weights_driving_webdemo.caffemodel --colours camvid12.png 

caffe.set_mode_gpu()
net = caffe.Net('../Example_Models/segnet_model_driving_webdemo.prototxt','../Models/segnet_weights_driving_webdemo.caffemodel', caffe.TEST)
image_path = '/home/akanksha/caffe-segnet/Segnet/CamVid/input/test.png'
frame = cv2.imread(image_path)
input_image = frame.transpose((2,0,1))
input_image = np.asarray([input_image])
out = net.forward_all(data=input_image)

#[(k, v.data.shape) for k, v in net.blobs.items()]
#input image
I=net.blobs['data'].data;
I.tofile('image.txt',sep=" ",format="%s");

#conv1_1
W1=net.params['conv1_1'][0].data;
b1=net.params['conv1_1'][1].data;
O1=net.blobs['conv1_1'].data;
W1.tofile('conv1_1W.txt',sep=" ",format="%s");
O1.tofile('conv1_1O.txt',sep=" ",format="%s");
b1.tofile('conv1_1b.txt',sep=" ",format="%s");

#conv1_2
W1=net.params['conv1_2'][0].data;
b1=net.params['conv1_2'][1].data;
O1=net.blobs['conv1_2'].data;
W1.tofile('conv1_2W.txt',sep=" ",format="%s");
O1.tofile('conv1_2O.txt',sep=" ",format="%s");
b1.tofile('conv1_2b.txt',sep=" ",format="%s");

#pool1
O1=net.blobs['pool1'].data;
O1.tofile('pool1O.txt',sep=" ",format="%s");

#pool1mask
O1=net.blobs['pool1_mask'].data;
O1.tofile('pool1_maskO.txt',sep=" ",format="%s");

#conv2_1
W1=net.params['conv2_1'][0].data;
b1=net.params['conv2_1'][1].data;
O1=net.blobs['conv2_1'].data;
W1.tofile('conv2_1W.txt',sep=" ",format="%s");
O1.tofile('conv2_1O.txt',sep=" ",format="%s");
b1.tofile('conv2_1b.txt',sep=" ",format="%s");

#conv2_2
W1=net.params['conv2_2'][0].data;
b1=net.params['conv2_2'][1].data;
O1=net.blobs['conv2_2'].data;
W1.tofile('conv2_2W.txt',sep=" ",format="%s");
O1.tofile('conv2_2O.txt',sep=" ",format="%s");
b1.tofile('conv2_2b.txt',sep=" ",format="%s");

#pool2
O1=net.blobs['pool2'].data;
O1.tofile('pool2O.txt',sep=" ",format="%s");

#pool2mask
O1=net.blobs['pool2_mask'].data;
O1.tofile('pool2_maskO.txt',sep=" ",format="%s");

#conv3_1
W1=net.params['conv3_1'][0].data;
b1=net.params['conv3_1'][1].data;
O1=net.blobs['conv3_1'].data;
W1.tofile('conv3_1W.txt',sep=" ",format="%s");
O1.tofile('conv3_1O.txt',sep=" ",format="%s");
b1.tofile('conv3_1b.txt',sep=" ",format="%s");

#conv3_2
W1=net.params['conv3_2'][0].data;
b1=net.params['conv3_2'][1].data;
O1=net.blobs['conv3_2'].data;
W1.tofile('conv3_2W.txt',sep=" ",format="%s");
O1.tofile('conv3_2O.txt',sep=" ",format="%s");
b1.tofile('conv3_2b.txt',sep=" ",format="%s");

#conv3_3
W1=net.params['conv3_3'][0].data;
b1=net.params['conv3_3'][1].data;
O1=net.blobs['conv3_3'].data;
W1.tofile('conv3_3W.txt',sep=" ",format="%s");
O1.tofile('conv3_3O.txt',sep=" ",format="%s");
b1.tofile('conv3_3b.txt',sep=" ",format="%s");

#pool3
O1=net.blobs['pool3'].data;
O1.tofile('pool3O.txt',sep=" ",format="%s");

#pool3mask
O1=net.blobs['pool3_mask'].data;
O1.tofile('pool3_maskO.txt',sep=" ",format="%s");

#conv4_1
W1=net.params['conv4_1'][0].data;
b1=net.params['conv4_1'][1].data;
O1=net.blobs['conv4_1'].data;
W1.tofile('conv4_1W.txt',sep=" ",format="%s");
O1.tofile('conv4_1O.txt',sep=" ",format="%s");
b1.tofile('conv4_1b.txt',sep=" ",format="%s");

#conv4_2
W1=net.params['conv4_2'][0].data;
b1=net.params['conv4_2'][1].data;
O1=net.blobs['conv4_2'].data;
W1.tofile('conv4_2W.txt',sep=" ",format="%s");
O1.tofile('conv4_2O.txt',sep=" ",format="%s");
b1.tofile('conv4_2b.txt',sep=" ",format="%s");

#conv4_3
W1=net.params['conv4_3'][0].data;
b1=net.params['conv4_3'][1].data;
O1=net.blobs['conv4_3'].data;
W1.tofile('conv4_3W.txt',sep=" ",format="%s");
O1.tofile('conv4_3O.txt',sep=" ",format="%s");
b1.tofile('conv4_3b.txt',sep=" ",format="%s");

#pool4
O1=net.blobs['pool4'].data;
O1.tofile('pool4O.txt',sep=" ",format="%s");

#pool4mask
O1=net.blobs['pool4_mask'].data;
O1.tofile('pool4_maskO.txt',sep=" ",format="%s");

#conv5_1
W1=net.params['conv5_1'][0].data;
b1=net.params['conv5_1'][1].data;
O1=net.blobs['conv5_1'].data;
W1.tofile('conv5_1W.txt',sep=" ",format="%s");
O1.tofile('conv5_1O.txt',sep=" ",format="%s");
b1.tofile('conv5_1b.txt',sep=" ",format="%s");

#conv5_2
W1=net.params['conv5_2'][0].data;
b1=net.params['conv5_2'][1].data;
O1=net.blobs['conv5_2'].data;
W1.tofile('conv5_2W.txt',sep=" ",format="%s");
O1.tofile('conv5_2O.txt',sep=" ",format="%s");
b1.tofile('conv5_2b.txt',sep=" ",format="%s");

#conv5_3
W1=net.params['conv5_3'][0].data;
b1=net.params['conv5_3'][1].data;
O1=net.blobs['conv5_3'].data;
W1.tofile('conv5_3W.txt',sep=" ",format="%s");
O1.tofile('conv5_3O.txt',sep=" ",format="%s");
b1.tofile('conv5_3b.txt',sep=" ",format="%s");

#pool5
O1=net.blobs['pool5'].data;
O1.tofile('pool5O.txt',sep=" ",format="%s");

#pool5mask
O1=net.blobs['pool5_mask'].data;
O1.tofile('pool5_maskO.txt',sep=" ",format="%s");

#pool5_D
O1=net.blobs['pool5_D'].data;
O1.tofile('pool5_DO.txt',sep=" ",format="%s");

#conv5_3_D
W1=net.params['conv5_3_D'][0].data;
b1=net.params['conv5_3_D'][1].data;
O1=net.blobs['conv5_3_D'].data;
W1.tofile('conv5_3_DW.txt',sep=" ",format="%s");
O1.tofile('conv5_3_DO.txt',sep=" ",format="%s");
b1.tofile('conv5_3_Db.txt',sep=" ",format="%s");

#conv5_2_D
W1=net.params['conv5_2_D'][0].data;
b1=net.params['conv5_2_D'][1].data;
O1=net.blobs['conv5_2_D'].data;
W1.tofile('conv5_2_DW.txt',sep=" ",format="%s");
O1.tofile('conv5_2_DO.txt',sep=" ",format="%s");
b1.tofile('conv5_2_Db.txt',sep=" ",format="%s");

#conv5_1_D
W1=net.params['conv5_1_D'][0].data;
b1=net.params['conv5_1_D'][1].data;
O1=net.blobs['conv5_1_D'].data;
W1.tofile('conv5_1_DW.txt',sep=" ",format="%s");
O1.tofile('conv5_1_DO.txt',sep=" ",format="%s");
b1.tofile('conv5_1_Db.txt',sep=" ",format="%s");

#pool4_D
O1=net.blobs['pool4_D'].data;
O1.tofile('pool4_DO.txt',sep=" ",format="%s");

#conv4_3_D
W1=net.params['conv4_3_D'][0].data;
b1=net.params['conv4_3_D'][1].data;
O1=net.blobs['conv4_3_D'].data;
W1.tofile('conv4_3_DW.txt',sep=" ",format="%s");
O1.tofile('conv4_3_DO.txt',sep=" ",format="%s");
b1.tofile('conv4_3_Db.txt',sep=" ",format="%s");

#conv4_2_D
W1=net.params['conv4_2_D'][0].data;
b1=net.params['conv4_2_D'][1].data;
O1=net.blobs['conv4_2_D'].data;
W1.tofile('conv4_2_DW.txt',sep=" ",format="%s");
O1.tofile('conv4_2_DO.txt',sep=" ",format="%s");
b1.tofile('conv4_2_Db.txt',sep=" ",format="%s");

#conv4_1_D
W1=net.params['conv4_1_D'][0].data;
b1=net.params['conv4_1_D'][1].data;
O1=net.blobs['conv4_1_D'].data;
W1.tofile('conv4_1_DW.txt',sep=" ",format="%s");
O1.tofile('conv4_1_DO.txt',sep=" ",format="%s");
b1.tofile('conv4_1_Db.txt',sep=" ",format="%s");

#pool3_D
O1=net.blobs['pool3_D'].data;
O1.tofile('pool3_DO.txt',sep=" ",format="%s");

#conv3_3_D
W1=net.params['conv3_3_D'][0].data;
b1=net.params['conv3_3_D'][1].data;
O1=net.blobs['conv3_3_D'].data;
W1.tofile('conv3_3_DW.txt',sep=" ",format="%s");
O1.tofile('conv3_3_DO.txt',sep=" ",format="%s");
b1.tofile('conv3_3_Db.txt',sep=" ",format="%s");

#conv3_2_D
W1=net.params['conv3_2_D'][0].data;
b1=net.params['conv3_2_D'][1].data;
O1=net.blobs['conv3_2_D'].data;
W1.tofile('conv3_2_DW.txt',sep=" ",format="%s");
O1.tofile('conv3_2_DO.txt',sep=" ",format="%s");
b1.tofile('conv3_2_Db.txt',sep=" ",format="%s");

#conv3_1_D
W1=net.params['conv3_1_D'][0].data;
b1=net.params['conv3_1_D'][1].data;
O1=net.blobs['conv3_1_D'].data;
W1.tofile('conv3_1_DW.txt',sep=" ",format="%s");
O1.tofile('conv3_1_DO.txt',sep=" ",format="%s");
b1.tofile('conv3_1_Db.txt',sep=" ",format="%s");

#pool2_D
O1=net.blobs['pool2_D'].data;
O1.tofile('pool2_DO.txt',sep=" ",format="%s");

#conv2_2_D
W1=net.params['conv2_2_D'][0].data;
b1=net.params['conv2_2_D'][1].data;
O1=net.blobs['conv2_2_D'].data;
W1.tofile('conv2_2_DW.txt',sep=" ",format="%s");
O1.tofile('conv2_2_DO.txt',sep=" ",format="%s");
b1.tofile('conv2_2_Db.txt',sep=" ",format="%s");

#conv2_1_D
W1=net.params['conv2_1_D'][0].data;
b1=net.params['conv2_1_D'][1].data;
O1=net.blobs['conv2_1_D'].data;
W1.tofile('conv2_1_DW.txt',sep=" ",format="%s");
O1.tofile('conv2_1_DO.txt',sep=" ",format="%s");
b1.tofile('conv2_1_Db.txt',sep=" ",format="%s");

#pool1_D
O1=net.blobs['pool1_D'].data;
O1.tofile('pool1_DO.txt',sep=" ",format="%s");

#conv1_2_D
W1=net.params['conv1_2_D'][0].data;
b1=net.params['conv1_2_D'][1].data;
O1=net.blobs['conv1_2_D'].data;
W1.tofile('conv1_2_DW.txt',sep=" ",format="%s");
O1.tofile('conv1_2_DO.txt',sep=" ",format="%s");
b1.tofile('conv1_2_Db.txt',sep=" ",format="%s");

#conv1_1_D
W1=net.params['conv1_1_D'][0].data;
b1=net.params['conv1_1_D'][1].data;
O1=net.blobs['conv1_1_D'].data;
W1.tofile('conv1_1_DW.txt',sep=" ",format="%s");
O1.tofile('conv1_1_DO.txt',sep=" ",format="%s");
b1.tofile('conv1_1_Db.txt',sep=" ",format="%s");
