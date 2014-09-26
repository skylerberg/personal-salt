include:
  - development.python.pip

virtualenv:
  pip.installed:
    - require:
      - pkg: pip
