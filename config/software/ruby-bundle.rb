name "ruby-bundle"

dependency "ruby"
dependency "bundler"

dependency "ruby-web-test-framework"
dependency "ruby-nagios-support"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem "install ci_reporter --version '1.7.3' --no-ri --no-rdoc", env: env # XXX newer version available
  gem "install collimator --version '0.0.3' --no-ri --no-rdoc", env: env # stackbuilder rake sbx:audit_host_machines
  gem "install fpm --version '1.3.3' --no-ri --no-rdoc", env: env
  gem "install git --version '1.2.9.1' --no-ri --no-rdoc", env: env
  gem "install mcollective-client --version '2.8.2' --no-ri --no-rdoc", env: env
  gem "install puppet --version '3.7.5' --no-ri --no-rdoc", env: env # XXX newer version available
  gem "install rspec --version '2.13.0' --no-ri --no-rdoc", env: env # XXX newer version available
  gem "install rubocop --version '0.32.1' --no-ri --no-rdoc", env: env
  gem "install simplecov --version '0.10.0' --no-ri --no-rdoc", env: env

  # decrease 'rake spec' runtime in stackbuilder by 12 seconds:
  command "sed -i 's/if svrs = IO.select(@listeners, nil, nil, 2.0)/if svrs = IO.select(@listeners, nil, nil, 0.01)/' "\
    "#{install_dir}/embedded/lib/ruby/2.1.0/webrick/server.rb"

  link "#{install_dir}/embedded/bin/ruby", "#{install_dir}/bin/ruby"
  link "#{install_dir}/embedded/bin/rake", "#{install_dir}/bin/rake"
  link "#{install_dir}/embedded/bin/rubocop", "#{install_dir}/bin/rubocop"
end