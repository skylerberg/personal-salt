include:
  - emacs

{% for user in salt['pillar.get']('dotfiles:users', ['skyler']) %}
{% set home = salt['user.info'](user).home %}

.emacs {{ user }}:
  file.managed:
    - name: {{home}}/.emacs
    - source: salt://emacs/files/.emacs
    - user: {{ user }}
    - group: {{ user }}

{% endfor %}
