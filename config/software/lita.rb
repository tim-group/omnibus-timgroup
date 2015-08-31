name "lita"

dependency "ruby"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem "install lita                --no-ri --no-rdoc", env: env
  gem "install lita-slack          --no-ri --no-rdoc", env: env
  gem "install lita-jenkins        --no-ri --no-rdoc", env: env
  gem "install lita-pagerduty      --no-ri --no-rdoc", env: env
  # gem "install lita-nagios         --no-ri --no-rdoc", env: env
  gem "install lita-sensu          --no-ri --no-rdoc", env: env
  gem "install lita-karma          --no-ri --no-rdoc", env: env
  gem "install lita-directions     --no-ri --no-rdoc", env: env
  gem "install lita-forecast       --no-ri --no-rdoc", env: env
  gem "install lita-boardgamegeek  --no-ri --no-rdoc", env: env
  gem "install lita-ping           --no-ri --no-rdoc", env: env

  gem "install minitest      --version 5.7.0  --no-ri --no-rdoc", env: env
  gem "install activesupport --version 4.2.3  --no-ri --no-rdoc", env: env
  gem "install eventmachine  --version 1.0.7  --no-ri --no-rdoc", env: env

  system("echo aaaa > #{install_dir}/test")
end
