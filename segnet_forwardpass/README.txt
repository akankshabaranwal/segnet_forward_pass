The exact class doesn't get classified properly because no training has been involved and the output is computed with the randomly initialised weights.
[Need to change the file paths in the lenet.m and try.py files]
In caffe folder(where caffe has been installed), run the file try.py.
It will store all the weights in txt format. 
Run lenet.m (code I have written). This will extract the corresponding weights from the generated network (in caffe).
The value of the variables will get stored in variables.mat file. This file can load all the variables into the matlab workspace using the command load('variables.mat').
The images I tested on are attached and are in the image folder.
