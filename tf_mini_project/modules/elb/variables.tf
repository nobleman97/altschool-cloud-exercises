variable "bucket" {
    description = ""
    type = string
    default = "altschool-bucket-243545356"
}

variable "instances" {
    description = "a list of instance ips the elb is expected to serve"
    type = list
}

variable "instance_ids" {
    description = "a list of instance ids"
    # type = list
}

variable "instance_count" {
    default = 3
}

variable "instance_sg" {
    description = "security group of the instance collection"
    
}