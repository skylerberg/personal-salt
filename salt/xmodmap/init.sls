{% from "xmodmap/map.jinja" import xmodmap with context %}

{{ xmodmap['name'] }}:
  pkg.installed
