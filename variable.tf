variable "instanceType" {
  default = "t2.nano"
}
variable "instanceId" {
  default = "ami-0323c3dd2da7fb37d"
}
variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 80, 443]
}