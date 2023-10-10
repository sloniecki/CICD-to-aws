# CI/CD to aws project


## Overview
### This project is a CI/CD pipelinie that deploy simple 3-tier application to aws cloud
 Stack:<br/>
 Frontend: React <br/>
 Backend: Python/flask<br/>
 Database: MySql<br/>
 CI/CD: jenkins<br/>
 Provisioning: Terraform<br/>
 Cloud:AWS<br/>



## Pipeline Overview
 ![Blank diagram (1)](https://github.com/sloniecki/CICD-to-aws/assets/125316037/e56c665b-8a6a-47e7-be2d-fb1a2892475b) <br/>
 1) With usage of github webhook jenkins automaticly triggers pipeline when any changes are commited to repository.<br/>
 2) Packer creates ami with new updated code for web and api ec2 instances. <br/>
 3) Terraform provides all nessesary infrastructure including new amis created in previous step, usage of lifecycles elements (create bvefore destroy) makes this deployment 0 downtime(Blue-Green).<br/>
 4) Deploy to AWS.<br/>
 

 
    
