terraform {
  backend "s3" {
    bucket = "jenkins-terraform-aws"
    region = "eu-west-2"
    key    = "jenkins-backend/terraform.tfstate"
  }
}