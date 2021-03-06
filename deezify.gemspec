# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deezify/version'

Gem::Specification.new do |spec|
  spec.name          = 'deezify'
  spec.version       = Deezify::VERSION
  spec.authors       = ['Dmitry Sirotenko']
  spec.email         = ['dmitriy.sirotencko@gmail.com']

  spec.summary       = %q{A simple command line tool which transfers spotify playlists to your deezer account.}
  spec.homepage      = 'https://github.com/dmsirotenko/deezify'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = ['deezify']
  spec.require_paths = ['lib']

  spec.add_dependency 'thor'
  spec.add_dependency 'faraday'
  spec.add_dependency 'rspotify'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
end
