name "ruby-web-test-framework"
default_version "master"

dependency "ruby"
dependency "rubygems"
dependency "bundler"

source git: "http://git/git/github/tim-group/ruby-web-test-framework.git"

relative_path "ruby-web-test-framework"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  delete "web-test-framework-*.gem"

  gem "build web-test-framework.gemspec", env: env
  gem "install web-test-framework-*.gem --no-rdoc --no-ri", env: env
end
