Gem::Specification.new do |s|
  s.name = 'y_combinator'
  s.version = '0.0.1'
  s.date = '2015-02-26'
  s.summary = 'Defines a method that returns the Y combinator'
  s.description = 'Sometimes, you need some Y combinators to write anonymous recursive functions. Typing out the Y combinator every time you need it is annoying. Use this instead.'
  s.authors = ['Andrew Mason']
  s.email = 'mason@case.edu'
  s.files = Dir.glob('lib/**/*')
  s.require_path = 'lib'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.homepage = 'https://github.com/ajm188/y_combinator'
  s.license = 'MIT'
end
