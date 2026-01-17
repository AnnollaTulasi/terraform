module "alb" {
  source = "terraform-aws-modules/alb/aws"
  internal = true 
  name    = "${var.project_name}-${var.environment}-alb"
  vpc_id  = data.aws_ssm_parameter.vpc_id.value
  subnets = local.public_subnet_ids
  create_security_group = false
  security_groups = [local.app_alb_sg_id]
  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-alb"
    }
  )
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = module.alb.arn
  port              = "80"
  protocol          = "HTTP"

default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "<h1>Welcome to the Application Load Balancer</h1>"
      status_code  = "200"
    }
  }
}
