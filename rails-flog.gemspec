# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flog/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-flog-disable-sql-format"
  spec.version       = Flog::VERSION
  spec.authors       = ["shu0115"]
  spec.email         = ["s.matsumoto0115@gmail.com"]
  spec.description   = %q{This formats parameters and sql in rails log.}
  spec.summary       = %q{Rails log formatter for parameters and sql}
  spec.homepage      = "https://github.com/shu0115/rails-flog-disable-sql-format"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "mocha"

  spec.add_dependency "rails", ">=3.2.0"
  spec.add_dependency "anbt-sql-formatter"
  spec.add_dependency "awesome_print"
end
