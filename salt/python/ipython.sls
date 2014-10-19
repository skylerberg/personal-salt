{% from "python/map.jinja" import python with context %}

ipython:
  pkg.installed:
    - name: {{ python.ipython }}
    - require:
      - pkg: python
