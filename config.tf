# team 1

module "team1-queue1" {
  source   = "./modules"
  name     = "test_devops_makelaars"
  messages = 10
}

module "team1-queue2" {
  source   = "./modules"
  name     = "test_devops_makelaars_errors"
  messages = 1
}

# team 2

module "team2-queue1" {
  source   = "./modules"
  name     = "test_devops_new_houses"
  messages = 10
}

/*
module "team2-queue2" {
  source   = "./modules"
  name     = "test_devops_new_houses_errors"
  messages = 1
}
*/
module "team2-queue3" {
  source   = "./modules"
  name     = "test_devops_edited_houses"
  messages = 1
  notify   = false
}

module "team2-queue4" {
  source   = "./modules"
  name     = "test_devops_edited_houses_errors"
  messages = 1
}

module "team2-queue5" {
  source   = "./modules"
  name     = "test_devops_removed_houses"
  messages = 1
  notify   = false
}

module "team2-queue6" {
  source   = "./modules"
  name     = "test_devops_removed_houses_errors"
  messages = 1
}

# team 3

module "team3-queue1" {
  source   = "./modules"
  name     = "test_devops_stats_phone_clicks"
  messages = 25
}

module "team3-queue2" {
  source   = "./modules"
  name     = "test_devops_stats_phone_clicks_errors"
  messages = 1
}

module "team3-queue3" {
  source   = "./modules"
  name     = "test_devops_stats_facebook_clicks"
  messages = 25
}

module "team3-queue4" {
  source   = "./modules"
  name     = "test_devops_stats_facebook_clicks_errors"
  messages = 1
}