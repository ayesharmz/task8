resource "aws_lb_target_group" "strapi" {
  name         = "strapi-tg"
  port         = 1337
  protocol     = "HTTP"
  vpc_id       = module.vpc.vpc_id
  target_type  = "ip"  # ✅ DO NOT change this — it's correct

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}
