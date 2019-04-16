
FROM rocker/cuda-dev:3.5.2

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget cmake libboost-dev libboost-system-dev libboost-filesystem-dev && \
    git clone --recursive --branch v0.81 https://github.com/dmlc/xgboost && \
    mkdir -p xgboost/build && cd xgboost/build && \
    cmake .. -DUSE_CUDA=ON -DR_LIB=ON -DUSE_NCCL=ON && \
    make install -j$(nproc)


RUN cd /usr/local/src && mkdir lightgbm && cd lightgbm && \
    git clone --recursive https://github.com/Microsoft/LightGBM && \
    cd LightGBM && mkdir build && cd build && \
    cmake -DUSE_GPU=1 -DOpenCL_LIBRARY=/usr/local/cuda/lib64/libOpenCL.so -DOpenCL_INCLUDE_DIR=/usr/local/cuda/include/ .. && \ 
    make OPENCL_HEADERS=/usr/local/cuda-9.0/targets/x86_64-linux/include LIBOPENCL=/usr/local/cuda-9.0/targets/x86_64-linux/lib


FROM rocker/tensorflow-gpu:3.5.2

# Python Xgboost for CPU
#RUN pip3 install \
#    wheel==0.33.0 \
#    setuptools==40.8.0 \
#    scipy==1.2.1 \
#    tensorflow-probability==0.5.0 --upgrade

#RUN apt-get update && apt-get -y install wget && \
#  wget https://s3-us-west-2.amazonaws.com/xgboost-wheels/xgboost-0.81-py2.py3-none-manylinux1_x86_64.whl && \
#  pip3 install  xgboost-0.81-py2.py3-none-manylinux1_x86_64.whl && \
#  rm xgboost-0.81-py2.py3-none-manylinux1_x86_64.whl && \
#  apt-get remove --purge -y wget && \
#  rm -rf /var/lib/apt/lists/*

COPY --from=0 /usr/local/lib/R/site-library/xgboost /usr/local/lib/R/site-library/xgboost

#COPY --from=0 /usr/local/lib/R/site-library/lightgbm /usr/local/lib/R/site-library/lightgbm

#RUN apt-get update && apt-get install -y --no-install-recommends cmake \
#    ocl-icd-libopencl1 ocl-icd-opencl-dev libboost-dev libboost-system-dev libboost-filesystem-dev \
 #   && git clone --recursive https://github.com/Microsoft/LightGBM \
  #  && cd LightGBM \
   # && sed -i '3s/.*/use_gpu <- T/' R-package/src/install.libs.R \
   # && Rscript build_r.R

# Get Java (for h2o R package)
RUN apt-get update -qq && \
    apt-get -y --no-install-recommends install \
      default-jdk \
      default-jre && \
    R CMD javareconf \
    && R -e "devtools::install_url('https://github.com/catboost/catboost/releases/download/v0.14.1/catboost-R-Linux-0.14.1.tgz', args = c('--no-multiarch'))"  \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

## h2o requires Java
RUN install2.r h2o greta

RUN mkdir tmp_h2o \
    && cd tmp_h2o \
    && wget https://s3.amazonaws.com/h2o-release/h2o4gpu/releases/stable/ai/h2o/h2o4gpu/0.3-cuda9/h2o4gpu-0.3.1.10000-cp36-cp36m-linux_ppc64le.whl \
    && pip install h2o4gpu-0.3.1.10000-cp36-cp36m-linux_ppc64le.whl\
    && cd .. \
    && rm -rf tmp_h2o \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

RUN install2.r h2o4gpu \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*
