resource "aws_instance" "ec2" {
  for_each = var.instances

  ami           = each.value.ami_id
  instance_type = each.value.instance_type
  subnet_id     = var.subnet_ids[each.value.subnet_key]

  tags = merge(
    {
      Name = each.key
    },
    each.value.tags
  )

  lifecycle {
    ignore_changes = [tags]
  }
}