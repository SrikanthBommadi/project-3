# 1️⃣ Create IAM Role                                            # Step 1: Creating the base IAM role
resource "aws_iam_role" "bastion_role" {                        # Defines an IAM role resource for bastion host
  name = "BastionTerraformAdmin"                                # Names the role "BastionTerraformAdmin"

  assume_role_policy = jsonencode({                             # Defines who can use this role
    Version = "2012-10-17"                                     # Standard AWS policy version identifier
    Statement = [                                              # List of policy statements
      {
        Effect = "Allow"                                       # Permits the specified action
        Principal = {                                          # Who can assume this role
          Service = "ec2.amazonaws.com"                        # Only EC2 instances can use this role
        }
        Action = "sts:AssumeRole"                             # The permission to assume this role
      }
    ]
  })
}

# 2️⃣ Attach Permissions (Example: SSM)                          # Step 2: Adding permissions to the role
resource "aws_iam_role_policy_attachment" "bastion_ssm_attach" { # Attaches an AWS managed policy
  role       = aws_iam_role.bastion_role.name                   # References the role created above
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore" # SSM core permissions
}
