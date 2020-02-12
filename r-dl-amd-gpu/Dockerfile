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
    && python3 pip install --upgrade awscli \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/* \
    && rm -rf /.cache/*