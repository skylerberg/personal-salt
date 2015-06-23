{% from "readline/map.jinja" import readline with context %}

include:
  - readline.config

{{ readline['name'] }}:
  pkg.installed
