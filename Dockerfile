FROM docker.io/bitnami/spark:3.3

USER root

ARG UNAME=pyspark
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME

USER $UNAME

WORKDIR /home/pyspark

ENV PATH="${PATH}:/home/pyspark/.local/bin"
RUN pip install pyspark --user 
RUN pip install jupyterlab --user

ENTRYPOINT ["jupyter-lab","--ip=0.0.0.0"]
EXPOSE 8888