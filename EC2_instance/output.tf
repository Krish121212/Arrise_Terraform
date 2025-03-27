# exposing public_ip and instance id for dev team
output "ec2_details" {
  value = {
    for ec2, instance in aws_instance.EC2_creation : ec2 => {
        id = instance.id
        public_ip = instance.public_ip
    }
  }
}