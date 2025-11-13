docker pull continuumio/anaconda3

docker run -it --name anaconda3 -p 8888:8888 -v "$PWD":/opt/notebooks continuumio/anaconda3 /bin/bash -c "\
    conda install jupyter -y --quiet && \
    mkdir -p /opt/notebooks && \
    jupyter notebook \
    --notebook-dir=/opt/notebooks --ip='*' --port=8888 \
    --no-browser --allow-root"