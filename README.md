# Terraform::Rbenv

Plugin for installing rbenv and rubies with Terraform.


## API

This plugin adds two helpers to Terraform:

    ensure_rbenv - Ensures that rbenv is installed.
    ensure_rbenv_ruby(ruby_version) - Ensures the specified ruby version is installed with rbenv.
        ruby_version - A string of the form "1.9.3-p194"


## Usage

Add this line to your application's Gemfile:

    gem "terraform-rbenv"

Then in the code that writes out your Terraform dsl files:

    require "terraform"
    require "terraform/rbenv"

    Terraform.write_dsl_files("./terraform")

Your Terraform script should look similar to the following:

    require "./terraform/dsl.rb"
    Dir["./terraform/*.rb"].each { |plugin| require plugin }
    include Terraform::DSL

    ensure_rbenv_ruby("1.9.3-p194")

    # Other deps...

    satisfy_dependencies
