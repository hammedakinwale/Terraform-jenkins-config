bucket_name = "dev-proj-1-jenkins-remote-state-bucket-123456"

vpc_cidr             = "11.0.0.0/16"
vpc_name             = "dev-proj-jenkins-us-east-vpc-1"
cidr_public_subnet   = ["11.0.1.0/24", "11.0.2.0/24"]
cidr_private_subnet  = ["11.0.3.0/24", "11.0.4.0/24"]
us_availability_zone = ["us-east-1a", "us-east-1b"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCQip3NlSGp7O/M64pHsKBVjFce8QgncZx5581hyoALafqlU48nNus0C5NaiQ98lcqsDdzjDZeFNtmyAYXpghKzgEm+nOJOvKKKOlVtF3divhkbYUMS4tFtH5qXgegc2Ov4ykUMNdES8rESaF4Q3sNoZBJPeEI1bPkmthTRcCKghti6NjGzkB7eug+BokaDU0dhni3KpxtZmqFOjm+obeZQQqjhBUOF9oBNuLWkLJ71lFOa7OzaIHq/r82wyNWDVOszR/vNP5Xe5ZSBA6skzNqNDXJ8sVqFH/sLykAvXPycTXq13fELJqy8nobBaW7x6TTWcQHBPaJ/dBPV+PiKR4LNvjmvH+GRYGqd/KxKfgyfR2Vr25zkKkgp7W+5dRIZKp3e4bY7rUhyX9SbVZ/exCiXQ8d061Pdr7DxDtAjbpCo26AXr8JWGmv32lcyI7/KJS3PzJWwFNeetcDyI7OWBtUdat4ue2V78OG498rMFCOa51vHxQ6vqjWqK3UMaNqgsC8= Hammed@DESKTOP-H2U5URO"
ec2_ami_id = "ami-0694d931cee176e7d"
keypair = "RESQ"