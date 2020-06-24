## Monitoring SQS Queues Using SNS And Email Subscriptions

### Problem
There are some SQS queues on amazon (+/- 10 queues, but the number of queues is growing
every month). Queues are for different applications, different teams, and have different
characteristics (error queues, different purposes, different thresholds etc.). The teams are
responsible for adding new queues and specifying which queues are applicable to be
monitored.

### Target
As a DevOps team we would like to monitor these queues by providing an automation solution
which creates a monitor per queue according to a definition file where the queues are
specified. So that we can be alerted whenever something goes wrong with the queues.

### Solution
- I used Terraform version (0.12.26) as the automation tool.
- The repository is accessible by GitHub.
- The definition file is `config.tf`
- I chose Email as the monitoring solution. I find it easy to modify, add or remove subscriptions.

### Setup
- Create an IAM user with sufficiant permissions to access SQS, SNS and CloudWatch (I used Admininstrator permissions).
- Configure the IAM keys using an `aws-cli`.
- Install Terraform version 0.12.26.
- Modify the `config.tf` file based on your new/existing queue requierments. For example:
```
module "team-new-queue" {
  source   = "github.com/tom-ramati/aws-terraform-sqs-sns-alarm/modules/"
  name     = "the name of the queue"
  messages = "the amount of messages you want to monitor"
  notify   = "whether to trigger an alert to the teams. default is set to true"
}
```
- Run `terraform init && terraform plan && terraform apply`

## Notes
The SNS forwarding the notifications to an Email address is unsupported from Terraform because the endpoint needs to be authorized and does not generate an ARN until the target email address has been validated. This breaks the Terraform model and as a result is not currently supported.
Therefore, the addition of the email addresses of the teams should be manual.