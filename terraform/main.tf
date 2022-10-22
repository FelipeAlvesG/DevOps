terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "var.do_token"
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-20-04-x64"
  name   = "jenkins"
  region = "nyc1"
  size   = "s-2vcpu-2gb"
  ssh_keys = [data.digitalocean_ssh_key.jornada.id]

}

data "digitalocean_ssh_key" "jornada" {
  name = "Jornada"
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = "k8s"
  region  = "nyc1"
  version = "1.24.4-do.0"

  node_pool {
    name       = "default"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}


