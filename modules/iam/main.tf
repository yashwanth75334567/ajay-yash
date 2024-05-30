provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_role" "ec2_role" {
  name = var.role_name

  assume_role_policy = <<EOF
{
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        }
      }
    ]
  }
  EOF
}


resource "aws_iam_policy" "s3_policy" {
  name        = var.policy_name
  description = "A test policy"
  
  policy = <<EOF
  {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "s3:ListBucket",
          "s3:GetObject"
        ],
        "Effect"   : "Allow",
        "Resource" : "*"
      }
    ]
  }
  EOF
}

resource "aws_iam_role_policy_attachment" "example_role_policy_attachment" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_instance_profile" "ec2_role" {
  name = "example_role"
  role = aws_iam_role.ec2_role.name
}
