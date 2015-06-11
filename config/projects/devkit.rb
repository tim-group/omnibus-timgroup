name            "devkit"
maintainer      "infra@timgroup.com"
homepage        "https://github.com/tim-group"
description     "timgroup devkit"

install_dir     "/opt/#{name}"

build_version   Omnibus::BuildVersion.semver
build_iteration 1

override        :ruby, version: '2.1.6'

dependency      "preparation"
dependency      "version-manifest"

dependency      "devkit"
dependency      "omnibus"

exclude         "**/.git"
exclude         "**/bundler/git"
