FROM rocm/tensorflow

## INSTALL R-BASE
RUN apt-get update \
    && apt-get install -y r-base \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/* \
    && rm -rf /.cache/*


## INSTALL KERAS
RUN python3 -m pip install \
    h5py==2.9.0 \
    keras==2.2.4 \
    --no-cache-dir

## Install AWS CLI
RUN apt-get update \
    && apt-get install -y \
     groff \
    && python3 -m pip install --upgrade awscli \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/* \
    && rm -rf /.cache/*


RUN apt-get update \
    && apt-get install -y cmake flex bison make clang \
    && git clone --branch apache-arrow-0.15.0 https://github.com/apache/arrow/ \
    && cd arrow/cpp \
    && mkdir release \
    && cd release \
    && cmake .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DARROW_BOOST_USE_SHARED:BOOL=Off \
      -DARROW_PARQUET=ON \
    && make \
    && make install