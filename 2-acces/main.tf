resource "aws_instance" "bastion" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.bastion_sg_id]
    subnet_id = local.public_subnet_id
    iam_instance_profile = aws_iam_instance_profile.bastion.name
    # need more for terraform
    root_block_device {
        volume_size = 50
        volume_type = "gp3" # or "gp2", depending on your preference
    }

    user_data = file("bastion.sh")
    
    tags = merge (
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-bastion"
        }
    )
}
##################

# 3️⃣ Create Instance Profile                                    # Step 3: Creating profile for EC2 to use
resource "aws_iam_instance_profile" "bastion" {                 # Creates an EC2 instance profile
  name = "bastion"                                             # Names the profile "bastion"
  role = aws_iam_role.bastion_role.name                        # Links to the IAM role created above
}