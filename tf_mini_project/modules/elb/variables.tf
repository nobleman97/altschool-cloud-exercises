variable "bucket" {
    description = ""
    type = string
    default = "udagram-todo-dev"
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