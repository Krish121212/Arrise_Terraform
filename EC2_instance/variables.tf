variable "instances_configurations" {
    description = "instances configurations"
    type = map(object({
        ami= string
        instance_type= string
        subnet_id= string
        vpc_security_group_ids= string
        volume_type= string
        volume_size= number
        key_pair= string
    }))
}