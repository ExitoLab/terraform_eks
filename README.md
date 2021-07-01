# AWS EKS Practice

## Introduction

Provisioned EKS

## Run command after provision EKS
1. aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
2. kubectl cluster-info
3. kubectl get nodes



## Todo's
1. Configure windows workers 
2. Setup terratest
3. Add tolerations and NodeSelector on the workers
4. Use Fargate for your workers
5. Use Spot instances for your workers [done]