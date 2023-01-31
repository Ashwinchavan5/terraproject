provider "aws" {
region = "ap-south-1"
access_key = "AKIA6N3RT3U7XFES5DXG"
secrete_key = "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"
}
resource "aws_instance" "one" {
ami = "ami-01a4f99c4ac11b03c"
instance_type = "t2.medium"
key_pair ="terrakeypair"
vpc_security_group_ids =[aws_security_group.three.id]
availability_zone = "ap-south-1a"
user_data = << EOF
#!/bin/bash
sudo -i 
yum install httpd -y
systemctl start httpd 
chkconfig httpd on 
echo "hai all this is my website created by terraform infrastructure by raham sir server -1" /var/www/html/index.html/index
EOF
tags = {
Name = "swiggy-01"
}
}

resource "aws_instance" "two" {
ami = "ami-01a4f99c4ac11b03c"
instance_type = "t2.mediun"
key_pair = "terrakeypair"
vpc_security_group_ids =[aws_security_group.three.id]
availability_zone = "ap-south-1b"
user_data = << EOF
#!/bin/bash
sudo -i 
yum install httpd -y
systemctl start httpd 
chkconfig httpd on 
echo "hai all this is my website created by terraform infrastructure by raham sir server -2" /var/www/html/index.html/index
EOF
tags = {
Name = "swiggy-02"
}
}

