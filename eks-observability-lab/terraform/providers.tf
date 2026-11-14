
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    coralogix = {
      source  = "coralogix/coralogix"
      version = "~> 3.0"
    }
  }
}

provider "coralogix" {
  env = "US2"
}

