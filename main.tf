terraform {
  backend "s3" {
    bucket = "shanmukhatadisetti"
    key    = "expense-miscellaneous/terraform.statefile"
    region = "us-east-1"
  }
}

data "aws_instance" "instance" {
  instance_id = "i-0eb655c164c94df31"
}

resource "aws_route53_record" "record" {
  name    = "jenkins.autonagar.in"
  type    = "A"
  zone_id = "Z10413961HT8PFBW9XTRT"
  records = [data.aws_instance.instance.private_ip]
}