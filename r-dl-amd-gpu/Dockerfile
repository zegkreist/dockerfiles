FROM rocm/tensorflow

## INSTALL R-BASE
RUN apt-get update \
    && apt-get install -y r-base \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/* \
    && rm -rf /.cache/*

