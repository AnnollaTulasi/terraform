variable "project_name" {
  default = "expense-tracker"
}
variable "environment" {
  default = "dev"
}
variable "common_tags" {
  default = {
    Terraform   = "true"
    Project     = "Expense"
    Environment = "Dev"
  }
}