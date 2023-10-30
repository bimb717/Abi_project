# resource "aws_lb_target_group" "tg" {
#   name        = "TargetGroup-${var.environment_name}"
#   port        = 80
#   target_type = "instance"
#   protocol    = "HTTP"
#   vpc_id      = data.aws_vpc.main_vpc.id
# }

# resource "aws_alb_target_group_attachment" "tgattachment" {
#   count            = length(module.instance_web.instance_id)
#   target_group_arn = aws_lb_target_group.tg.arn
#   target_id        = element(module.instance_web.instance_id, count.index)
# }

# resource "aws_lb" "lb" {
#   name               = "ALB-${var.environment_name}"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = data.aws_security_groups.sgs.ids
#   subnets            = data.aws_subnets.lb_subnet.ids
# }

# resource "aws_lb_listener" "front_end" {
#   load_balancer_arn = aws_lb.lb.arn
#   port              = "80"
#   protocol          = "HTTP"
  
#   default_action {
#     target_group_arn = "${aws_lb_target_group.tg.arn}"
#     type             = "forward"
#   }
# }

# resource "aws_lb_listener_rule" "static" {
#   listener_arn = aws_lb_listener.front_end.arn
#   priority     = 100

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.tg.arn

#   }

#   condition {
#     path_pattern {
#       values = ["/var/www/html/index.html"]
#     }
#   }
# }