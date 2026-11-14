
resource "coralogix_parsing_rules" "envoy_access" {
  name        = "EKS Astronomy - Envoy Access Logs"
  description = "Extract HTTP fields from Envoy access logs"

  # Keep disabled until the plan is reviewed.
  active = true

  # Confirm this is the actual Coralogix subsystem.
  subsystems = ["frontend-proxy"]

  rule_subgroups = [
    {
      rules = [
        {
          extract = {
            name         = "Extract Envoy HTTP fields"
            description  = "Extract method, path, status, response flag and duration"
            source_field = "text"

            regular_expression = trimspace(<<-REGEX
"(?<http_method>[A-Z]+) (?<http_path>[^ ?"]+)(?:\?[^ "]+)? HTTP/[^"]+" (?<http_status>\d{3}) (?<envoy_response_flag>\S+) \S+ \S+ "[^"]*" \d+ \d+ (?<duration_ms>\d+)
REGEX
            )
          }
        }
      ]
    }
  ]
}

