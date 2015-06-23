{% from "c++/map.jinja" import compilers with context %}
g++:
  pkg.installed:
    - name: {{ compilers.gplusplus }}
    - unless: command -v g++
