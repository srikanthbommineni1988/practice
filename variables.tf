variable "region" {
  description = "AWS region to deploy in"
  default     = "us-east-1"  # Change as needed
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0c55b159cbfafe01e"  # Change to a valid AMI for your region
}

variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
}
