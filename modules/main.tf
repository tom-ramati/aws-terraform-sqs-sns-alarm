resource "aws_sqs_queue" "queue" {
  name = var.name
}

resource "aws_sns_topic" "topic" {
  name = "notify-to-teams"
}

resource "aws_cloudwatch_metric_alarm" "alarm" {
  alarm_name        = var.name
  alarm_description = "There are more than ${var.messages} in queue ${var.name}"
  namespace         = "AWS/SQS"
  metric_name       = "NumberOfMessagesSent"
  dimensions = {
    QueueName = var.name
  }
  statistic           = "Sum"
  period              = var.period
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.messages
  evaluation_periods  = var.evaluation_period
  actions_enabled     = var.notify
  alarm_actions       = [aws_sns_topic.topic.arn]

}

