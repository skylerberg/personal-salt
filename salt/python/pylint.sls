include:
  - python.pip

pylint:
  pip.installed:
    - require:
      - pkg: pip


{% for user in salt['pillar.get']('dotfiles:users', ['skyler']) %}
{% set home = salt['user.info'](user).home %}

.pylintrc {{ user }}:
  file.managed:
    - name: {{home}}/.pylintrc
    - source: salt://python/files/.pylintrc
    - user: {{ user }}
    - group: {{ user }}

{% endfor %}
