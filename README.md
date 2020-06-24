Monitoring SQS queues using SNS and Email subscriptions

### Problem:
There are some SQS queues on amazon (+/- 10 queues, but the number of queues is growing
every month). Queues are for different applications, different teams, and have different
characteristics (error queues, different purposes, different thresholds etc.). The teams are
responsible for adding new queues and specifying which queues are applicable to be
monitored.

### Target:
As a DevOps team we would like to monitor these queues by providing an automation solution
which creates a monitor per queue according to a definition file where the queues are
specified. So that we can be alerted whenever something goes wrong with the queues.

### Solution:
- I used Terraform version (0.12.26) as the automation tool.
- The repository is accessible by GitHub so the values can be changed easily.
- I chose Email as the monitoring solution. I find it easy to modify, add or remove subscriptions.

### Setup:
- Create an IAM user with sufficiant permissions to access SQS, SNS, CloudWatch and CloudFormation (I used admin permissions).
- Configure the IAM keys using an AWS-CLI.
- Install Terraform version 0.12.26
- Run `terraform init && terraform plan && terraform apply`



