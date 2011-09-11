# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "holiday/version"

Gem::Specification.new do |s|
  s.name        = "holiday"
  s.version     = Holiday::VERSION
  s.authors     = ["Sean Behan"]
  s.email       = ["bseanvt@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Holiday is a gem that lets you configure holidays for any country using a simple YAML file format.}
  s.description = %q{Holiday is a gem that lets you configure holidays for any country using a simple YAML file format.}

  s.rubyforge_project = "holiday"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "active_support"
end
