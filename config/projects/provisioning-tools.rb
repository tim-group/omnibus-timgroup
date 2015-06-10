name            "provisioning-tools-omnibus" # XXX old package is already named "provisioning-tools", fix after a while
maintainer      "infra@timgroup.com"
homepage        "https://github.com/tim-group"
description     "provisioning tools"
replace         "provisioning-tools"

install_dir     "/opt/provisioning-tools" # XXX as per above

build_version   ENV['BUILD_NUMBER'] ? ('0.0.' + ENV['BUILD_NUMBER']) : '0.0.0'
build_iteration 1

override        :ruby, version: '2.1.6'

dependency      "preparation"
dependency      "version-manifest"

dependency      "provisioning-tools"

exclude         "**/.git"
exclude         "**/bundler/git"
