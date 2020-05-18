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
   ami = var.instanceId
   instance_type = var.instanceType
   vpc_security_group_ids = [aws_security_group.mytfsg.id]
}