variable "vpc_cidr" {
    default = "10.0.0.0/16"
    description = "VPC CIDR Value"
    type = string
}


variable "public_subnet_1_cidr" {
    default = "10.0.0.0/24"
    description = "Public subnet CIDR Value"
    type = string
}

variable "public_subnet_2_cidr" {
    default = "10.0.1.0/24"
    description = "Public subnet CIDR Value"
    type = string
}

variable "private_subnet_1_cidr" {
    default = "10.0.2.0/24"
    description = "Private subnet 1 CIDR Value"
    type = string
}

variable "private_subnet_2_cidr" {
    default = "10.0.3.0/24"
    description = "Private subnet 2 CIDR Value"
    type = string
}
