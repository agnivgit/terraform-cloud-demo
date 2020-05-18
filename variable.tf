variable "instanceType" {
  default = "t2.micro"
}
variable "instanceId" {
  default = ""
}
variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 80, 443]
}