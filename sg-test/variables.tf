variable "sg_name" {
  default= "mysql-sg"
}
variable "project_name" {
  default = "Expense"
}
variable "environment" {
  default = "Dev"
}
variable "sg_description" {
  default = "Security group for MySQL database"
}
variable "common_tags" {
   default = {
        Terraform   = "True"
        Project     = "Expense Tracker"
        Environment = "Dev"
    }
}