resource "aws_vpc_peering_connection" "default" {
  count         = var.is_peering_required ? 1 : 0
  peer_vpc_id   = local.default_vpc_id # accepter
  vpc_id        = aws_vpc.main.id # requestor
  auto_accept  = true
}

resource "aws_route" "public_peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = local.default_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id
}

resource "aws_route" "default" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = data.aws_route_table.main.route_table_id
  destination_cidr_block    = var.vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id
}