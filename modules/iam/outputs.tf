output "role_name" {
  value = aws_iam_role.ec2_role.name
}

output "roleattach" {
    value = aws_iam_instance_profile.ec2_role.name
}