########## Setup the Provider - Variable provied by file ###################
provider "aws" {
  profile   = "default"
  
  /*
  # AWS Access Keys to be added to the local terraform.tfvars file if required
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  */

  # AWS Access using the local AWS Credentials 
  shared_credentials_file = "~/.aws/credentials" # Linux IDE
  region     = "${var.region}"
}

########## Configure Terraform ########################################
terraform {
  backend "s3" { # Use the noted S3 bucket to store state
    bucket  = "j2k2-tf-bucket"
    key     = "tfstate/terraform.tfstate"
    region  = "eu-west-1"
    encrypt = "true"
  }
}


#variable "access_key" {} # Pulled in from file using 'terraform apply -var-file e:\Scripts\Projects\terraform\terraform.tfvars'
#variable "secret_key" {} # Pulled in from file using 'terraform apply -var-file e:\Scripts\Projects\terraform\terraform.tfvars'
variable "region" {
  default = "eu-west-1"
}


variable "web-ports" {
  description = "The port which will be used to connect to the web servers"
  type = "string"
  default = 8080
}