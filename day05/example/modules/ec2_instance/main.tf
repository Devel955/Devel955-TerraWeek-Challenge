resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  metadata_options {
    http_tokens = "required"
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-${var.name}"
    }
  )
}
