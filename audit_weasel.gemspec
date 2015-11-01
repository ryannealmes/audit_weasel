# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'audit_weasel/version'

Gem::Specification.new do |spec|
  spec.name          = 'audit_weasel'
  spec.version       = AuditWeasel::VERSION
  spec.authors       = ['Ryan-Neal Mes']
  spec.email         = ['ryan.mes@gmail.com']
  spec.summary       = %q{Keeps track of user changes.}
  spec.description   = %q{Uses created_by_user_id and updated_by_user_id to
    store the changes made to a record. This is limited to storing the user
    who created the record and the last user to update the record.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'

  spec.add_dependency 'activerecord', '>= 4.0.0'
  spec.add_dependency 'activesupport', '>= 4.0.0'
end
