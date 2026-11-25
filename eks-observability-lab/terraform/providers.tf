terraform {
  required_version = ">= 1.3.0"

  required_providers {
    coralogix = {
      source  = "coralogix/coralogix"
      version = "~> 3.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0"
    }
  }
}

provider "coralogix" {
  env = "US2"
}

provider "helm" {
  kubernetes = {
    config_path    = pathexpand("~/.kube/config")
    config_context = "msm-tam-lab-eks"
  }
}
