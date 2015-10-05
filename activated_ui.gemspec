$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "activated_ui/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "activated_ui"
  s.version     = ActivatedUI::VERSION
  s.authors     = ["Matthew Spence"]
  s.email       = ["msaspence@gmail.com"]
  s.homepage    = "http://github.com/msaspence/activated_ui"
  s.summary     = "Activated UI, is a collection of helpers to activate UI elements."
  s.description = "Activated UI, is a collection of helpers to activate UI elements, it achieves a similar end goal to active_link_to but you control the active state through method calls rather than the helpers inferring it from the url."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency 'rails', "~> 3.2.22"
  s.add_development_dependency 'rspec-rails', "~> 3.3.3"
  s.add_development_dependency 'spork-rails', "~> 3.2.1"
  s.add_development_dependency 'fuubar', "~> 2.0.0"
  s.add_development_dependency 'coveralls', "~> 0.8.0"

end
