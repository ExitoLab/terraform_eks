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

  worker_groups_launch_template = [
    {
      name                 = "jenkins-spot"
      spot_instance_pools  = 2
      asg_max_size         = 2
      asg_desired_capacity = 2
      kubelet_extra_args   = "--node-labels=node.kubernetes.io/lifecycle=spot"
      public_ip            = false
    },
  ]
}