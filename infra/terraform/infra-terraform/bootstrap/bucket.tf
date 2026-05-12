resource "yandex_storage_bucket" "tfstate" {
  bucket = "tfstate-wade-2026"

  force_destroy = true
}
