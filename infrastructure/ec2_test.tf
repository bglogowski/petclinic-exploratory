provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "petclinic_security_group" {
  vpc_id = "vpc-0fe79c9cc6261bf0d"
  name = "access-https-${var.build_id}"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80 
    to_port     = 80 
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8085
    to_port     = 8085
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22 
    to_port     = 22 
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    build_id   = var.build_id
  }

}


resource "aws_instance" "test-instance" {
  ami           = data.aws_ami.instance_ami.id
  subnet_id       = "subnet-028a68de39e501d56"
  instance_type = "t2.micro"
  key_name   = "cse41381"
  vpc_security_group_ids = [aws_security_group.petclinic_security_group.id]

  tags = {
    build_id   = var.build_id
  }


}
