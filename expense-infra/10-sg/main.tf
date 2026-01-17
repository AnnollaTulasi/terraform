module "mysql_sg" {
  source = "git::https://github.com/AnnollaTulasi/terraform.git//aws-sg?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = var.sg_name
  sg_description = var.sg_description
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
}

module "backend_sg" {
  source = "git::https://github.com/AnnollaTulasi/terraform.git//aws-sg?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = "backend"
  sg_description = "security group for backend"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
}
module "frontend_sg" {
  source = "git::https://github.com/AnnollaTulasi/terraform.git//aws-sg?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = "frontend"
  sg_description = "security group for frontend"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
}
module "bastion_sg" {
  source = "git::https://github.com/AnnollaTulasi/terraform.git//aws-sg?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = "bastion"
  sg_description = "security group for bastion"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
}
module "app_alb_sg" {
  source = "git::https://github.com/AnnollaTulasi/terraform.git//aws-sg?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = "app-alb"
  sg_description = "security group for app-alb"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
}

resource "aws_security_group_rule" "app_alb_bastion" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id = "module.app_alb_sg.sg_id"
}