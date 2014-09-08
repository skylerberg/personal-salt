{% from "development/python/map.jinja" import python with context %}

python:
  pkg.installed

ipython:
  pkg.installed:
    - name: {{ python.ipython }}
    - require:
      - pkg: python
