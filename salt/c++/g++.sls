{% from "compilers/map.jinja" import compilers with context %}
g++:
  pkg.installed:
    - name: {{ compilers.gplusplus }}
