variable "project_name" {
  default = "expense-tracker"
}
variable "environment" {
  default = "dev"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "common_tags" {
  type = map(any)
  default = {
    Owner       = "tulasi"
    Project     = "expense-tracker"
    Environment = "dev"
    Terraform   = "true"
  }
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "databasee_subnet_cidrs" {
  default = ["10.0.21.0/24", "10.0.22.0/24"]
}