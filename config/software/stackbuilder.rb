name "stackbuilder"
default_version "master"

dependency "ruby"
dependency "bundler"

dependency "ruby-web-test-framework"
dependency "ruby-nagios-support"

source git: "http://git/git/github/tim-group/stackbuilder.git"

relative_path "stackbuilder"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem "install rspec --version '2.13.0' --no-ri --no-rdoc", env: env
  gem "install puppet --version '3.7.5' --no-ri --no-rdoc", env: env
  gem "install mcollective-client --version '2.8.2' --no-ri --no-rdoc", env: env
  gem "install collimator --version '0.0.3' --no-ri --no-rdoc", env: env
  gem "install git --version '1.2.9.1' --no-ri --no-rdoc", env: env # XXX orc

  command "rake omnibus"
  copy "build/omnibus/*", "#{install_dir}/"

  # XXX for backwards compatibility with non-omnibus stackbuilder
  command "sed -i 's,^#!.*ruby,#!#{install_dir}/embedded/bin/ruby,' #{install_dir}/bin/puppet_enc"
  command "sed -i 's,^.*LOAD_PATH.*$,# XXX deleted by omnibus,' #{install_dir}/bin/puppet_enc"
end
