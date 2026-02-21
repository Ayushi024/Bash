# (Production Deployment Script)

#Write a bash script to:
#* Clone repo from GitHub (if repo exists → pull latest code, else clone)
#* Build Docker image
#* Stop old container if running
#* Run new container
#* Store logs in `deploy.log`
#* If any step fails → stop execution

#!/bin/bash
LOG_FILE="deploy.log"
REPO_URL="https://github.com/user/project.git"
PROJECT_DIR="project"
IMAGE_NAME="myapp"
PORT=3000

clone_or_pull_repo(){
 echo "Checking repository..." | tee -a $LOG_FILE

 if [ -d "$PROJECT_DIR" ]; then
   echo "Repo exists, pulling latest code" | tee -a $LOG_FILE
   cd $PROJECT_DIR && git pull origin main
 else
   echo "Cloning repo..." | tee -a $LOG_FILE
   git clone $REPO_URL $PROJECT_DIR
   cd $PROJECT_DIR
 fi
}

build_image(){
 echo "Building Docker image..." | tee -a $LOG_FILE
 docker build -t $IMAGE_NAME .
}

stop_old_container(){
 echo "Stopping old container if running..." | tee -a $LOG_FILE
 CONTAINER_ID=$(docker ps -q --filter "ancestor=$IMAGE_NAME")

 if [ ! -z "$CONTAINER_ID" ]; then
   docker stop $CONTAINER_ID
   docker rm $CONTAINER_ID
 fi
}

run_container(){
 echo "Starting new container..." | tee -a $LOG_FILE
 docker run -d -p $PORT:$PORT $IMAGE_NAME
}

echo "===== Deployment Started =====" | tee -a $LOG_FILE

if ! clone_or_pull_repo; then
 echo "Repo operation failed" | tee -a $LOG_FILE
 exit 1
fi

if ! build_image; then
 echo "Docker build failed" | tee -a $LOG_FILE
 exit 1
fi

if ! stop_old_container; then
 echo "Failed to stop container" | tee -a $LOG_FILE
 exit 1
fi

if ! run_container; then
 echo "Container failed to start" | tee -a $LOG_FILE
 exit 1
fi

echo "===== Deployment Successful =====" | tee -a $LOG_FILE

