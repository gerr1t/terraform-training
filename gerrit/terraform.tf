terraform {
  required_version = "= 0.14.7"

  backend "s3" {
    bucket               = "terraform-training-statefiles"
    workspace_key_prefix = "gerrit_state_files"
    region               = "eu-west-1"
    key = "gerrit.tfstate"
  }
}
