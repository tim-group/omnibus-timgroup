name            "stackbuilder"
maintainer      "infra@timgroup.com"
homepage        "https://github.com/tim-group"
description     "stackbuilder"
replace         "stacks" # XXX

install_dir     "/opt/#{name}"

build_version   ENV['BUILD_NUMBER'] ? ('0.0.' + ENV['BUILD_NUMBER']) : '0.0.0'
build_iteration 1

override        :ruby, version: '2.1.6'

dependency      "preparation"
dependency      "version-manifest"

dependency      "stackbuilder"

exclude         "**/.git"
exclude         "**/bundler/git"
