variable "project_name" {
  
}
variable "environment" {
  
}
variable "sg_description" {

  
}
variable "vpc_id" {
  
}
variable "sg_name" {
  
}
variable "common_tags" {
    default = {
        Terraform   = "True"
        Project     = "Expense Tracker"
        Environment = "Dev"
    }
  
}