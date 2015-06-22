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

.nvimrc {{ user }}:
  file.symlink:
    - name: {{ home }}/.nvimrc
    - target: {{ home }}/.vimrc
    - user: {{ user }}
    - group: {{ user }}

{% for plugin in salt['pillar.get']('vim:plugins', []) %}
{% set url_ = plugin["url"] %}
{% set name = plugin["name"] %}

download {{ name }} for {{ user }}:
  git.latest:
    - name: {{ url_ }}
    - target: {{ home }}/.vim/bundle/{{ name }}
    - user: {{ user }}
    - require:
      - pkg: git
{% endfor %}

{% endfor %}
