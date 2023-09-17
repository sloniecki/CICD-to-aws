resource "aws_security_group" "inter-db-sg" {
 name        = "inter-lb-db-sg"
 vpc_id      = aws_vpc.main.id

ingress {
   from_port   = 3306
   to_port     = 3306
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}

resource "aws_db_subnet_group" "db-subnetg" {
  name       = "db-subnetg"
  subnet_ids = [aws_subnet.main-private-db-a.id, aws_subnet.main-private-db-b.id]

  tags = {
    Name = "db-subnet-group"
  }
}

resource "aws_db_instance" "database" {
  identifier             = "database"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "mysql"
  engine_version         = "8.0.28"
  username               = "aws"
  password               = "12345678"
  snapshot_identifier    = "arn:aws:rds:eu-north-1:324938604369:snapshot:template"
  db_subnet_group_name   = aws_db_subnet_group.db-subnetg.name
  vpc_security_group_ids = [aws_security_group.inter-db-sg.id]
  parameter_group_name   = "default.mysql8.0"
  publicly_accessible    = false
  skip_final_snapshot    = true
}