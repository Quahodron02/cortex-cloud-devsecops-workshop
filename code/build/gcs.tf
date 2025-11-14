provider "google" {
  project = "qwiklabs-gcp-01-3426d14e155b"
  region  = "us-central1"
}

resource "random_id" "rand_suffix" {
  byte_length = 4
}

variable "var_1" {
  type    = string
  default = "value-1"
}


resource "google_storage_bucket" "example" {
  name          = "demo-${random_id.rand_suffix.hex}"
  location      = "us-central1"
  force_destroy = true

  # Enable versioning to keep a history of object changes
  versioning {
    enabled = true
  }

  # Enable uniform bucket-level access for consistent permission management
  uniform_bucket_level_access = true

  # Enforce public access prevention
  public_access_prevention = "enforced"

  # Enable logging for access auditing
  logging {
    log_bucket        = "your-logging-bucket"  # Set your existing bucket name for logs
    log_object_prefix = "example-bucket-logs"
  }
}
