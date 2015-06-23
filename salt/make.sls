make:
  pkg.installed:
    - unless: command -v make
