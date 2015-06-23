include:
  - python.ipython
  - python.pip
  - python.virtualenv
  - python.pylint
  - python.tk

python:
  pkg.installed:
    - names:
      - python
{% if grains['os_family'] != 'MacOS' %}
      - python-dev
{% endif %}
