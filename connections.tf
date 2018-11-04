provider "google" {
    credentials = "${file("~/secrets/account.json")}"
    project     = "yourprojectname"
    region      = "us-west1"
}
