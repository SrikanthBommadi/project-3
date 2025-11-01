resource "aws_ssm_parameter" "sg_id" {
  count = length(var.sg_names)
  name  = "/${var.project_name}/${var.environment}/${var.sg_names[count.index]}_sg_id"
  type  = "String"
  value = module.sg[count.index].sg_id
}

# resource "null_resource" "after_ssm" {
#   depends_on = [aws_ssm_parameter.sg_id]

#   provisioner "local-exec" {
#     command = "echo 'SSM parameters created, waiting for 5 seconds...' && sleep 5"
#   }
# }
