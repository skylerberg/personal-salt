include:
  - readline

{% for user in salt['pillar.get']('dotfiles:users', ['skyler']) %}
{% set home = salt['user.info'](user).home %}

.inputrc {{ user }}:
  file.managed:
    - name: {{home}}/.inputrc
    - source: salt://readline/files/.inputrc
    - user: {{ user }}
    - group: {{ user }}

{% endfor %}
