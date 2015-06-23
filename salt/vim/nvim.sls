include:
  - python
  - python.pip

nvim:
{% if grains["os_family"] == "Debian" %}
  pkgrepo.managed:
    - ppa: neovim-ppa/unstable
{% endif %}
  pkg.installed:
    - name: neovim
    - refresh: True
{% if grains["os_family"] == "MacOS" %}
    - tap: neovim/neovim
{% endif %}
  require:
    - pkg: python

python-neovim:
  pip.installed:
    - name: neovim
    - require:
      - pkg: pip
