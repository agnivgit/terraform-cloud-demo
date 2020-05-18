resource "aws_security_group" "mytfsg" {
  name        = "tf-example-sg"
  description = "Ingress for testing"
  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myec2" {
   ami = "ami-0323c3dd2da7fb37d"
   instance_type = "t2.micro"
   vpc_security_group_ids = [aws_security_group.mytfsg.id]

   provisioner "remote-exec" {
     inline = [
       "sudo amazon-linux-extras install -y nginx1.12",
       "sudo systemctl start nginx"
     ]
   }
}