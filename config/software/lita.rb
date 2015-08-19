name "lita"
default_version "master"

dependency "ruby"
dependency "bundler"
dependency "git"

source git: "http://git/git/lita.git"

relative_path "lita"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "bundle install --path #{install_dir}"
end
