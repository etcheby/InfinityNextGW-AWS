#########################################
############# Variables #################
#########################################

variable "cft_name" {
    description = "Name of the CFT Resource"
    type        = string 
    default     = "InfinityNextGW"
}

variable "vpc" {
    description = "Existing VPC ID"
    type        = string
    default     = "vpc-0da4599a594760776"
}

variable "public_subnet" {
    description = "Public Subnet ID of the Infinity Next Gateway"
    type        = string
    default     = "subnet-0e24451081b28bdec"  
}

variable "private_subnet" {
    description = "Private Subnet ID of the Infinity Next Gateway"
    type        = string
    default     = "subnet-03c0d00865820d90f"  
}

variable "internal_rt" {
    description = "Subnet RT ID associated to Private Subnet"
    type        = string
    default     = "rtb-009d9adb619d1b53c"
}

variable "gateway_name" {
    description = "Name tag of Infinity Next Gateway"
    type        = string
    default     = "InfinityNextGW"
}

variable "instance_type" {
    description = "EC2 instance type for Infinity Next Gateway"
    type        = string
    default     = "c5.xlarge"
}

variable "key_name" {
    description = "EC2 Key Pair to SSH into Infinity Next Gateway"
    type        = string
    default     = "AWSLab"
}

variable "inbound_sources" {
    description = "Specifies client IP addresses that can reach Infinity Next Gateway"
    type        = string 
    default     = "0.0.0.0/0"
}

variable "password_hash" {
    description = "Infinity Next Gateway Admin user's password hash"
    type        = string
    default     = "$1$5b8270b8$XTwkTQUC.Ddce5rSALyBj/"
}

variable "infinity_token" {
    description = "Token generated from Infinity Portal for Gateway Authentication & Connectivity"
    type        = string
    default     = "6ddb0096-a5fa-419e-abf7-f5272ed9ad94-001723fe-945c-4c84-be67-45870e796855"
}

