# CloudWatch Synthetic Canaries defined via Terraform
# These act as continuous quality probes in production.

resource "aws_synthetics_canary" "api_canary" {
  name                 = "api-gateway-slo-prober"
  artifact_s3_location = "s3://canary-artifacts-bucket/"
  execution_role_arn   = var.canary_role_arn
  handler              = "api_probe.handler"
  zip_file             = "api_probe.zip"
  runtime_version      = "syn-nodejs-puppeteer-3.5"

  schedule {
    expression = "rate(1 minute)"
  }

  run_config {
    timeout_in_seconds = 60
  }

  tags = {
    Layer = "API"
    Purpose = "SLO-Monitoring"
  }
}

# SLO Alarm for Canary Success Rate
resource "aws_cloudwatch_metric_alarm" "api_availability_slo" {
  alarm_name          = "API-Availability-SLO-99.9"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "5"
  metric_name         = "SuccessPercent"
  namespace           = "CloudWatchSynthetics"
  period              = "60"
  statistic           = "Average"
  threshold           = "99.9"
  alarm_description   = "Breached if API success rate falls below 99.9% over 5 minutes."
  alarm_actions       = [var.sns_topic_arn]

  dimensions = {
    CanaryName = aws_synthetics_canary.api_canary.name
  }
}
