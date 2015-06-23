{% from "vim/map.jinja" import vim with context %}

include:
  - git

{% for user in salt['pillar.get']('dotfiles:users', [{'username': 'skyler'}]) %}
{% set username = user.get('username', 'skyler') %}
{% set group = user.get('group', 'skyler') %}
{% set home = salt['user.info'](username).get('home', '/home/' + username)  %}

.vimrc {{ username }}:
  file.managed:
    - name: {{ home }}/.vimrc
    - source: salt://vim/files/.vimrc
    - user: {{ username }}
    - group: {{ group }}

.nvimrc {{ username }}:
  file.symlink:
    - name: {{ home }}/.nvimrc
    - target: {{ home }}/.vimrc
    - user: {{ username }}
    - group: {{ group }}

{% for plugin in salt['pillar.get']('vim:plugins', []) %}
{% set url_ = plugin["url"] %}
{% set name = plugin["name"] %}

download {{ name }} for {{ username }}:
  git.latest:
    - name: {{ url_ }}
    - target: {{ home }}/.vim/bundle/{{ name }}
    - user: {{ username }}
    - require:
      - pkg: git
{% endfor %}

{% endfor %}
