locals {
    resource_name = "${var.project_name}-${var.environment}"
    azs_info = slice(data.aws_availability_zones.available.names, 0, 2)
}