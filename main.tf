resource "random_string" "preffix" {
  length  = 3
  lower   = true
  upper   = false
  special = false
}
