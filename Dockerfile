# start from the waleedka image
FROM waleedka/modern-deep-learning:latest


# Silence Tensorflow warnings - look into compiling for CPU supported instruction sets
ENV TF_CPP_MIN_LOG_LEVEL 2


WORKDIR "/root"


#####################################
#INSTALL R AND THE LIBRARIES
#####################################

# install the linux libraries needed 
RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libcurl4-gnutls-dev \
  libpq-dev \
  make \
  zlib1g-dev \
  r-base \
  r-base-dev \
  openjdk-8-jre \
  openjdk-8-jdk \
  python-minimal \
  r-cran-caret

RUN R -e "install.packages(c('httr', 'caret', 'data.table', 'emayili', 'ggplot2', 'lattice', 'magrittr', 'reticulate', 'shiny', 'writexl','parallel','elasticnet'), repos='http://cran.us.r-project.org')"


#Copy the r script
COPY scriptX.R scripX.R
#Copy the python script
COPY scriptX.py scriptX.py


#Copy the main folder
COPY FolderX FolderX

# when the container starts, start the main.R script
#ENTRYPOINT ["Rscript", "scriptX.R"]
#when the container starts, use the interactive mode
CMD ["/bin/bash"]
