resource "helm_release" "coralogix_integration" {
  name       = "otel-coralogix-integration"
  namespace  = "coralogix"
  repository = "https://cgx.jfrog.io/artifactory/coralogix-charts-virtual"
  chart      = "otel-integration"
  version    = "0.0.377"

  values = [
    file("${path.module}/../coralogix/values-deployed.yaml")
  ]

  wait    = true
  timeout = 600

  lifecycle {
    prevent_destroy = true
  }
}
