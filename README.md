# Terraform Module: 1Password SCIM Bridge

This module deploys the 1Password SCIM Bridge container using Docker.

## Usage

```hcl
module "scim_bridge" {
  source               = "your-source/1password-scim-bridge"
  bridge_name          = "my-bridge"
  bridge_version       = "latest"
  bridge_domain        = "scim.example.com"
  admin_token          = "admin-token"
  port                 = 8080
  scim_token           = "scim-token"
  scim_base_url        = "https://scim-server.example.com"
}
