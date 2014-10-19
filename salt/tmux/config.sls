{% for user in salt['pillar.get']('dotfiles:users', ['skyler']) %}
{% set home = salt['user.info'](user).home %}

.tmux.conf {{ user }}:
  file.managed:
    - name: {{home}}/.tmux.conf
    - source: salt://tmux/files/.tmux.conf
    - user: {{ user }}
    - group: {{ user }}

{% endfor %}
