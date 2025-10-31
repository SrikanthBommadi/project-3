
variable "project_name" {
    default = "sri"
}

variable "environment"{
    default = "dev"
}

variable "vpc_tags" {
    default = {
        Purpose = "sri VPC"
        DontDelete = "true"
    }
}

variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "public_subnet_cidrs" {
  default = ["172.16.1.0/24", "172.16.2.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["172.16.11.0/24", "172.16.12.0/24"]
}

variable "database_subnet_cidrs" {
  default = ["172.16.21.0/24", "172.16.22.0/24"]
}
