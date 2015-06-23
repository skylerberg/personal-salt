include:
  - git

{% for user in salt['pillar.get']('dotfiles:users', [{'username': 'skyler'}]) %}
{% set username = user.get('username', 'skyler') %}
{% set group = user.get('group', 'skyler') %}
{% set home = salt['user.info'](username).get('home', '/home/' + username)  %}

.gitconfig {{ username }}:
  file.managed:
    - name: {{ home }}/.gitconfig
    - source: salt://git/files/.gitconfig
    - user: {{ username }}
    - group: {{ group }}

.gitignore {{ username }}:
  file.managed:
    - name: {{ home }}/.gitignore
    - source: salt://git/files/.gitignore
    - user: {{ username }}
    - group: {{ group }}

{% endfor %}
