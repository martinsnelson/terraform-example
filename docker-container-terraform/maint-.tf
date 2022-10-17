terraform {
  required_providers {
    docker = {
      source   = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8080
  }
}

# terraform init
# terraform fmt
# terraform apply
# terraform show
# terraform state list
# docker ps
# terraform output
# terraform destroy
# terraform login
# rm terraform.tfstate
