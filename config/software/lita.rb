name "lita"
default_version "master"

dependency "ruby"
dependency "bundler"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem "install lita --version '4.4.3' --no-ri --no-rdoc", env: env

  command "rake omnibus"
  copy "build/omnibus/*", "#{install_dir}/"

end
