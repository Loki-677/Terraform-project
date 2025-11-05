output "instances" {
  description = "Map of EC2 instance details"
  value = {
    for k, v in aws_instance.ec2 :
    k => {
      id         = v.id
      private_ip = v.private_ip
      public_ip  = v.public_ip
    }
  }
}
