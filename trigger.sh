#Trigger.sh file
#!/bin/bash
curl \
 -X POST http://harshali.jenkins:8080/job/ENV/build?delay=0sec \
 -u jenkins:11b6ca7f9b6f9c0fb0ef22db887ad702de \
