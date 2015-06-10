name            "stackbuilder"
maintainer      "infra@timgroup.com"
homepage        "https://github.com/tim-group"
description     "stackbuilder"
replace         "stacks" # XXX

install_dir     "/opt/#{name}"

build_version   ENV['BUILD_NUMBER'] ? ('0.0.' + ENV['BUILD_NUMBER']) : '0.0.0'
build_iteration 1

override        :ruby, version: '1.9.3-p550'

dependency      "preparation"
dependency      "version-manifest"

dependency      "stackbuilder"

exclude         "**/.git"
exclude         "**/bundler/git"
