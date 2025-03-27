resource "aws_instance" "EC2_creation" {
    for_each = var.instances_configurations

    ami = each.value.ami
    instance_type = each.value.instance_type
    subnet_id = each.value.subnet_id
    vpc_security_group_ids = each.value.vpc_security_group_ids
    key_name = each.value.key_name
    
    root_block_device {
      volume_size = each.value.volume_size
      volume_type = each.value.volume_type
    }

  #installing and starting nginx services on all servers at the time of creation itself
    provisioner "remote-exec" {
        inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl enable nginx",
        "sudo systemctl start nginx"
        ]
    }

    tags = {
        Name = "instances_configurations-${each.key}"
    }
}