name "lita"

dependency "ruby"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem "install lita --version '4.4.3' --no-ri --no-rdoc", env: env
  gem "install lita-slack --version '1.5.0' --no-ri --no-rdoc", env: env
end
