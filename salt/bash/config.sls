include:
  - bash

{% for user in salt['pillar.get']('dotfiles:users', ['skyler']) %}
{% set home = salt['user.info'](user).home %}

.bashrc {{ user }}:
  file.managed:
    - name: {{home}}/.bashrc
    - source: salt://bash/files/.bashrc
    - user: {{ user }}
    - group: {{ user }}

{% endfor %}
