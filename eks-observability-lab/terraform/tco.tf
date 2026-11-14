resource "coralogix_tco_policies_logs" "lab_logs" {
  policies = [
    {
      name        = "lab-product-catalog-info"
      description = "Route demo product-catalog INFO logs to Medium"
      enabled     = true
      priority    = "medium"

      applications = {
        rule_type = "is"
        names     = ["demo"]
      }

      subsystems = {
        rule_type = "is"
        names     = ["product-catalog"]
      }

      severities = ["info"]
    },
    {
      name        = "lab-operational-info"
      description = "Route routine operational INFO logs to Medium"
      enabled     = true
      priority    = "medium"

      applications = {
        rule_type = "is"
        names     = ["demo"]
      }

      subsystems = {
        rule_type = "is"
        names = [
          "frontend",
          "image-provider",
          "recommendation"
        ]
      }

      severities = ["info"]
    }
  ]
}
