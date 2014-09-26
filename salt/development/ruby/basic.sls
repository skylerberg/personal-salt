{% from "development/ruby/map.jinja" import ruby with context %}

ruby:
  pkg.latest:
    - names:
      - ruby
      - {{ ruby.dev }}
