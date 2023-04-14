resource "aws_launch_template" "WebServerTemplate" {
  name        = var.launch_template_name
  description = var.launch_template_description

  update_default_version = true

  image_id      = var.launch_template_image_id
  instance_type = var.launch_template_instance_type

  key_name = var.launch_template_key_name

  network_interfaces {
    associate_public_ip_address = var.launch_template_network_interface.associate_public_ip_address
    security_groups             = [aws_security_group.project21_webtier_sg.id]
  }

  user_data = base64encode(var.launch_template_user_data)
}
