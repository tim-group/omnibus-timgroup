name "orc"
default_version "master"

dependency "ruby"
dependency "bundler"
dependency "git"

source git: "http://git/git/github/tim-group/orc.git"

relative_path "orc"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem "install git --version '1.2.9.1' --no-ri --no-rdoc", env: env
  gem "install mcollective-client --version '2.8.2' --no-ri --no-rdoc", env: env

  command "rake omnibus"
  copy "build/omnibus/*", "#{install_dir}/"

  # XXX for backwards compatibility with non-omnibus orc
  command "sed -i 's,^#!.*ruby,#!#{install_dir}/embedded/bin/ruby,' #{install_dir}/bin/orc"
  command "sed -i 's,^.*/opt/orctool/lib.*$,# XXX deleted by omnibus,' #{install_dir}/bin/orc"
end
