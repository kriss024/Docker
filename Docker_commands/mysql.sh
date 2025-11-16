docker pull container-registry.oracle.com/mysql/community-server:latest

docker run -d \
  --name=mysql-server \
  --restart on-failure \
  -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=rootpassword \
  -e MYSQL_USER=user \
  -e MYSQL_PASSWORD=userpassword \
  -e MYSQL_DATABASE=database \
  container-registry.oracle.com/mysql/community-server:latest
  
#~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.
  
docker pull lscr.io/linuxserver/mysql-workbench:latest

docker run -d \
  --name=mysql-workbench \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 3000:3000 \
  -p 3001:3001 \
  --cap-add="IPC_LOCK" \
  --restart unless-stopped \
lscr.io/linuxserver/mysql-workbench:latest

# Go to http://localhost:3000/