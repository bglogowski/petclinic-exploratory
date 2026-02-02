variable "region" {
  description =  "Identifies AWS region to use"
  default = "us-west-2"
}


variable "vpc_id" {
  description =  "VPC to use for testing. Default is AWS Default VPC"
  default = "vpc-0fe79c9cc6261bf0d"
}


variable "build_id" {
  description =  "Build ID to use to identify AMI to use for testing"
  default = ""
}
