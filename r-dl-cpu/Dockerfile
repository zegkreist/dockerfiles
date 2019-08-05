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
    && apt-get install -y libudunits2-dev libgdal-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

RUN install2.r DALEX mlrMBO smoof DiceKriging rgenoud lhs ParamHelpers  \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*








RUN R -e "webshot::install_phantomjs()" \
    && mv /root/bin/phantomjs /usr/bin/phantomjs \
    && chmod a+rx /usr/bin/phantomjs  \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

## Add LaTeX, rticles and bookdown support
RUN wget "https://travis-bin.yihui.name/texlive-local.deb" \
  && dpkg -i texlive-local.deb \
  && rm texlive-local.deb \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    ## for rJava
    default-jdk \
    ## Nice Google fonts
    fonts-roboto \
    ## used by some base R plots
    ghostscript \
    ## used to build rJava and other packages
    libbz2-dev \
    libicu-dev \
    liblzma-dev \
    ## system dependency of hunspell (devtools)
    libhunspell-dev \
    ## system dependency of hadley/pkgdown
    libmagick++-dev \
    ## rdf, for redland / linked data
    librdf0-dev \
    ## for V8-based javascript wrappers
    libv8-dev \
    ## R CMD Check wants qpdf to check pdf sizes, or throws a Warning
    qpdf \
    ## For building PDF manuals
    texinfo \
    ## for git via ssh key
    ssh \
 ## just because
    less \
    vim \
 ## parallelization
    libzmq3-dev \
    libopenmpi-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  ## Use tinytex for LaTeX installation
  && install2.r --error tinytex \
  ## Admin-based install of TinyTeX:
  && wget -qO- \
    "https://github.com/yihui/tinytex/raw/master/tools/install-unx.sh" | \
    sh -s - --admin --no-path \
  && mv ~/.TinyTeX /opt/TinyTeX \
  && /opt/TinyTeX/bin/*/tlmgr path add \
  && tlmgr install metafont mfware inconsolata tex ae parskip listings \
  && tlmgr path add \
  && Rscript -e "tinytex::r_texmf()" \
  && chown -R root:staff /opt/TinyTeX \
  && chown -R root:staff /usr/local/lib/R/site-library \
  && chmod -R g+w /opt/TinyTeX \
  && chmod -R g+wx /opt/TinyTeX/bin \
  && echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron \
  && install2.r --error PKI   \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

RUN install2.r Matrix.utils  \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

RUN R -e "install.packages(c('webshot'), repos='http://cran.rstudio.com/');devtools::install_github('zegkreist/magikaRp')"  \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*


RUN R -e "devtools::install_github('wesm/feather/R')"  \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

RUN R -e "devtools::install_github('yixuan/prettydoc')"  \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*


RUN echo "#!/usr/bin/with-contenv bash     \   
\n env >> /usr/local/lib/R/etc/Renviron \  
\n## load /etc/environment vars first:   \		  
\n for line in $( cat /etc/environment ) ; do export $line ; done \          
\n exec /usr/lib/rstudio-server/bin/rserver --server-daemonize 0" > /etc/services.d/rstudio/run


RUN apt-get update \
    && apt-get install -y mdbtools \
    && apt-get clean \
    && install2.r Hmisc \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*


 CMD ["/init"]
