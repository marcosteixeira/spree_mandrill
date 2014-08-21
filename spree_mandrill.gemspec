# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_mandrill'
  s.version     = '2.1.8.beta'
  s.summary     = 'Spree/Mandrill integration'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Marcos Teixeira'
  s.email     = 'm.viniteixeira@gmail.com'
  s.homepage  = 'http://github.com/marcosteixeira/spree_mandrill'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.1.8.beta'
  s.add_dependency 'mandrill-api', '~> 1.0.52'

  s.add_development_dependency 'sqlite3'
end
