variable "project_name" {
  default = "expense-tracker"
}
variable "environment" {
  default = "dev"
}
variable "common_tags" {
  default = {
    terraform   = "true"
    project     = "expense"
    environment = "dev"
  }
}