{% from "ruby/map.jinja" import ruby with context %}

ruby:
  pkg.installed:
    - names:
      - ruby
{% if grains["os_family"] != "MacOS" %}
      - {{ ruby.dev }}
{% endif %}
