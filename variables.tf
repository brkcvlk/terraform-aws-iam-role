variable "name" {
  description = "Name of the IAM role."
  type        = string
}

variable "description" {
  description = "Description of the IAM role."
  type        = string
  default     = ""
}

variable "principals" {
  description = "Map of principals allowed to assume this role. Each entry creates one trust policy statement."
  type = map(object({
    type        = string
    identifiers = list(string)
  }))

  validation {
    condition = alltrue([
      for principal in values(var.principals) : contains(["Service", "AWS", "Federated", "CanonicalUser"], principal.type)
    ])
    error_message = "Each principal must have a valid type: 'Service', 'AWS', 'Federated' or 'CanonicalUser'."
  }
}

variable "policies" {
  description = "Map of managed policy ARNs to attach to the role. Map keys are used only for stable resource addressing."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to assign to the IAM role."
  type        = map(string)
  default     = {}
}
