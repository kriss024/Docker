docker pull - pulling a Docker image
docker pull portainer/portainer-ce

# Create a volume
docker volume create portainer_data

# Starting up the Docker container
docker run --name=portainer --restart=always -d -p 8000:8000 -p 9000:9000 -p 9443:9443 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
# When the deployment is finished, go to: http://localhost:9000

docker run --rm --name owncloud -d -e OWNCLOUD_DOMAIN=localhost:8080 -p8080:8080 owncloud/server

# Docker stop all containers
docker kill $(docker ps -q)
docker rm $(docker ps -a -q) - Remove all containers from this machine
docker stop <hash> - Gracefully stop the specified container
docker kill <hash> - Force shutdown of the specified container

watch docker ps - loop/autorefresh docker ps view like top/htop in bash
docker ps - See a list of all running containers
docker ps -a - See a list of all containers, even the ones not running
docker container ls - List containers
docker image ls - List images

docker-compose up -d
docker-compose stop
docker-compose down

stop - Stops a running container.
start - Starts a stopped container.
restart - Restart one or more containers
rm - Remove one or more containers
rmi - Remove one or more images
run - Run a command in a new container
cp - Copy files/folders between a container and the local filesystem
commit - Creates a new image from a container's changes.
ps - Lists containers.
images - Lists images.
exec - Runs a command in a running container.
search - Search the Docker Hub for images.
logs - Fetch the logs of a container
pull - Pull an image or a repository from a registry.

docker images -a - Show all images on this machine
docker rm <hash> - Remove the specified container from this machine
docker rmi <imagename> - Remove the specified image from this machine
docker rmi $(docker images -q) - Remove all images from this machine
docker login - Log in this CLI session using your Docker credentials
docker tag <image> username/repository:tag - Tag <image> for upload to registry
docker push username/repository:tag - Upload tagged image to registry
docker run username/repository:tag - Run image from a registry
docker build -t friendlyname .  - Create image using this directory's Dockerfile 
