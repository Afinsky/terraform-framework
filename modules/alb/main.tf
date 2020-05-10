# Provision:
# - ALB Target group
# - Application Load Balancer
# - ALB Listener 80 port
# - ALB Listener 443 port
# - Route53 record for ALB endpoint






#######################
# ALB Target group    #
#######################

locals {
  tg_name = "${var.resource_name}-tg-api"
}

resource "aws_alb_target_group" "main" {
  name        = local.tg_name
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"


  #deregistration_delay               = var.tg_deregistration_delay
  #slow_start                         = var.tg_slow_start
  #lambda_multi_value_headers_enabled = var.tg_lambda_multi_value_headers_enabled
  #proxy_protocol_v2                  = var.tg_proxy_protocol_v2

  health_check {
    #  enabled             = ""
    interval            = "30"
    path                = "/api/test"
    port                = "traffic-port"
    healthy_threshold   = "5"
    unhealthy_threshold = "2"
    timeout             = "5"
    #  protocol            = ""
    #  target_type         = ""
    #  matcher             = ""
  }

  tags = merge({ Name = "${var.resource_name}-tg" }, var.tags)
}

################################################################################



##############################
# Application Load Balancer  #
##############################

locals {
  alb_name = "${var.resource_name}-alb-api"
}

resource "aws_lb" "main" {
  name               = local.alb_name
  internal           = "false"
  load_balancer_type = "application"
  security_groups    = var.alb_sg_ids
  subnets            = var.alb_subnets

  tags = merge({ Name = "${local.alb_name}" }, var.tags)
}

################################################################################


#############################
#  ALB Listeners (80, 443)  #
#############################

locals {
  api_domain = trimsuffix("api.${var.domain}", ".")
}

resource "aws_alb_listener" "redirect" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      host        = local.api_domain
      path        = "/#{path}"
      port        = "443"
      protocol    = "HTTPS"
      query       = "#{query}"
      status_code = "HTTP_301"
    }

  }
}


resource "aws_alb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.cert_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.main.arn
  }
}

################################################################################


######################################
#  A-record (Alias) to ALB Endpoint  #
######################################

resource "aws_route53_record" "alb_endpoint" {
  zone_id         = var.zone_id
  name            = local.api_domain
  type            = "A"
  allow_overwrite = true
  alias {
    zone_id                = aws_lb.main.zone_id
    name                   = aws_lb.main.dns_name
    evaluate_target_health = "false"
  }
}
################################################################################
