provider "aws" {
  region = var.region
}

resource "aws_instance" "hello_world" {
  ami           = var.ami_id
  instance_type = var.instance_type

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
