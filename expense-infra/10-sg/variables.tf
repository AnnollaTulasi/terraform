variable "sg_name" {
  default= "mysql-sg"
}
variable "project_name" {
  default = "expense-tracker"
}
variable "environment" {
  default = "dev"
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

