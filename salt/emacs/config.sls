include:
  - emacs

{% for user in salt['pillar.get']('dotfiles:users', [{'username': 'skyler'}]) %}
{% set username = user.get('username', 'skyler') %}
{% set group = user.get('group', 'skyler') %}
{% set home = salt['user.info'](username).get('home', '/home/' + username)  %}

.emacs {{ username }}:
  file.managed:
    - name: {{ home }}/.emacs
    - source: salt://emacs/files/.emacs
    - user: {{ username }}
    - group: {{ group }}

.emacs.d {{ username }}:
  file.directory:
    - name: {{ home }}/.emacs.d
    - user: {{ username }}
    - group: {{ group }}

{% endfor %}
