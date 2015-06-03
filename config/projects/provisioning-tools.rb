name "provisioning-tools"
maintainer "infra@timgroup.com"
homepage "https://github.com/tim-group"

install_dir "/opt/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

override :ruby, version: '1.9.3-p550'

dependency "preparation"
dependency "version-manifest"

dependency "provisioning-tools"

exclude "**/.git"
exclude "**/bundler/git"
