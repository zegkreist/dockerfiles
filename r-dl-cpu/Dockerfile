FROM rocker/rstudio
 

RUN apt-get update \
    && apt-get install -y python-pip \
    default-jre \
    zlib1g-dev \
    libgit2-dev \
    libstdc++6 \
    libpng-dev \
    libxml2-dev \
    libjpeg-dev \
#    libgcc \
    mariadb-client \
    libmariadbclient-dev \
    libmariadb-client-lgpl-dev \
    git \
#    && update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*





RUN wget https://github.com/lakshayg/tensorflow-build/releases/download/tf1.12.0-macOS-mojave-ubuntu16.04-py2-py3/tensorflow-1.12.0-cp27-cp27mu-linux_x86_64.whl \
    && /usr/bin/python --version \
#    && pip3 install --upgrade pip \ && python -m pip3 install tensorflow-1.12.0-cp36-cp36m-linux_x86_64.whl \
    && python -m pip install tensorflow-1.12.0-cp27-cp27mu-linux_x86_64.whl \
    && python -m pip install keras \
#    && rm -f tensorflow-1.12.0-cp36-cp36m-linux_x86_64.whl \
    && rm -f tensorflow-1.12.0-cp27-cp27mu-linux_x86_64.whl \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*


 RUN R -e "install.packages(c('Rcpp', 'tensorflow', 'keras', 'dplyr'), repos='http://cran.rstudio.com/')" && \
    R -e "install.packages(c('stringr', 'lubridate', 'ggplto2'), repos='http://cran.rstudio.com/')" && \
    R -e "install.packages(c('data.table', 'RMariaDB','DBI'), repos='http://cran.rstudio.com/')" && \
    R -e "install.packages(c('keras', 'FactoMineR', 'moments'), repos='http://cran.rstudio.com/')" && \
    R -e "install.packages(c('rmarkdown', 'formattable', 'plotly'), repos='http://cran.rstudio.com/')" && \
    R -e "install.packages(c('flexdashboard', 'DT', 'knitr', 'blogdown'), repos='http://cran.rstudio.com/')" && \
    R -e "install.packages(c('devtools','arules','hmeasure','caret','shiny','e1071'), repos='http://cran.rstudio.com/')" && \
    R -e "install.packages(c('shinydashboard', 'leaflet','leaflet.extras','ggmap','shinyWidgets','htmlwidgets','htmltools'), repos='http://cran.rstudio.com/')" && \
    R -e "install.packages(c('fastrtext','KableExtra', 'pander', 'ggpubr'), repos='http://cran.rstudio.com/')" && \
    R -e "install.packages(c('tidyverse','shinyjs', 'Matrix.utils','arulesViz','threejs', 'tibbletime'), repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('h2o', repos=(c('http://s3.amazonaws.com/h2o-release/h2o/master/1497/R', getOption('repos'))))"\
    R -e "devtools::install_url('https://github.com/catboost/catboost/releases/download/v0.11.1/catboost-R-Linux-0.11.1.tgz', args = c('--no-multiarch'))" && \
    R -e "devtools::install_github('ropenscilabs/icon')" && \   
    R -e "devtools::install_github('JimMcL/JUtils')" && \
    apt-get clean && \
    rm -rf /var/lib/apt/* && \
    rm -rf /tmp/*

RUN mkdir tmp_xgboost \
    && cd tmp_xgboost \
    && git clone --recursive https://github.com/dmlc/xgboost \
    && cd xgboost \
    && git submodule init \
    && git submodule update \
    && cd R-package \
    && R CMD INSTALL . \
    && cd .. \
    && cd .. \
    && cd .. \
    && rm -rf tmp_xgboost \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

 EXPOSE 8787


 CMD ["/init"]
 
