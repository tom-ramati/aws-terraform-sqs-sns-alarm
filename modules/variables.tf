variable "name" {
  description = "The name of the queue"
}

variable "messages" {
  type        = string
  description = "This parameter is required for alarms based on static thresholds"
}

variable "period" {
  default     = 60
  description = "The period in seconds over which the specified statistic is applied."
}

variable "evaluation_period" {
  default     = 1
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "notify" {
  description = " Indicates whether or not actions should be executed during any changes to the alarm's state"
  default     = true
}
