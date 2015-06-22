include:
  - python.dev
  - python.pip

nvim:
  pkgrepo.managed:
    - ppa: neovim-ppa/unstable
  pkg.latest:
    - name: neovim
    - refresh: True
  require:
    - pkg: python-dev

python-neovim:
  pip.installed:
    - name: neovim
    - require:
      - pkg: pip
