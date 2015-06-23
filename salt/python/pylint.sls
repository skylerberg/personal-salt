include:
  - python.pip

pylint:
  pip.installed:
    - require:
      - pkg: pip

{% for user in salt['pillar.get']('dotfiles:users', [{'username': 'skyler'}]) %}
{% set username = user.get('username', 'skyler') %}
{% set group = user.get('group', 'skyler') %}
{% set home = salt['user.info'](username).get('home', '/home/' + username)  %}

.pylintrc {{ username }}:
  file.managed:
    - name: {{ home }}/.pylintrc
    - source: salt://python/files/.pylintrc
    - user: {{ username }}
    - group: {{ group }}

{% endfor %}
