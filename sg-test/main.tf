module "sg" {
  source = "../aws-sg"
  project_name = var.project_name
  environment = var.environment
  sg_name = var.sg_name
  sg_description = var.sg_description
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
}