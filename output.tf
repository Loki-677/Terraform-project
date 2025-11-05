output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnet_ids
}

output "private_subnets" {
  value = module.vpc.private_subnet_ids
}

output "instances" {
  value = module.ec2_instance.instances
}
output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}