name "stackbuilder"
default_version "master"

dependency "ruby"
dependency "ruby-web-test-framework"
dependency "ruby-nagios-support"
dependency "bundler"

source git: "git@git:github/tim-group/stackbuilder.git"

relative_path "stackbuilder"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem "install puppet --version '3.7.5' --no-ri --no-rdoc", env: env
  gem "install mcollective-client --version '2.8.2' --no-ri --no-rdoc", env: env

  command "rake omnibus"
  copy "build/omnibus/*", "#{install_dir}/"

  # XXX for backwards compatibility with non-omnibus stackbuilder
  command "sed -i 's,^#!.*ruby,#!#{install_dir}/embedded/bin/ruby,' #{install_dir}/bin/puppet_enc"
  command "sed -i 's,^.*LOAD_PATH.*$,# XXX deleted by omnibus,' #{install_dir}/bin/puppet_enc"
end
