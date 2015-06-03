name "omnibus-software"
default_version "master"

dependency "ruby"
dependency "bundler"

source git: "http://git/git/github/chef/omnibus-software.git"

relative_path "omnibus-software"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem "build omnibus-software.gemspec", env: env
  gem "install omnibus-software*.gem --no-ri --no-rdoc", env: env
end
