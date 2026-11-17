resource "coralogix_alert" "container_restarts" {
  name        = "EKS Lab - Container Restarts"
  description = "Detects repeated container restarts in the Astronomy Shop namespace."
  enabled     = true

  labels = {
    environment = "aws-eks-lab"
    category    = "infrastructure"
    platform    = "kubernetes"
    cluster     = "msm-tam-lab-cluster"
    managed_by  = "terraform"
  }

  group_by = [
    "k8s_cluster_name",
    "k8s_container_name",
    "k8s_namespace_name",
    "k8s_pod_name"
  ]

  type_definition = {
    metric_threshold = {
      metric_filter = {
        promql = <<-EOT
          max by (
            k8s_cluster_name,
            k8s_container_name,
            k8s_namespace_name,
            k8s_pod_name
          ) (
            increase(
              k8s_container_restarts__restart_{
                k8s_cluster_name="msm-tam-lab-cluster",
                k8s_namespace_name="demo"
              }[5m]
            )
          )
        EOT
      }

      rules = [{
        condition = {
          condition_type = "MORE_THAN_OR_EQUALS"
          threshold      = 3
          for_over_pct   = 25
          of_the_last    = "5_MINUTES"
        }

        override = {
          priority = "P3"
        }
      }]

      missing_values = {
        replace_with_zero = false
      }

      no_data_policy = {
        state = "NO_DATA"
      }
    }
  }
}