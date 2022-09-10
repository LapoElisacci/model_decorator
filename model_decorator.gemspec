# frozen_string_literal: true

require_relative "lib/model_decorator/version"

Gem::Specification.new do |spec|
  spec.name = "model_decorator"
  spec.version = ModelDecorator::VERSION
  spec.authors = ["Lapo Elisacci", "Hassaan Chaudhry"]
  spec.email = ["lapoelisacci@gmail.com", "mhassaanchaudhry@gmail.com"]

  spec.summary = "The gem allows you to easily define methods to decorate your Model Classes"
  spec.description = "This wraps the logic of SimpleDelegator to use the Decorator Design Patter in a Ruby style fashion."
  spec.homepage = "https://github.com/LapoElisacci/model_decorator"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/LapoElisacci/model_decorator"
  spec.metadata["changelog_uri"] = "https://github.com/LapoElisacci/model_decorator/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
