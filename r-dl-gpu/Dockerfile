
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


COPY --from=0 /usr/local/lib/R/site-library/xgboost /usr/local/lib/R/site-library/xgboost




RUN apt-get update -qq && \
    apt-get -y --no-install-recommends install  python3-pip\
      default-jdk \
      default-jre && \
    R CMD javareconf \
    && R -e "devtools::install_url('https://github.com/catboost/catboost/releases/download/v0.14.1/catboost-R-Linux-0.14.1.tgz', args = c('--no-multiarch'))"  \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

RUN install2.r h2o greta



ARG BUILDDIR="/tmp/build"
ARG PYTHON_VER="3.6.8"
WORKDIR ${BUILDDIR}

RUN apt-get update -qq  \
    && apt-get upgrade -y  > /dev/null 2>&1  \
    && apt-get install -y wget build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev > /dev/null 2>&1  \
    && wget --quiet https://www.python.org/ftp/python/${PYTHON_VER}/Python-${PYTHON_VER}.tgz > /dev/null 2>&1  \
    && tar zxf Python-${PYTHON_VER}.tgz  \
    && cd Python-${PYTHON_VER}  \
    && ./configure --with-ensurepip=install --enable-optimizations --enable-shared   \
    && make > /dev/null 2>&1  \
    && make install > /dev/null 2>&1  \
    && rm -rf ${BUILDDIR} 




RUN rm /usr/bin/lsb_release




RUN ln -s  /usr/local/lib/libpython3.6m.so.1.0  /usr/lib/libpython3.6m.so.1.0 \
    && export LD_LIBRARY_PATH=/usr/local/lib/libpython3.6m.so.1.0:$LD_LIBRARY_PATH \
    && export PATH=/usr/local/bin/python3.6:$PATH \
    && update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.6 60\
    && update-alternatives --config python3



# Python Xgboost for CPU
RUN python3 -m pip install \
    wheel==0.33.0 \
    setuptools==40.8.0 \
    scipy==1.2.1 \
    tensorflow-probability==0.5.0 --upgrade



RUN mkdir tmp_h2o \
    && cd tmp_h2o \
    && wget https://s3.amazonaws.com/h2o-release/h2o4gpu/releases/stable/ai/h2o/h2o4gpu/0.3-cuda9/h2o4gpu-0.3.1.10000-cp36-cp36m-linux_x86_64.whl \
    && python3 -m pip  install h2o4gpu-0.3.1.10000-cp36-cp36m-linux_x86_64.whl\
    && cd .. \
    && rm -rf tmp_h2o \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

RUN cd .. && cd .. && cd .. \
    && install2.r reticulate h2o4gpu \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*


RUN python3 -m pip install \
    h5py==2.9.0 \
    pyyaml==3.13 \
    requests==2.21.0 \
    Pillow==5.4.1 \
    tensorflow-gpu==1.12.0 \
    keras==2.2.4 \
    --no-cache-dir \
   && install2.r keras

RUN chmod 777 /usr

RUN echo "\nTENSORFLOW_PYTHON=/usr/local/bin/python3.6 \n RETICULATE_PYTHON=/usr/local/bin/python3.6 \n" >>   /usr/local/lib/R/etc/Renviron


RUN install2.r data.table dplyr ggplot2 ClusterR

RUN install2.r caret ROCR e1071 fastrtext


RUN apt-get update \
    && apt-get install -y libudunits2-dev libgdal-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

RUN install2.r DescTools DALEX


