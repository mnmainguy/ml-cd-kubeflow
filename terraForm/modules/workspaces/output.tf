locals {
  env="${terraform.workspace}"
  aws_az_count = {
    "default" = 3
    "train" = 3
    "prod" = 4 
  
  }
  public_subnet_range = {
    "default" = 1
    "train" = 1
    "prod" = 2
  
  }

  private_subnet_range = {
    "default" = 2
    "train" = 2
    "prod" = 4 
  }

 cluster_name = {
    "default" = "mnist_train"
    "train" = "mnist_train"
    "prod" = "mnist_prod" 
  }
  worker_desired_capacity = {
    "default" = 2
    "train" = 2
    "prod" = 1
  }

  worker_min_size = {
    "default" = 1
    "train" = 1
    "prod" = 1
  }
  
  worker_max_size = {
    "default" = 3
    "train" = 6
    "prod" = 6
  }

  aws_ebs_size = {
    "default" = 40
    "train" = 40
    "prod" = 40
  }
  
   eks_worker_instance_type = {
    "default" = "p2.xlarge"
    "train" = "p2.xlarge"
    "prod" = "p2.xlarge"
  }
}
output "env" {
  value = "${local.env}"
}

output "aws_availability_zone_count" {
  value = "${lookup(local.aws_az_count,local.env)}"
}
output "aws_public_subnet_range" {
  value = "${lookup(local.public_subnet_range,local.env)}"
}
output "aws_private_subnet_range" {
  value = "${lookup(local.private_subnet_range,local.env)}"
}
output "aws_cluster_name" {
  value = "${lookup(local.cluster_name,local.env)}"
}
output "eks_worker_desired_capacity" {
  value = "${lookup(local.worker_desired_capacity,local.env)}"
}
output "eks_worker_min_size" {
  value = "${lookup(local.worker_min_size,local.env)}"
}
output "eks_worker_max_size" {
  value = "${lookup(local.worker_max_size,local.env)}"
}

output "aws_ebs_size" {
  value = "${lookup(local.aws_ebs_size,local.env)}"
}

output "eks_worker_instance_type" {
  value = "${lookup(local.eks_worker_instance_type,local.env)}"
}
