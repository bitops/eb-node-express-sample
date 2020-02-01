
# This is a test of the app on Heroku

provider "heroku" {
  version = "~> 2.0"
}

variable "app_name" {
  description = "Name of the Heroku app"
}

resource "heroku_app" "example" {
  name   = "${var.app_name}"
  region = "us"
}

# Launch the app's web process by scaling-up
resource "heroku_formation" "example" {
  app        = "${heroku_app.example.name}"
  type       = "web"
  quantity   = 1
  size       = "free"
}

output "example_app_url" {
  value = "https://${heroku_app.example.name}.herokuapp.com"
}
