

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 4
  tags = local.common_tags
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}