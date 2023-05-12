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
    LOGGING_PROJECT_ID  = var.project_id
    LOGGING_SINK_NAME   = google_logging_project_sink.scim_bridge_sink.name
  }
}


  # Security configurations
  network_mode = var.network

  # Other resource configurations

  # ...

  # Monitoring and Logging
  lifecycle {
    ignore_changes = [docker_container.scim_bridge.environment]
  }
}

# Other resource definitions

# ...

# Security Considerations
resource "google_compute_firewall" "scim_bridge_fw" {
  name    = "scim-bridge-firewall"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = [var.port]
  }

  # Additional firewall rules and security configurations
}

resource "google_logging_project_sink" "scim_bridge_sink" {
  name        = "scim-bridge-logs"
  destination = "pubsub.googleapis.com/projects/${var.project_id}/topics/scim-bridge-logs"
  filter      = "resource.type=global AND severity>=WARNING"
}

resource "google_project_service" "logging_api" {
  project = var.project_id
  service = "logging.googleapis.com"
}

resource "google_project_service" "pubsub_api" {
  project = var.project_id
  service = "pubsub.googleapis.com"
}


# Other security-related resources and configurations

# ...
