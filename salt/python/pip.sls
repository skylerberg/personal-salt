pip:
  pkg.installed:
    - name: python-pip
    - unless: command -v pip
