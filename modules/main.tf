module "iam" {
source = "./iam"
role_name = var.role_name
policy_name = var.policy_name
}

module "ec2" {
source = "./ec2"
ami_id = var.ami_id
instance_type = var.instance_type
key_pair_name = var.key_pair_name
root_volume_size = var.root_volume_size
tags = var.instance_name
roleattach = module.iam.roleattach
}
