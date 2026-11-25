resource "helm_release" "coralogix_integration" {
  name      = "otel-coralogix-integration"
  namespace = "coralogix"

  repository = "https://cgx.jfrog.io/artifactory/coralogix-charts-virtual"
  chart      = "otel-integration"
  version    = "0.0.377"

  values = [
    file("${path.module}/../coralogix/values-deployed.yaml"),

    yamlencode({
      "opentelemetry-ebpf-profiler" = {
        enabled = var.continuous_profiling_enabled
      }

      "opentelemetry-agent" = {
        presets = {
          profilesCollection = {
            enabled = var.continuous_profiling_enabled
          }

          coralogixExporter = {
            pipelines = concat(
              ["logs", "metrics", "traces"],
              var.continuous_profiling_enabled ? ["profiles"] : []
            )
          }
        }
      }
    })
  ]

  wait    = true
  timeout = 600

  lifecycle {
    prevent_destroy = true
  }
}
