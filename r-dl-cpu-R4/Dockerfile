FROM rocker/r-ver:4.0.0

RUN /rocker_scripts/install_rstudio.sh daily

RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils \
    default-jre \
    zlib1g-dev \
    libgit2-dev \
    libstdc++6 \
    libpng-dev \
    libxml2-dev \
    libjpeg-dev \
    git \
    cmake \
    awscli \
    unixodbc \
    libtiff5-dev libgmp3-dev \
    unixodbc-dev \
    mariadb-client \
    libmariadbclient-dev \
    libmariadb-client-lgpl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/* \
    && rm -rf /.cache/*

RUN install2. Rcpp odbc tensorflow keras dplyr stringi stringr \
    matrixStats lubridate ggplot2 data.table FactoMineR  DBI \
    moments shiny knitr rmarkdown formattable plotly flexdashboard DT \
    blogdown devtools arules hmeasure e1071 shinydashboard \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/* \
    && rm -rf /.cache/*
    
RUN install2.r leaflet leaflet.extras ggmap shinyWidgets htmltools htmlwidgets \
    fastrtext KableExtra pander ggpubr shinyjs arulesViz threejs tibbletime \
    corrplot earth adabag randomForest ROCR pscl timeDate testthat \
    h2o catboost roxygen2 bsts \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/* \
    && rm -rf /.cache/*

RUN R -e "devtools::install_github('ropenscilabs/icon')"  \   
    && R -e "devtools::install_github('JimMcL/JUtils')"  \
    && R -e "devtools::install_github('larmarange/JLutils')" \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/* \
    && rm -rf /.cache/*

RUN install2.r xgboost LightGBM ClusterR survminer ggridges forecast DescTools \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/* \
    && rm -rf /.cache/*

RUN apt-get update \
    && apt-get install -y libudunits2-dev libgdal-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

RUN install2.r DALEX smoof mlr DiceKriging rgenoud lhs ParamHelpers  mlrMBO \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*


RUN R -e "webshot::install_phantomjs()" \
    && mv /root/bin/phantomjs /usr/bin/phantomjs \
    && chmod a+rx /usr/bin/phantomjs  \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*

RUN install2.r Matrix.utils webshot rJava RJDBC \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*


RUN apt-get  update \
    && apt-get install -y libhiredis-dev \
    && install2.r redux \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*


RUN R -e "devtools::install_github('yixuan/prettydoc')"  \
    && apt-get clean \
    && rm -rf /var/lib/apt/* \
    && rm -rf /tmp/*


RUN install2.r blogdown \
    && apt-get update \
    && R -e "options(blogdown.hugo.dir = '/usr/local/bin'); blogdown::install_hugo()" \
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



RUN echo "#!/usr/bin/with-contenv bash     \   
\n env >> /usr/local/lib/R/etc/Renviron \  
\n## load /etc/environment vars first:   \		  
\n for line in $( cat /etc/environment ) ; do export $line ; done \          
\n exec /usr/lib/rstudio-server/bin/rserver --server-daemonize 0" > /etc/services.d/rstudio/run






 CMD ["/init"]

