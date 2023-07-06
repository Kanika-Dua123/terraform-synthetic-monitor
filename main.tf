resource "newrelic_synthetics_monitor" "monitor" {
  for_each         = var.monitor
  status           = each.value.status
  name             = each.value.name
  period           = each.value.period
  uri              = each.value.uri
  type             = each.value.type
  locations_public = each.value.locations_public

  custom_header {
    name  = each.value.customname
    value = each.value.customvalue
  }

  treat_redirect_as_failure = each.value.treat_redirect_as_failure
  validation_string         = each.value.validation_string
  bypass_head_request       = each.value.bypass_head_request
  verify_ssl                = each.value.verify_ssl

  tag {
    key    = each.value.key
    values = each.value.values
  }
}

resource "newrelic_synthetics_private_location" "location" {
  description               = " private location"
  name                      = "location"
  verified_script_execution = false
}

resource "newrelic_synthetics_monitor" "ping_monitor" {
    for_each=var.ping_monitor
  status           = each.value.status
  name             = each.value.name
  period           = each.value.period
  uri              = each.value.uri
  type             = each.value.type
  locations_private = [newrelic_synthetics_private_location.location.id]

  custom_header {
    name  = each.value.name
    value = each.value.value
  }

  treat_redirect_as_failure = each.value.treat_redirect_as_failure
  validation_string         = each.value.validation_string 
  bypass_head_request       = each.value.bypass_head_request
  verify_ssl                = each.value.verify_ssl 

  tag {
    key    = each.value.key
    values = each.value.values
  }
}
  