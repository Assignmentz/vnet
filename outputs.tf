output "vpc-id" {
    value = aws_vpc.vnet.id
}

output "subnetcount" {
    value = length(aws_subnet.pub_subnets)
}

output "location" {
    value = data.aws_region.current
}