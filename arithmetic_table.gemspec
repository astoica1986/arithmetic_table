# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "arithmetic_table/version"

Gem::Specification.new do |spec|
  spec.name          = "arithmetic_table"
  spec.version       = ArithmeticTable::VERSION
  spec.authors       = ["Adrian Stoica"]
  spec.email         = ["stoica.adrian86@gmail.com"]

  spec.summary       = %q{Generates numeric tables in the terminal based on user options.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["arithmetic-table"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.4.0'
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency "gli", "~> 2.17"
  spec.add_runtime_dependency "terminal-table", "~> 1.8"
end
