name "omnibus"
default_version "master"

dependency "ruby"
dependency "bundler"
dependency "omnibus-software"

source git: "http://git/git/github/chef/omnibus.git"

relative_path "omnibus"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  bundle "install", env: env

  gem "build omnibus.gemspec", env: env
  gem "install omnibus*.gem --no-ri --no-rdoc", env: env

  link "#{install_dir}/embedded/bin/omnibus", "#{install_dir}/bin/omnibus"
end
