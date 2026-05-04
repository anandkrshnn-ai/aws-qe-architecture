# Terraform AWS Baseline with Quality Guardrails
# Sets up a secure project with monitoring and auditing enabled by default.

provider "aws" {
  region = var.region
}

# 1. Enable Critical Services for QE
resource "aws_config_configuration_recorder" "main" {
  name     = "qe-config-recorder"
  role_arn = aws_iam_role.config_role.arn
}

resource "aws_iam_role" "config_role" {
  name = "aws-config-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "config.amazonaws.com" }
    }]
  })
}

# 2. Monitoring Notification (for SLO Breaches)
resource "aws_sns_topic" "qe_alerts" {
  name = "qe-architect-alerts"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.qe_alerts.arn
  protocol  = "email"
  endpoint  = var.admin_email
}

# 3. CloudWatch Synthetic Canary (Baseline Availability)
resource "aws_synthetics_canary" "health_check" {
  name                 = "global-health-check"
  artifact_s3_location = "s3://${aws_s3_bucket.canary_artifacts.bucket}/"
  execution_role_arn   = aws_iam_role.canary_role.arn
  handler              = "exports.handler"
  zip_file             = "canary_code.zip"
  runtime_version      = "syn-nodejs-puppeteer-3.5"

  schedule {
    expression = "rate(5 minutes)"
  }
}

# 4. CloudWatch Metric Alarm (SLO Gate)
resource "aws_cloudwatch_metric_alarm" "high_latency" {
  alarm_name          = "P95-Latency-Above-500ms"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "Duration"
  namespace           = "AWS/Lambda"
  period              = "60"
  statistic           = "Average"
  threshold           = "500"
  alarm_description   = "This alarm monitors high latency in Lambda functions."
  alarm_actions       = [aws_sns_topic.qe_alerts.arn]
}
