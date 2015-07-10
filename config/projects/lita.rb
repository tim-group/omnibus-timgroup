name            "lita"
maintainer      "infra@timgroup.com"
homepage        "https://github.com/tim-group"
description     "lita chat robot"

install_dir     "/opt/#{name}"

build_version   ENV['BUILD_NUMBER'] ? ('0.0.' + ENV['BUILD_NUMBER']) : '0.0.0'
build_iteration 1

override        :ruby, version: '2.2.1'

dependency      "lita"

exclude         "**/.git"
exclude         "**/bundler/git"
