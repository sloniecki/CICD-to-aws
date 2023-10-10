# CI/CD to aws project


## Overview
### This project is a CI/CD pipelinie that deploy simple 3-tier application to aws cloud
 Stack:<br/>
 Frontend: React <br/>
 Backend: Python/flask<br/>
 Database: MySql<br/>
 CI/CD: jenkins<br/>
 Provisioning: Terraform<br/>
 Cloud:AWS(RDS,EC2,ELB,Route53,VPC)<br/>



## Pipeline Overview
 ![Blank diagram (1)](https://github.com/sloniecki/CICD-to-aws/assets/125316037/e56c665b-8a6a-47e7-be2d-fb1a2892475b) <br/>
 1) With usage of github webhook jenkins automaticly triggers pipeline when any changes are commited to repository.<br/>
 2) Packer creates ami with new updated code for web and api ec2 instances. <br/>
 3) Terraform provides all nessesary infrastructure including new amis created in previous step, usage of lifecycles elements (create before destroy) makes this deployment 0 downtime(Blue-Green).<br/>
 4) Deploy to AWS.<br/>
 
 ![terraform](https://github.com/sloniecki/CICD-to-aws/assets/125316037/659286e7-e4de-4a36-8db4-ccd0b81d8d4a)<br/>
 "first succesfull build"<br/>

 ## AWS 3-tier architecture
 ![Blank diagram](https://github.com/sloniecki/CICD-to-aws/assets/125316037/e6ecff54-ce8d-4299-af31-6b0113eb9da9)
 ## Aplication overview
 It's simple 3-tier app with basic CRUD functionality.<br/>
 ![Screenshot_1](https://github.com/sloniecki/CICD-to-aws/assets/125316037/e3f82d79-05f7-4b13-abd0-80a2cd22331f)<br/>
 ![Screenshot_2](https://github.com/sloniecki/CICD-to-aws/assets/125316037/4154fcfb-b173-459f-add1-280e9aceebf4)<br/>
 ![Screenshot_3](https://github.com/sloniecki/CICD-to-aws/assets/125316037/d1cb2bb9-496b-4cd7-8b17-3d8588096b72)<br/>
 ![Screenshot_4](https://github.com/sloniecki/CICD-to-aws/assets/125316037/a651d498-e8c4-4369-a538-16b63a5ea186)<br/>
 ![Screenshot_5](https://github.com/sloniecki/CICD-to-aws/assets/125316037/999c8641-3712-4dd8-a4fd-d7bb5986b071)<br/>
 Here is short video that shows how app works: https://youtu.be/ucr8RMP7y_A
 


 
 



 

 

 

 
    
