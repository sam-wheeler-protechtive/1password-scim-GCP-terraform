variable "bridge_name" {
  description = "Name of the 1Password SCIM Bridge"
  type        = string
}

variable "bridge_version" {
  description = "Version of the 1Password SCIM Bridge Docker image"
  type        = string
  default     = "latest"
}

variable "bridge_domain" {
  description = "Domain of the 1Password SCIM Bridge"
  type        = string
}

variable "admin_token" {
  description = "1Password SCIM Bridge admin token"
  type        = string
}

variable "port" {
  description = "Port on which the 1Password SCIM Bridge listens"
  type        = number
}

variable "scim_token" {
  description = "1Password SCIM token"
  type        = string
}

variable "scim_base_url" {
  description = "Base URL of the SCIM server"
  type        = string
}

#