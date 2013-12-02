$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'informo/version'

Gem::Specification.new 'informo', Informo::VERSION do |s|
  s.date	= '2013-05-03'
  s.summary	= 'Linux info wrapped in a gem'
  s.description	= 'Informo is used to gather information from your linux system'
  s.files	= `git ls-files`.split("\n") - %w[]
  s.author	= 'Rick Briganti'
  s.email	= 'jeviolle@newaliases.org'
  s.homepage	= 'http://github.com/jeviolle/informo'
end
