pipeline {
    agent any
    stages {
        stage('Web_ami_build') {
            steps {
                sh '''
                cd terraform
                packer build packer_web.json 2>&1 | sudo tee outputweb.txt
                webami=$(tail -2 outputweb.txt | head -2 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }')
                echo 'variable "ami_web" { default = "'${webami}'" } > var_ami_web.tf
                '''
            }
        }
        stage('Api_ami_build') {
            steps {
                sh '''
                cd terraform
                packer build packer_api.json 2>&1 | sudo tee outputapi.txt
                apiami=$(tail -2 outputapi.txt | head -2 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }')
                echo 'variable "ami_app" { default = "'${apiami}'" } > var_ami_api.tf
                '''
            }
        }
        stage('Terraform provision') {
            steps {
                sh '''
                cd terraform
                terraform init
                terraform apply -auto-approve
                '''
            }
        }
    }
}
