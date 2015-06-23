include:
  - readline

{% for user in salt['pillar.get']('dotfiles:users', [{'username': 'skyler'}]) %}
{% set username = user.get('username', 'skyler') %}
{% set group = user.get('group', 'skyler') %}
{% set home = salt['user.info'](username).get('home', '/home/' + username)  %}

.inputrc {{ username }}:
  file.managed:
    - name: {{ home }}/.inputrc
    - source: salt://readline/files/.inputrc
    - user: {{ username }}
    - group: {{ group }}

{% endfor %}
