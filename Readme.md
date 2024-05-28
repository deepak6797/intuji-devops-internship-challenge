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