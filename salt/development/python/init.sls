{% from "development/python/map.jinja" import python with context %}

python:
  pkg.installed

pip:
  pkg.installed:
    - name: python-pip

virtualenv:
  pip.installed:
    - require:
      - pkg: pip

ipython:
  pkg.installed:
    - name: {{ python.ipython }}
    - require:
      - pkg: python
