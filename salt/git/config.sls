include:
  - git

{% for user in salt['pillar.get']('dotfiles:users', ['skyler']) %}
{% set home = salt['user.info'](user).home %}

.gitconfig {{ user }}:
  file.managed:
    - name: {{home}}/.gitconfig
    - source: salt://git/files/.gitconfig
    - user: {{ user }}
    - group: {{ user }}

.gitignore {{ user }}:
  file.managed:
    - name: {{home}}/.gitignore
    - source: salt://git/files/.gitignore
    - user: {{ user }}
    - group: {{ user }}

{% endfor %}
