# To Install Docker go inside docker-install directory and follow the below mentioned setps
# To install docker in Ubuntu system
    1. Download ubuntu-docker-install.sh file
    2. Make it executable by running command "chmod +x ubuntu-docker-install.sh"
    3. To run the bash file "sudo ./ubuntu-docker-install.sh"
    4. To verify docker un-comment line 45 & 46
    5. To check whether docker engine is running or not
        - systemctl status docker
    6. If docker engine is not running, to start docker enginer
        - systemctl start docker 

# To install docker in CentOS system
    1. Download centos-docker-install.sh file
    2. Make it executable by running command "chmod +x centos-docker-install.sh"
    3. To run the bash file "sudo ./centos-docker-install.sh"
    4. To verify docker un-comment line 33 & 34
    5. To check whether docker engine is running or not
        - systemctl status dockerd
    6. If docker engine is not running, to start docker enginer
        - systemctl start dockerd

# To build and run php docker image
    - First put the code inside php-hello-world-main
    - Build the docker image by "docker-compose build"
    - To run the docker "docker-compose up -d"
    - To stop and remove the running container "docker-compose down"

# CI/CD pipeline
    - Login to jenkins
    - Click on "Dashboard"
    - Go inside "Manage Jenkins"
    - Go inside "Credentials"
    - Within credentials save the login details of GitHub if repository is private for pulling the code from repository
    - Within credentials save the login details of Docker Hub for pushing the Docker image on docker hub
    - Go inside "Manage Jenkins -> Plugins -> Available Plugins"
    - Search & install "Generic Webhook Trigger Plugin" to trigger CI/CD pipeline on push to repository 
    - Install docker and git on the jenkins node

# Create freestyle pipeline
    - Click on New Item
    - Give project name
    - Select Freestyle project
    - Add Description
    - In General -> Select GitHub Project add repo url
    - In Source Code Management -> Select Git -> Add repo url -> If credentials than add it for pulling the code -> Mention the branch by default it is master
    - In Build Triggers -> Select Generic Webhook Trigger -> Configure the webhook
    - In Build Steps -> Select Execute Shell
    - Add the code from jenkins-freestyle within the given box