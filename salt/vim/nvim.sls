include:
  - python.dev

nvim:
  pkgrepo.managed:
    - ppa: neovim-ppa/unstable
  pkg.latest:
    - name: neovim
    - refresh: True
  require:
    - python-dev
