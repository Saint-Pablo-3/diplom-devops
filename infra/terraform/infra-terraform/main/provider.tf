terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.202"
    }
  }
}

provider "yandex" {
  service_account_key_file = "../../keys/key.json"

  cloud_id  = "b1gftbsd8qcsji4lvqd2"
  folder_id = "b1g4emnt3abd63mqk4j3"
  zone      = "ru-central1-a"
}
