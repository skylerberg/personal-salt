ruby:
  pkg.latest:
    - names:
      - ruby
      - ruby-dev

rails:
  gem.installed:
    - require:
      - pkg: ruby

rspec:
  gem.installed:
    - require:
      - pkg: ruby
