terraform {
  required_providers {
    lightstep = {
      source = "lightstep/lightstep"
      version = "1.62.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.2.3"
    }
  }
}

provider "local" {
  # Configuration options
}


provider "http" {
  # Configuration options
}

data "http" "example" {
  url = "https://checkpoint-api.hashicorp.com/v1/check/terraform"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

provider "lightstep" {
  api_key         = var.lightStepKey
  organization    = var.lightstepOrg
}

variable "lightStepKey" {
  type  = string
  default = "your-lightstep-org-api-key"
}

variable "lightstepOrg" {
  type  = string
  default = "your-lightstep-organization"
}



variable "sampleTags" {
  default = ["Dev ebs volume with List", "Test ebs volume with List", "Prod ebs volume with List"]
  type = list(string)
}

variable "ebsSizes" {
  type = list(number)
  default = [40, 80, 100]
}

provider "aws" {

  access_key = var.access_key

  secret_key = var.secret_key

  region     = var.region

}

resource "aws_instance" "example" {

   ami = var.ami_id

   instance_type = var.IN_TYPE

   subnet_id   = "subnet-aa7543ce"

}

variable "access_key" {}

variable "secret_key" {}

variable "region" {

   type  = string

}

variable "IN_TYPE" {

   type    = string

   default = "t2.micro"

}

variable "ami_id" {

  default = "ami-06fcc1f0bc2c8943f"

  type    = string

}
