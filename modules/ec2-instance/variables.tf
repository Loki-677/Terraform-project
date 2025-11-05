variable "instances" {
  description = "EC2 instance definitions"
  type = map(object({
    ami_id        = string
    instance_type = string
    subnet_key    = string
    tags          = map(string)
  }))
}

variable "subnet_ids" {
  description = "Map of subnet IDs (public and private combined)"
  type        = map(string)
}
