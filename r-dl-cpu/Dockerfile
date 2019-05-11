FROM rocker/rstudio
 

RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils \
    && apt-get install -y python-pip \
    default-jre \
    zlib1g-dev \
    libgit2-dev \
    libstdc++6 \
    libpng-dev \
    libxml2-dev \
    libjpeg-dev \
    unixodbc-dev \
    mariadb-client \
    libmariadbclient-dev \
    libmariadb-client-lgpl-dev \
    git \
    cmake \
    unixodbc \
    && TEMP_DEB="$(mktemp)" \
    && wget -O "$TEMP_DEB" 'https://packages.microsoft.com/debian/9/prod/pool/main/m/msodbcsql17/msodbcsql17_17.2.0.1-1_amd64.deb' \
    && yes | dpkg --skip-same-version -i "$TEMP_DEB" \
    && rm -f "$TEMP_DEB" \
    && wget https://github.com/lakshayg/tensorflow-build/releases/download/tf1.12.0-macOS-mojave-ubuntu16.04-py2-py3/tensorflow-1.12.0-cp27-cp27mu-linux_x86_64.whl \
    && /usr/bin/python --version \
    && python -m pip install tensorflow-1.12.0-cp27-cp27mu-linux_x86_64.whl \
    && python -m pip install keras \
    && rm -f tensorflow-1.12.0-cp27-cp27mu-linux_x86_64.whl \
    && R -e "install.packages(c('Rcpp','odbc', 'tensorflow', 'keras', 'dplyr'), repos='http://cran.rstudio.com/')"  \ 
    && R -e "install.packages(c('stringr','matrixStats' ,'lubridate', 'ggplto2'), repos='http://cran.rstudio.com/')"  \
    && R -e "install.packages(c('data.table', 'RMariaDB','DBI'), repos='http://cran.rstudio.com/')"  \
    && R -e "install.packages(c('FactoMineR', 'moments'), repos='http://cran.rstudio.com/')"  \
    && R -e "install.packages(c('rmarkdown', 'formattable', 'plotly'), repos='http://cran.rstudio.com/')"  \
    && R -e "install.packages(c('flexdashboard', 'DT', 'knitr', 'blogdown'), repos='http://cran.rstudio.com/')"  \
    && R -e "install.packages(c('devtools','arules','hmeasure','caret','shiny','e1071'), repos='http://cran.rstudio.com/')"  \
    && R -e "install.packages(c('shinydashboard', 'leaflet','leaflet.extras','ggmap','shinyWidgets','htmlwidgets','htmltools'), repos='http://cran.rstudio.com/')"  \
    && R -e "install.packages(c('fastrtext','KableExtra', 'pander', 'ggpubr'), repos='http://cran.rstudio.com/')"  \
    && R -e "install.packages(c('tidyverse','shinyjs','arulesViz','threejs', 'tibbletime'), repos='http://cran.rstudio.com/')"  \
    && R -e "install.packages(c('corrplot','earth', 'adabag','randomForest','ROCR','pscl','timeDate', 'testthat'),  repos='http://cran.rstudio.com/')"  \
    && R -e "install.packages('h2o', repos=(c('http://s3.amazonaws.com/h2o-release/h2o/master/1497/R', getOption('repos'))))"\
    && R -e "devtools::install_url('https://github.com/catboost/catboost/releases/download/v0.11.1/catboost-R-Linux-0.11.1.tgz', args = c('--no-multiarch'))"  \
    && R -e "devtools::install_github('ropenscilabs/icon')"  \   
    && R -e "devtools::install_github('JimMcL/JUtils')"  \
    && R -e "install.packages(c('roxygen2'), repos='http://cran.rstudio.com/')"  \
    && R -e "install.packages(c('bsts'), repos='http://cran.rstudio.com/')"  \
    && R -e "devtools::install_github('larmarange/JLutils')" \
    && mkdir tmp_xgboost \ 
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
    && mkdir tmp_lightgbm \
    && cd tmp_lightgbm \
    && git clone --recursive https://github.com/Microsoft/LightGBM \
    && cd LightGBM \
    && Rscript build_r.R \
    && cd .. \
    && cd .. \
    && rm -rf tmp_lightgbm \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*


 EXPOSE 8787



 RUN apt-get update \
    && apt-get install -y libtiff5-dev libgmp3-dev \
    && R -e "install.packages(c('ClusterR', 'survminer', 'kableExtra', 'ggridges', 'forecast'),  repos='http://cran.rstudio.com/')"  \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

RUN install2.r DescTools

RUN apt-get update \
    && apt-get install -y libudunits2-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

 CMD ["/init"]
