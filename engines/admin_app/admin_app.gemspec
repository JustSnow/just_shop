$:.push File.expand_path('../lib', __FILE__)

require 'admin_app/version'

Gem::Specification.new do |s|
  s.name        = 'admin_app'
  s.version     = AdminApp::VERSION
  s.authors     = ['JustSnow']
  s.email       = ['justsnow17@yandex.ru']
  s.homepage    = 'http://not.yet'
  s.summary     = 'AdminApp engine for shop'
  s.description = 'AdminApp engine for shop'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'README.mardown']

  s.add_dependency 'rails', '~> 4.2.4'
end
