{% for user in salt['pillar.get']('dotfiles:users', [{'username': 'skyler'}]) %}
{% set username = user.get('username', 'skyler') %}
{% set group = user.get('group', 'skyler') %}
{% set home = salt['user.info'](username).get('home', '/home/' + username)  %}

.bashrc {{ username }}:
  file.managed:
    - name: {{ home }}/.bashrc
    - source: salt://bash/files/.bashrc
    - user: {{ username }}
    - group: {{ group }}

{% endfor %}
