resource "aws_instance" "ec2-web-a" {
  ami           = var.ami_web
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.main-public-1a.id
  vpc_security_group_ids = [aws_security_group.external-lb-sg.id]
  tags = {
    Name = "ec2-web-a"
  }
  
  user_data = <<-EOL
  #!/bin/bash -xe
  cd /var/web/frontend              
  npm start
  EOL
  
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "ec2-web-b" {
  ami           = var.ami_web
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.main-public-1b.id
  vpc_security_group_ids = [aws_security_group.external-lb-sg.id]
  tags = {
    Name = "ec2-web-b"
  }

  user_data = <<-EOL
  #!/bin/bash -xe
  cd /var/web/frontend              
  npm start
  EOL
  
  lifecycle {
    create_before_destroy = true
  }
}



resource "aws_instance" "ec2-app-a" {
  ami           = var.ami_app
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.main-private-1a.id
  vpc_security_group_ids = [aws_security_group.inter-lb-app-sg.id]
  tags = {
    Name = "ec2-app-a"
  }

  user_data = <<-EOL
  #!/bin/bash -xe
  cd /var/api/             
  python3 app.py
  EOL

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "ec2-app-b" {
  ami           = var.ami_app
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.main-private-1b.id
  vpc_security_group_ids = [aws_security_group.inter-lb-app-sg.id]
  tags = {
    Name = "ec2-app-b"
  }

  user_data = <<-EOL
  #!/bin/bash -xe
  cd /var/api/             
  python3 app.py
  EOL

  lifecycle {
    create_before_destroy = true
  }
}
