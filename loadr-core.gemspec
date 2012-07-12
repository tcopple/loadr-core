# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "loadr-core/version"

Gem::Specification.new do |s|
  s.name        = "loadr-core"
  s.version     = Loadr::Core::VERSION
  s.authors     = ["tcopple"]
  s.email       = ["j.tylercopple@gmail.com"]
  s.homepage    = "http://www.tcopp.com"
  s.summary     = %q{The core classes and utilties for the loadr}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "loadr"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
end
