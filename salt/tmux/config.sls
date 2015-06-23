include:
  - tmux

{% for user in salt['pillar.get']('dotfiles:users', [{'username': 'skyler'}]) %}
{% set username = user.get('username', 'skyler') %}
{% set group = user.get('group', 'skyler') %}
{% set home = salt['user.info'](username).get('home', '/home/' + username)  %}

.tmux.conf {{ username }}:
  file.managed:
    - name: {{home}}/.tmux.conf
    - source: salt://tmux/files/.tmux.conf
    - user: {{ username }}
    - group: {{ group }}

{% endfor %}
