resource "aws_instance" "app" {
    
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_app.id
  key_name      = var.key_name
  security_groups = [aws_security_group.app_sg.id]

  ##user_data = <<-EOF
              #!/bin/bash
    ##          yum install -y python3
      ##        pip3 install flask
        ##      echo "from flask import Flask; app = Flask(__name__); @app.route('/')\ndef hello(): return 'App Tier'; app.run(host='0.0.0.0')" > app.py
          ##    nohup python3 app.py &
            ##  EOF

  tags = { 
    
    Name = "App Tier"
    
    }
}
