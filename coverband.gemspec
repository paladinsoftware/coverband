# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coverband/version'

Gem::Specification.new do |spec|
  spec.name          = 'coverband'
  spec.version       = Coverband::VERSION
  spec.authors       = ['Dan Mayer']
  spec.email         = ['dan@mayerdan.com']
  spec.description   = 'Rack middleware to help measure production code usage (LOC runtime usage)'
  spec.summary       = 'Rack middleware to help measure production code usage (LOC runtime usage)'
  spec.homepage      = 'https://github.com/danmayer/coverband'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n").reject { |f| f.start_with?('docs') }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'aws-sdk-s3'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'mocha', '~> 0.14.0'
  spec.add_development_dependency 'rack'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'test-unit'
  spec.add_development_dependency 'redis'
  spec.add_development_dependency 'benchmark-ips'
  spec.add_development_dependency 'm'

  # used for benchmarking and tests
  spec.add_development_dependency 'classifier-reborn'
  # add when debugging
  # require 'byebug'; byebug
  spec.add_development_dependency 'pry-byebug'

  # todo make an optional dependency for simplecov reports
  # also likely should just require simplecov-html not the whole lib
  spec.add_runtime_dependency 'simplecov', '> 0.11.1'
end
