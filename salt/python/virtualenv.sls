include:
  - python.pip

virtualenv:
  pip.installed:
    - require:
      - pkg: pip
