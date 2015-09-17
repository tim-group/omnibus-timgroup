name 'ruby-bundle'

dependency 'ruby'
dependency 'bundler'

dependency 'ruby-web-test-framework'
dependency 'ruby-nagios-support'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem 'install ci_reporter --version 2.0.0 --no-ri --no-rdoc', env: env
  gem 'install ci_reporter_rspec --version 1.0.0 --no-ri --no-rdoc', env: env
  gem 'install collimator --version 0.0.3 --no-ri --no-rdoc', env: env          # stackbuilder
  gem 'install fpm --version 1.3.3 --no-ri --no-rdoc', env: env
  gem 'install git --version 1.2.9.1 --no-ri --no-rdoc', env: env
  gem 'install mcollective-client --version 2.8.2 --no-ri --no-rdoc', env: env
  gem 'install puppet --version 3.7.5 --no-ri --no-rdoc', env: env              # XXX not needed when 'exec' indirector used (sb)
  gem 'install rspec --version 3.3.0 --no-ri --no-rdoc', env: env
  gem 'install rubocop --version 0.32.1 --no-ri --no-rdoc', env: env
  gem 'install simplecov --version 0.10.0 --no-ri --no-rdoc', env: env
  gem 'install rotp --version 2.1.1 --no-ri --no-rdoc', env: env
  gem 'install mcollective-test --version 0.4.3 --no-ri --no-rdoc', env: env    # dbupdate
  gem 'install mocha --version 1.1.0 --no-ri --no-rdoc', env: env               # dbupdate
  gem 'install rspec-puppet --version 2.2.0 --no-ri --no-rdoc', env: env        # puppet
  gem 'install net-ssh --version 2.9.2 --no-ri --no-rdoc', env: env             # deployapp
  gem 'install net-scp --version 1.2.1 --no-ri --no-rdoc', env: env             # deployapp

  # decrease 'rake spec' runtime in stackbuilder by 12 seconds:
  command "sed -i 's/if svrs = IO.select(@listeners, nil, nil, 2.0)/if svrs = IO.select(@listeners, nil, nil, 0.01)/' "\
    "#{install_dir}/embedded/lib/ruby/2.1.0/webrick/server.rb"

  link "#{install_dir}/embedded/bin/ruby", "#{install_dir}/bin/ruby"
  link "#{install_dir}/embedded/bin/rake", "#{install_dir}/bin/rake"
  link "#{install_dir}/embedded/bin/rspec", "#{install_dir}/bin/rspec"
  link "#{install_dir}/embedded/bin/rubocop", "#{install_dir}/bin/rubocop"
end
