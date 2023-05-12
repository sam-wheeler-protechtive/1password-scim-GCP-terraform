output "bridge_name" {
  description = "Name of the 1Password SCIM Bridge"
  value       = var.bridge_name
}

output "bridge_domain" {
  description = "Domain of the 1Password SCIM Bridge"
  value       = var.bridge_domain
}

output "bridge_url" {
  description = "URL of the 1Password SCIM Bridge"
  value       = "https://${var.bridge_domain}:${var.port}"
}
