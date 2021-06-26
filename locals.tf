locals {
  cluster_name = "${var.project}-${var.environment}-eks"
  tags         = tomap({ "Environment" = var.environment, "project" = var.project })
}