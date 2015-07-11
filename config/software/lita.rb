name "lita"

dependency "ruby"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem "install lita                --version '4.4.3' --no-ri --no-rdoc", env: env
  gem "install lita-slack          --version '1.5.0' --no-ri --no-rdoc", env: env
  # gem "install lita-jenkins        --version '0.0.3' --no-ri --no-rdoc", env: env
  gem "install lita-pagerduty      --version '0.1.0' --no-ri --no-rdoc", env: env
  gem "install lita-nagios         --version '0.1.2' --no-ri --no-rdoc", env: env
  gem "install lita-sensu          --version '0.2.0' --no-ri --no-rdoc", env: env
  gem "install lita-karma          --version '3.0.2' --no-ri --no-rdoc", env: env
  gem "install lita-directions     --version '1.0.2' --no-ri --no-rdoc", env: env
  gem "install lita-forecast       --version '0.1.7' --no-ri --no-rdoc", env: env
  # gem "install lita-boardgamegeek  --version '0.1.1' --no-ri --no-rdoc", env: env
end
