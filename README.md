# Filter_Convolution_src
  ImageSize = 5*5*3
  FilterSize = 3*3*3*3 , 3*3*3*3
  NoOfLayers = Conv1,Conv2

# Filter_Convolution_upscale_src
  ImageSize = 224*224*3
  FilterSize = 3*3*3*3 , 3*3*3*3
  NoOfLayers = Conv1,Conv2

# Filter_Convolution_upscale_Filter5_src
  ImageSize = 224*224*3
  FilterSize = 3*3*3*5 , 3*3*3*5
  NoOfLayers = Conv1,Conv2

# Filter_Convolution_upscale_Filter64_src
  ImageSize = 224*224*3
  FilterSize = 3*3*3*64 , 3*3*3*64
  NoOfLayers = Conv1,Conv2

# Conv1_Conv2_Pool1
  ImageSize = 224*224*3
  FilterSize = 3*3*3*64 , 3*3*3*64
  NoOfLayers = Conv1,Conv2
  
