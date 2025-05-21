FROM jenkins/jenkins
USER root                                           


#-----------------------------------------
# Avoid interactive prompts during install
#-----------------------------------------
ENV DEBIAN_FRONTEND=noninteractive



# Fix possible broken or minimal apt sources
#RUN sed -i 's|http://.*.debian.org|http://deb.debian.org|g' /etc/apt/sources.list && \
# Create apt sources if missing and install Python tools
#RUN echo "deb http://deb.debian.org/debian stable main" > /etc/apt/sources.list.d/debian.sources && \   
# apt-get clean &&\
# apt-get  update --fix-missing && \
#  apt-get install -y python3-pip python3-venv iputils-ping && \
#    rm -rf /var/lib/apt/lists/*

#------------------------------------------------------------------
# Update the package list and install iputils-ping non-interactively
#-------------------------------------------------------------------
RUN apt-get clean && \
   apt-get update --fix-missing && \
   apt-get install -y iputils-ping && \
   apt-get install -y python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*
 
#------------------------------------------
# New lines to set up a virtual environment
#------------------------------------------
ENV ANSIBLE_VENV=/ansible_venv
RUN mkdir $ANSIBLE_VENV && \
    chown jenkins:jenkins $ANSIBLE_VENV
    #apt-get install python3-venv -y
    
####
 
USER jenkins
 
#---------------------------------
# Activate the virtual environment
#---------------------------------
RUN python3 -m venv $ANSIBLE_VENV
 
#--------------------------------
# Use the venv to install Ansible
#--------------------------------
RUN $ANSIBLE_VENV/bin/pip3 install ansible
 
#----------------------------------------
# Ensure the Ansible binary is accessible
#----------------------------------------
ENV PATH=$PATH:$ANSIBLE_VENV/bin
