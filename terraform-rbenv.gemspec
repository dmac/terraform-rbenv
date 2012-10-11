# -*- encoding: utf-8 -*-
require File.expand_path('../lib/terraform-rbenv/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Phil Crosby", "Daniel MacDougall"]
  gem.email         = ["dmacdougall@gmail.com"]
  gem.summary       = %q{Terraform deps for installing rbenv and rubies.}
  gem.homepage    = "http://github.com/dmacdougall/terraform-rbenv"

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "terraform-rbenv"
  gem.require_paths = ["lib"]
  gem.version       = Terraform::Rbenv::VERSION
end
