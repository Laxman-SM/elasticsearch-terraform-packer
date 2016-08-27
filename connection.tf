# Configure the Google Cloud provider

# If you're curious about the accountjson & how it's working currently, ping me @adron on Twitter and happy to discuss.

variable "accountjson" {}

provider "google" {
  credentials = "${var.accountjson}"
  project     = "united-course-124523"
  region      = "us-central1"
}
