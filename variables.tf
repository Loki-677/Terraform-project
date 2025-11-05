variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "project" {
  description = "Project name prefix"
  type        = string
  default     = "demo"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Map of public subnets"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  description = "Map of private subnets"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "instances" {
  description = "EC2 instance definitions"
  type = map(object({
    ami_id        = string
    instance_type = string
    subnet_key    = string
    tags          = map(string)
  }))
}

variable "key_pair_name" {
  description = "Name of the existing AWS key pair (already created in the region)"
  type        = string
}

