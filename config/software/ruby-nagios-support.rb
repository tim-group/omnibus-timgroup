name "ruby-nagios-support"
default_version "master"

dependency "ruby"
dependency "rubygems"
dependency "bundler"

source git: "http://git/git/github/tim-group/ruby-nagios-support.git"

relative_path "ruby-nagios-support"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  delete "nagios-support-*.gem"

  gem "build nagios-support.gemspec", env: env
  gem "install nagios-support-*.gem --no-rdoc --no-ri", env: env
end
