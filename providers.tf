terraform {
  required_version = "~> 1.0"
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

# Configure the New Relic provider
provider "newrelic" {
  account_id = 3930395
  api_key    = "9ef6c000495d90b59b7acaa2c3944317ff3aNRAL" # usually prefixed with 'NRAK'
  region     = "US"                                       # Valid regions are US and EU
}