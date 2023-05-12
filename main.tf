resource "docker_container" "scim_bridge" {
  name  = var.bridge_name
  image = "1password/scim:${var.bridge_version}"
  ports {
    internal = 8000
    external = var.port
  }
  environment = {
    SCIM_ADMIN_TOKEN    = var.admin_token
    SCIM_BRIDGE_DOMAIN  = var.bridge_domain
    SCIM_TOKEN          = var.scim_token
    SCIM_BASE_URL       = var.scim_base_url
  }
}
