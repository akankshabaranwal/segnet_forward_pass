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

import matplotlib.pyplot as plt
from PIL import Image

caffe.set_mode_gpu()
net = caffe.Net('./small.prototxt', caffe.TEST)
#im=np.array(Image.open('./test.jpg'))
#im_input = im[np.newaxis, np.newaxis, :, :]
#net.blobs['data'].reshape(*im_input.shape)
#net.blobs['data'].data[...] = im_input
#net.forward()
image_path = './testbig.jpg'
frame = cv2.imread(image_path)
input_image = frame.transpose((2,0,1))
input_image = np.asarray([input_image])
start=time.clock()
out = net.forward_all(data=input_image)
print time.clock()-start
