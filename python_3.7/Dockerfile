FROM continuumio/anaconda:latest


RUN conda install jupyter -y --quiet \
    && mkdir /opt/notebooks 
 

#RUN mkdir /opt/notebooks
CMD ["mkdir /opt/jupyter && conda install jupyter -y --quiet && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='0.0.0.0' --port=8888 --no-browser"]

