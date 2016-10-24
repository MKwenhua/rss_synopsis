# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rss_synopsis/version'

Gem::Specification.new do |spec|
  spec.name          = "rss_synopsis"
  spec.version       = RssSynopsis::VERSION
  spec.authors       = ["Peter Halloran"]
  spec.email         = ["mkwenhua101@gmail.com"]

  spec.summary       = %q{Produces text summaries of RSS feeds}
  spec.description   = %q{Produces text summaries of RSS feeds}
  spec.homepage      = "http://exmaple.com"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "summarize"
  spec.add_dependency "simple-rss"
  spec.add_dependency "htmlentities"
  spec.add_dependency "actionview"
  #spec.add_dependency "action_view"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
