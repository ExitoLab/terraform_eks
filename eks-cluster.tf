module "eks" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-eks.git?ref=v17.1.0"

  cluster_name    = local.cluster_name
  cluster_version = var.eks_cluster_version
  subnets         = module.vpc.private_subnets

  tags = {
    Environment     = var.environment
    module_eks_repo = var.module_eks_repo
  }

  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = var.eks_volume_type
  }

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t2.small"
      additional_userdata           = "echo foo bar"
      asg_desired_capacity          = 2
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    },
    {
      name                          = "worker-group-2"
      instance_type                 = "t2.medium"
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
      asg_desired_capacity          = 1
    },
  ]
}