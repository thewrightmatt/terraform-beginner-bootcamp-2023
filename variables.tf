variable "user_uuid" {
  description = "value"
  type        = string

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.example_variable))
    error_message = "Variable must be formatted like '5bbdc042-fcb8-4ca6-ab08-1d8b0be51fe3'."
  }
}

