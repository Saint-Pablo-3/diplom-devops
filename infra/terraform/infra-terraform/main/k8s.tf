resource "yandex_kms_symmetric_key" "k8s-key" {
  name              = "k8s-key"
  default_algorithm = "AES_128"
}

resource "yandex_kubernetes_cluster" "k8s-regional" {
  name       = "diplom-k8s"
  network_id = yandex_vpc_network.diplom-network.id

  master {
    regional {
      region = "ru-central1"

      location {
        zone      = yandex_vpc_subnet.subnet-a.zone
        subnet_id = yandex_vpc_subnet.subnet-a.id
      }

      location {
        zone      = yandex_vpc_subnet.subnet-b.zone
        subnet_id = yandex_vpc_subnet.subnet-b.id
      }

      location {
        zone      = yandex_vpc_subnet.subnet-d.zone
        subnet_id = yandex_vpc_subnet.subnet-d.id
      }
    }

    public_ip = true
  }

  service_account_id      = "aje2dv5j3n93ltkeub41"
  node_service_account_id = "aje2dv5j3n93ltkeub41"

  kms_provider {
    key_id = yandex_kms_symmetric_key.k8s-key.id
  }

}

resource "yandex_kubernetes_node_group" "nodes" {
  cluster_id = yandex_kubernetes_cluster.k8s-regional.id

  name = "diplom-workers"

  instance_template {
    platform_id = "standard-v3"

    network_interface {
      nat = true
      subnet_ids = [
        yandex_vpc_subnet.subnet-a.id
      ]
    }

    resources {
      memory = 2
      cores  = 2
    }

    boot_disk {
      type = "network-hdd"
      size = 30
    }

    scheduling_policy {
      preemptible = true
    }

    container_runtime {
      type = "containerd"
    }
  }

  scale_policy {
    auto_scale {
      min     = 1
      max     = 2
      initial = 1
    }
  }

  allocation_policy {
    location {
      zone = "ru-central1-a"
    }
  }
}
