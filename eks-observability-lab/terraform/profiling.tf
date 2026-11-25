variable "continuous_profiling_enabled" {
  description = "Enable OpenTelemetry eBPF continuous CPU profiling in the EKS observability lab"
  type        = bool
  default     = false
}
