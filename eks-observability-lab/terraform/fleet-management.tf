resource "coralogix_configuration_group" "hostmetrics_tuning" {
  name           = "eks-lab-hostmetrics-tunning"
  description    = "change host metrics collection interval from 30s to 60s using OpAMP"
  priority_order = 0

  family = {
    active = true

    raw = {
      metadata = {}

      remote_configurations = [
        {
          name = "Custom configuration"

          raw_configuration = file(
            "${path.module}/../coralogix/fleet-management/hostmetrics-tuning.yaml"
          )

          agent_selector = {
            attributes = {
              "cx.cluster.name" = "msm-tam-lab-cluster"
              "cx.agent.type"   = "agent"
              "k8s.pod.name"    = "coralogix-opentelemetry-agent-sv877"
            }
          }
        }
      ]
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}
