#!/bin/bash
curl \
-u jenkins:11b6ca7f9b6f9c0fb0ef22db887ad702de \
-X POST http://harshali.jenkins:8080/job/ansible-user-db/buildWithParameters \
--data AGE=22 
