docker run -it --name scipy_python \
    -p 8888:8888 \
    --user root \
    -e NB_USER="my-username" \
    -e CHOWN_HOME=yes \
    -w "/home/${NB_USER}" \
    jupyter/scipy-notebook

docker run -it --name jupyter -p 8888:8888 -v "$PWD":/home/jovyan/work -e DOCKER_STACKS_JUPYTER_CMD=notebook jupyter/scipy-notebook
docker run -it --name pyspark -p 8888:8888 -v "$PWD":/home/jovyan/work -e DOCKER_STACKS_JUPYTER_CMD=notebook jupyter/pyspark-notebook

docker run -it --name tensorflow -p 8888:8888 -v "$PWD":/home/jovyan/work -e TF_ENABLE_ONEDNN_OPTS=0 -e DOCKER_STACKS_JUPYTER_CMD=notebook jupyter/tensorflow-notebook

docker run -it --name tensorflow -p 8888:8888 -v "$PWD":/tf/notebooks tensorflow/tensorflow:latest-jupyter
docker run -it --name tensorflow_gpu -p 8888:8888 -v "$PWD":/tf/notebooks --gpus all tensorflow/tensorflow:latest-gpu-jupyter

# JupyterLab Default Interface
# To change it back to the classic interface again, click on Help â Launch Classic Notebook or change the /lab snippet back to /tree in the URL
# Below is the URL when you are logged into the notebook file browser:
# http://127.0.0.1:8888/tree
# In the URL, if we remove /tree and replace it with /lab the result is the JupyterLab interface.
# http://127.0.0.1:8888/lab

docker run -it --name python3 -v "$PWD":/home python:3 /bin/bash

docker run -it --name python -p 8888:8888 -v "$PWD":/app bitnami/python /bin/bash

docker run -it --name miniconda3 -p 8888:8888 -v "$PWD":/home continuumio/miniconda3 /bin/bash

docker run -it --name anaconda3 -p 8888:8888 -v "$PWD":/home continuumio/anaconda3 /bin/bash

docker run -i -t -p 8888:8888 continuumio/anaconda3 /bin/bash -c "\
    conda install jupyter -y --quiet && \
    mkdir -p /opt/notebooks && \
    jupyter notebook \
    --notebook-dir=/opt/notebooks --ip='*' --port=8888 \
    --no-browser --allow-root"

# Connected Google Colab to a Local Runtime
docker run -it --name python -v "$PWD":/app -p 8888:8888 bitnami/python /bin/bash
pip3 install --upgrade pip
pip3 install jupyter
pip3 install --upgrade jupyter_http_over_ws>=0.0.7 && jupyter serverextension enable --py jupyter_http_over_ws

jupyter notebook --ip 0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.allow_origin='https://colab.research.google.com' --NotebookApp.port_retries=0
