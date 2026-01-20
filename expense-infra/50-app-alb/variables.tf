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
variable "zone_id" {
  default = "Z123456ABCDEFG"
}
variable "domain_name" {
  default = "app.expense.example.com"
}