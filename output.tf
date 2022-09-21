# output "zones" {
#   value=data.aws_availability_zones.available.names
# }

# output "vpc_id" {
#   value=aws_vpc.stage-vpc.id
# }

# output "igw" {
#   value=aws_internet_gateway.igw.arn
# }


# installing jenkinsdata
# #!/bin/bash
# sudo wget -O /etc/yum.repos.d/jenkins.repo \
#     https://pkg.jenkins.io/redhat-stable/jenkins.repo

# sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# sudo yum upgrade

# # Add required dependencies for the jenkins package
# sudo yum install java-11-openjdk

# sudo yum install jenkins

# sudo systemctl daemon-reload