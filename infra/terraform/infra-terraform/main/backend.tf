terraform {
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }

    bucket = "tfstate-wade-2026"
    region = "ru-central1"

    key = "terraform.tfstate"

    access_key = "REMOVED"
    secret_key = "REMOVED"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}
