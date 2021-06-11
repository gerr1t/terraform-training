terraform {
  required_version = "= 0.11.2"

  backend "s3" {
    bucket     = "terraform-training-statefiles"
    key        = "gerrit.tfstate"
    region     = "eu-west-1"
  }
}
