docker pull ubuntu

docker create -it --name linux-ubuntu ubuntu /bin/bash
docker start -ai linux-ubuntu
