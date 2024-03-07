resource "aws_vpc" "vnet" {
  cidr_block = var.network_details.cidr_block

    tags = {
        Name = var.network_details.name
    }
}

resource "aws_subnet" "pub_subnets" {
    count                = length(var.network_details.tags)
    vpc_id               = aws_vpc.vnet.id
    cidr_block           = cidrsubnet(var.network_details.cidr_block, 8, count.index)
    availability_zone    = format("${var.default_region.region}%s", count.index%2==0?"a":"b")
    tags                 = {
        Name             = var.network_details.tags[count.index]
    }
    depends_on           = [ aws_vpc.vnet ]
}