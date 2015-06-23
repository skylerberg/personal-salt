sudo:
  pkg.installed:
    - unless: command -v sudo
