resource "aws_security_group" "web_sg" {
  
  vpc_id = aws_vpc.my_vpc.id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }
     }

resource "aws_security_group" "app_sg" {
  
  vpc_id = aws_vpc.my_vpc.id
  
    ingress {
        from_port = 5000
        to_port   = 5000
        protocol = "tcp"
        security_groups = [aws_security_group.web_sg.id]
  }

    egress {
        from_port = 0
        to_port   = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
