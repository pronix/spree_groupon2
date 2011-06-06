Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_groupon2'
  s.version     = '0.60.00'
  s.summary     = 'Add grouon function to spree project'
  s.description = 'Add grouon function to spree project'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Pronix LLC'
  s.email             = 'root@tradefast.ru'
  s.homepage          = 'http://tradefast.ru'
  # s.rubyforge_project = 'actionmailer'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '>= 0.60.00')
  s.add_dependency('spree_robokassa', '~> 0.50.1')
end
