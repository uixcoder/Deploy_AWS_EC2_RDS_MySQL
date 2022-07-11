resource "aws_db_instance" "DB_PetClinic_RDS_TF" {
  availability_zone      = "eu-north-1b"
  vpc_security_group_ids = [aws_security_group.sg_rds_db.id]
  allocated_storage      = 10
  max_allocated_storage  = 20
  engine                 = "mysql"
  engine_version         = "8.0.28"
  instance_class         = "db.t3.micro"
  db_name                = "petclinic"
  identifier             = "petclinic-rds-tf"
  username               = "admpet"
  password               = "12__Pett"
  publicly_accessible    = true
  skip_final_snapshot    = true
  tags = {
    Name = "DB_RDS_TF"
  }
}

resource "aws_security_group" "sg_rds_db" {
  name = "sg_rds_db_pet"
  ingress {
    from_port   = "3306"
    to_port     = "3306"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "DB_RDS_TF"
  }
}

resource "aws_route53_record" "dbpet2" {
  zone_id = "Z0118956EU069IAZHTCP"
  name    = "db2.xcoder.pp.ua"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_db_instance.DB_PetClinic_RDS_TF.address]
}
