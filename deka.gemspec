lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "deka/version"

Gem::Specification.new do |spec|
  spec.name          = "deka"
  spec.version       = Deka::VERSION
  spec.authors       = ["Deb Kallina"]
  spec.email         = ["deb@mortarstone.com"]
  spec.required_ruby_version = '>= 3.0.0'

  spec.summary       = "An API wrapper for Deka written in Ruby."
  spec.homepage      = "https://github.com/MortarStone/deka-ruby"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
          "public gem pushes."
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activemodel'
  spec.add_dependency 'dotenv'
  spec.add_dependency 'faraday', '>= 1.0', '< 2.0'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
