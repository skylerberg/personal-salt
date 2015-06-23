include:
  - vim.nvim
  - vim.config
  - vim.ropevim
  - vim.ycm

{% from "vim/map.jinja" import vim with context %}

{{ vim['name'] }}:
  pkg.installed
