{% from "vim/map.jinja" import vim with context %}

include:
  - git
  - vim

{% for user in salt['pillar.get']('dotfiles:users', ['skyler']) %}
{% set home = salt['user.info'](user).home %}

.vimrc {{ user }}:
  file.managed:
    - name: {{home}}/.vimrc
    - source: salt://vim/files/.vimrc
    - user: {{ user }}
    - group: {{ user }}

vundle {{ user }}:
  git.latest:
    - name: https://github.com/gmarik/Vundle.vim.git
    - target: {{home}}/.vim/bundle/Vundle.vim
    - user: {{ user }}
    - group: {{ user }}
    - require:
      - pkg: git

install plugins vundel {{ user }}:
  cmd.run:
    - name: vim +PluginInstall +qall 
    - user: {{ user }}
    - require:
      - pkg: {{ vim['name'] }}
      - file: .vimrc {{ user }}
      - git: vundle {{ user }}

{% endfor %}
