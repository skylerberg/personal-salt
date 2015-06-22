include:
  - vim.nvim

{% from "vim/map.jinja" import vim with context %}

{{ vim['name'] }}:
  pkg.installed
