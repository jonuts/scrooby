require "rake/gempackagetask"

spec = Gem::Specification.new do |s|
  s.name          = "scrooby"
  s.version       = '0.0.2'
  s.require_path  = "lib"
  s.platform      = Gem::Platform::RUBY
  s.files         = ["lib/scroogle.rb"]
  s.summary       = 'simple scraper of a scraper'
end

Rake::GemPackageTask.new(spec) {}
