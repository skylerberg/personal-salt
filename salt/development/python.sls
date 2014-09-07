python:
  pkg.installed

ipython:
  pkg.installed:
    - require:
      - pkg: python
