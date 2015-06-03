name "provisioning-tools"
default_version "master"

dependency "ruby"
dependency "bundler"

source git: "git@git:github/tim-group/provisioning-tools.git"

relative_path "provisioning-tools"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "rake omnibus"
  copy "build/omnibus/*", "#{install_dir}/"

  # XXX for backwards compatibility with non-omnibus orc
  command "sed -i 's,^#!.*ruby.*$,#!#{install_dir}/embedded/bin/ruby,' #{install_dir}/bin/dns"
  command "sed -i 's,^#!.*ruby.*$,#!#{install_dir}/embedded/bin/ruby,' #{install_dir}/bin/provision"
end
