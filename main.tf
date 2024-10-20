provider "aws" {
  region = "us-east-1" # Change as needed
}

resource "aws_instance" "hello_world" {
  ami           = "ami-0c55b159cbfafe01e" # Change to a valid AMI for your region
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              echo "<html><h1>Hello World!</h1></html>" > /var/www/html/index.html
              systemctl start httpd
              systemctl enable httpd
              EOF

  tags = {
    Name = "HelloWorldInstance"
  }
}

output "instance_ip" {
  value = aws_instance.hello_world.public_ip
}
