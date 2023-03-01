provider "aws" {
  region = var.region
}
provider "kubernetes" {
  alias                  = "us-east-1"
  host                   = data.aws_eks_cluster.cluster_eu.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster_eu.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster_eu.token
  # exec {
  #   api_version = "client.authentication.k8s.io/v1beta1"
  #   args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cluster_eu.name]
  #   command     = "aws"
  # }
}

