require "terraform"

Terraform.register_plugin(
    File.join(File.expand_path(File.dirname(File.dirname(__FILE__))), "terraform-rbenv/rbenv.rb"))
