# frozen_string_literal: true

require_relative "lib/jekyll/gh/contributors/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-gh-contributors"
  spec.version       = Jekyll::Gh::Contributors::VERSION
  spec.authors       = ["joel ibaceta"]
  spec.email         = ["mail@joelibaceta.com"]

  spec.summary       = "Jekyll plugin to generate contributors pics grid"
  spec.description   = "Jekyll plugin to generate contributors pics grid"
  spec.homepage      = "https://github.com/joelibaceta/jekyll-gh-contributors"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/joelibaceta/jekyll-gh-contributors"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
