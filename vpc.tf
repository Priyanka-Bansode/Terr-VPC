resource "aws_vpc" "pipeline-demo" {
    cidr_block = "${var.vpc_cidr}"
    instance_tenancy = "default"


    tags = {
        name = "Test VPC"
    }
}


resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.pipeline-demo.id

tags = {
        name = "Test IGW"
    }
}


resource "aws_subnet" "public_subnet1" {
    vpc_id = aws_vpc.pipeline-demo.id
    cidr_block = "${var.public_subnet_1_cidr}"
    availability_zone ="us-east-2a"
    map_public_ip_on_launch = true

tags = {
        name = "Public subnet 1"
    }
}

resource "aws_subnet" "public_subnet2" {
    vpc_id = aws_vpc.pipeline-demo.id
    cidr_block = "${var.public_subnet_2_cidr}"
    availability_zone = "us-east-2b"
    map_public_ip_on_launch = true

tags = {
        name = "Public subnet 2"
    }
}

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.pipeline-demo.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }

    tags = {
        name = "Public route table"
    }
}


resource "aws_route_table_association" "public_subnet-1-route-table-association" {
    subnet_id = aws_subnet.public_subnet1.id
    route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table_association" "public_subnet-2-route-table-association" {
    subnet_id = aws_subnet.public_subnet2.id
    route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.pipeline-demo.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }

    tags = {
        name = "Private route table"
    }
}

resource "aws_subnet" "private_subnet_1" {
    vpc_id = aws_vpc.pipeline-demo.id
    cidr_block = "${var.private_subnet_1_cidr}"
    availability_zone = "us-east-2a"
    map_public_ip_on_launch = true
    tags = {
        name = "Private subnet 1 | App tier"
    }
}

resource "aws_subnet" "private_subnet_2" {
    vpc_id = aws_vpc.pipeline-demo.id
    cidr_block = "${var.private_subnet_2_cidr}"
    availability_zone = "us-east-2b"
    map_public_ip_on_launch = true
    tags = {
        name = "Private subnet 2 | App tier"
    }
}
