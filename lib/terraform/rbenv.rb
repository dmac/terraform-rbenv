require "terraform"

module Terraform
  module DSL
    def ensure_rbenv
      ensure_package "git-core"
      dep "rbenv" do
        met? { in_path?("rbenv") }
        meet do
          # These instructions are from https://github.com/sstephenson/rbenv/wiki/Using-rbenv-in-Production
          shell "wget -q -O - https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash"
          # We need to run rbenv init after install, which adjusts the path. If exec is causing us problems
          # down the road, we can perhaps simulate running rbenv init without execing.
          unless ARGV.include?("--forked-after-rbenv") # To guard against an infinite forking loop.
            exec "bash -c 'source ~/.bashrc; #{$0} --forked-after-rbenv'" # $0 is the current process's name.
          end
        end
      end
    end

    # ruby_version is a rbenv ruby version string like "1.9.2-p290".
    def ensure_rbenv_ruby(ruby_version)
      ensure_rbenv
      ensure_packages "curl", "build-essential", "libxslt1-dev", "libxml2-dev", "libssl-dev"

      dep "rbenv ruby: #{ruby_version}" do
        met? { `bash -lc 'which ruby'`.include?("rbenv") && `rbenv versions`.include?(ruby_version) }
        meet do
          puts "Compiling Ruby will take a few minutes."
          shell "rbenv install #{ruby_version}"
          shell "rbenv rehash"
        end
      end
    end
  end
end

Terraform.register_plugin(__FILE__)
