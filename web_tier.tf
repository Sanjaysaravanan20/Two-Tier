resource "aws_instance" "web" {
  
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  associate_public_ip_address = true
  key_name      = var.key_name
  security_groups = [aws_security_group.web_sg.id]

  ##user_data = <<-EOF
              #!/bin/bash
              ##yum install -y httpd
              ##systemctl start httpd
              ##echo "<h1>Web Tier</h1>" > /var/www/html/index.html
              ##EOF

  tags = { 
   
    Name = "Web Tier"

     }
}
