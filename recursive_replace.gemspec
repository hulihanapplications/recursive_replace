# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{recursive_replace}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dave Hulihan", "Hulihan Applications"]
  s.date = %q{2011-09-09}
  s.description = %q{recursive_replace is a ruby gem for recursively replacing text in multiple files and directories. It also escapes special characters, so you can replace code syntax and special characters easily.}
  s.email = %q{dave@hulihanapplications.com}
  s.executables = ["recursive_replace"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/recursive_replace",
    "lib/recursive_replace.rb",
    "recursive_replace.gemspec",
    "spec/fixtures/test/back_slash",
    "spec/fixtures/test/bad",
    "spec/fixtures/test/file",
    "spec/fixtures/test/forward_slash",
    "spec/fixtures/test/good",
    "spec/fixtures/test/subdirectory/file",
    "spec/fixtures/test/syntax/file.erb",
    "spec/fixtures/test/syntax/file.rb",
    "spec/lib/recursive_replace_spec.rb",
    "spec/spec_helper.rb",
    "test/helper.rb",
    "test/test_recursive_replace.rb"
  ]
  s.homepage = %q{http://github.com/hulihanapplications/recursive_replace}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Recursive Text Replacement for Programming Languages}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<colored>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.3"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<colored>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.3"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<colored>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.3"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

