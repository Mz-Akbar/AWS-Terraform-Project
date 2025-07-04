resource "aws_sns_topic" "notification" {
  name = "user-updates-topic"
}


resource "aws_sns_topic_subscription" "example_email_subscription" {
  topic_arn = aws_sns_topic.notification.arn
  protocol  = "email"
  endpoint  = "muhammadzafirulakbar88@gmail.com" 
}
